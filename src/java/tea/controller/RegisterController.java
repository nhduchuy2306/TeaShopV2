/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tea.user.UserDAO;
import tea.user.UserDTO;
import tea.user.UserError;


/**
 *
 * @author Huy
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private static final String ERROR = "/client/register.jsp";
    private static final String SUCCESS = "/client/login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String username = request.getParameter("username");
            String confirm = request.getParameter("confirm");
            String role = request.getParameter("role");
            String created = request.getParameter("created");
            
            boolean checkEmail = new UserDAO().isDuplicateEmail(email);

            boolean validation = true;

            if (name.length() > 50 || name.length() < 2) {
                userError.setName("Length must be in[2,50]");
                validation = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirm("Not the same as password");
                validation = false;
            }
            if (username.length() > 50 || username.length() < 2) {
                userError.setUsername("Length must be in[2,50]");
                validation = false;
            }
            if (!email.contains("@")) {
                userError.setEmail("Email must have @");
                validation = false;
            }
            if (checkEmail) {
                userError.setEmail("Email is existed");
                validation = false;
            }
            if (validation) {
                UserDTO u = new UserDTO(name, email, address, phone, Date.valueOf(created), role, password, username);
                boolean check = new UserDAO().register(u);
                if (check) {
                    request.setAttribute("REGISTER_SUCCESS", "register successfully!!");
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("REGISTER_SUCCESS", "register Fail!!");
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at RegisterController: "+ e.toString());
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
