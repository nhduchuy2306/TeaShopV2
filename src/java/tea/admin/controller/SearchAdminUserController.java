/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.admin.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tea.user.UserDAO;
import tea.user.UserDTO;


/**
 *
 * @author Huy
 */
@WebServlet(name = "SearchAdminController", urlPatterns = {"/SearchAdminUserController"})
public class SearchAdminUserController extends HttpServlet {

    private static final String ERROR = "UserManagementController";
    private static final String SUCCESS = "/admin/userTable.jsp";
///client/user-management.jsp
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("searchadmin");
            UserDAO userDAO = new UserDAO();
            List<UserDTO> listuser = userDAO.search(search);
            
            if (listuser != null && !listuser.isEmpty()) {
                request.setAttribute("LIST_USER", listuser);
                request.setAttribute("search", search);
                url = SUCCESS;
            }
            else{
                request.setAttribute("ERROR", "CAN'T FIND ANY USER!!");
            }
        } catch (Exception e) {
            log("Error at SearchAdminUserController: "+e.toString());
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
