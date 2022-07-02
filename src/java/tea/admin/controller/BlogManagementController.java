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
import javax.servlet.http.HttpSession;
import tea.blognew.BlogNewDAO;
import tea.blognew.BlogNewDTO;
import tea.user.UserDTO;


/**
 *
 * @author Huy
 */
@WebServlet(name = "BlogManagementController", urlPatterns = {"/BlogManagementController"})
public class BlogManagementController extends HttpServlet {

    private static final String ERROR = "/admin/blogTable.jsp";
    private static final String SUCCESS = "/admin/blogTable.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO u = (UserDTO) session.getAttribute("USER_LOGIN");
            if (u == null) {
                url = ERROR;
                return;
            } 
            else if (u.getRoleID().equals("2")) {
                url = ERROR;
                return;
            }
            List<BlogNewDTO> blogList = new BlogNewDAO().getAllBlogNew();
            if(blogList!=null || !blogList.isEmpty()){
                request.setAttribute("BLOG_LIST", blogList);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at BlogManagementController: "+ e.toString());
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
