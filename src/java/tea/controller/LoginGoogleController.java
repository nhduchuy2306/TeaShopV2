/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tea.google.GoogleUser;
import tea.google.GoogleUtils;
import tea.user.UserDAO;
import tea.user.UserDTO;

/**
 *
 * @author Huy
 */
@WebServlet(name = "LoginGoogleController", urlPatterns = {"/login-google"})
public class LoginGoogleController extends HttpServlet {

    private static final String ERROR = "/client/login.jsp";
    private static final String REGISTER = "/client/register.jsp";
    private static final String ADMIN_PAGE = "UserManagementController";
    private static final String USER_PAGE = "HomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                url = ERROR;
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GoogleUser user = GoogleUtils.getUserInfo(accessToken);
                // kiểm đã đã tồn tại mail trong db chưa, nếu rồi thì sẽ cho login bằng gmail thông qua vào home
                // còn nếu chưa thì sẽ điều hướng qua bên register yêu cầu đăng ký tài khoản
                boolean checkEmail = new UserDAO().isDuplicateEmail(user.getEmail());
                if (checkEmail) {
                    UserDTO u = new UserDAO().getUserByEmail(user.getEmail());
                    String role = u.getRoleID();
                    if (role.equals("1")) {
                        url = ADMIN_PAGE;
                        session.setAttribute("USER_LOGIN", u);
                    } else if (role.equals("2")) {
                        url = USER_PAGE;
                        session.setAttribute("USER_LOGIN", u);
                    }
                } else {
                    url = REGISTER;
                    session.setAttribute("GOOGLE_LOGIN", user);
                }
            }
        } catch (Exception e) {
            log("Error at loginGoogleController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
