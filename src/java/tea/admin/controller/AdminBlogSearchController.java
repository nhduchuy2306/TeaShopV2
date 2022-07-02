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
import tea.blognew.BlogNewDAO;
import tea.blognew.BlogNewDTO;


/**
 *
 * @author Huy
 */
@WebServlet(name = "AdminBlogSearchController", urlPatterns = {"/AdminBlogSearchController"})
public class AdminBlogSearchController extends HttpServlet {

    private static final String ERROR = "/admin/blogTable.jsp";
    private static final String SUCCESS = "/admin/blogTable.jsp";
    private static final String BLOG_PAGE = "MainController?action=Admin-Blog";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String searchadmin = request.getParameter("searchadmin");
            List<BlogNewDTO> bloglist = new BlogNewDAO().getBlogNewByBlogTitle(searchadmin);
            if(searchadmin.equals("")){
                url = BLOG_PAGE;
            }
            else if(bloglist.size() > 0){
                request.setAttribute("BLOG_LIST", bloglist);
                request.setAttribute("search", searchadmin);
                url = SUCCESS;
            }
            else{
                request.setAttribute("ERROR", "CAN'T FIND ANY BLOG NEW");
            }
        } catch (Exception e) {
            log("Error at AdminBlogSearchController: "+ e.toString());
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
