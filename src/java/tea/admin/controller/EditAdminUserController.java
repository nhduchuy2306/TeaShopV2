/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.admin.controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tea.user.UserDAO;
import tea.user.UserDTO;

/**
 *
 * @author Huy
 */
@WebServlet(name = "EditAdminController", urlPatterns = {"/EditAdminUserController"})
public class EditAdminUserController extends HttpServlet {

    private static final String ERROR = "UserManagementController";
    private static final String SUCCESS = "UserManagementController";
    private static final String LOGIN = "/client/login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("USER_LOGIN");
            System.out.println(loginUser);

            String userID = request.getParameter("userID");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String created = request.getParameter("created");
            String role = request.getParameter("role");
            String username = request.getParameter("username");
            String password = "******";
            UserDAO dao = new UserDAO();
            boolean check = dao.update(new UserDTO(userID, name, email, address, phone, Date.valueOf(created), role, password, username));
            if (check) {
                request.setAttribute("SUCCESS", "UPDATE USER SUCCESSFULLY!");
                url = SUCCESS;
                if (loginUser.getUserID().equals(userID)) {
                    loginUser.setName(name);
                    loginUser.setRoleID(new UserDAO().getRoleID(role));
                    if(!loginUser.getRoleID().equals("1")){
                        url = LOGIN;
                    }
                }
            } else {
                request.setAttribute("ERROR", "UPDATE USER FAIL!");
            }
            System.out.println(url);
        } catch (Exception e) {
            log("Error at EditAdminUserController: "+ e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
