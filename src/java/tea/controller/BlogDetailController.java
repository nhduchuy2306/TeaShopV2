/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.controller;

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
@WebServlet(name = "BlogDetailController", urlPatterns = {"/BlogDetailController"})
public class BlogDetailController extends HttpServlet {

    private static final String ERROR = "/client/404.jsp";
    private static final String SUCCESS = "/client/blog-single.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String blogID = request.getParameter("bID");
            BlogNewDTO bn = new BlogNewDAO().getBlogNewByBlogID(blogID);
            List<BlogNewDTO> BlogNewNearby = new BlogNewDAO().getRemainBlog(blogID);

            if (bn != null) {
                request.setAttribute("BLOG_DETAIL", bn);
                url = SUCCESS;
            } else {
                url = ERROR;
                return;
            }
            if (BlogNewNearby != null && !BlogNewNearby.isEmpty() && bn != null) {
                request.setAttribute("BLOG_NEW_NEARBY", BlogNewNearby);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at BlogDetailController: " + e.toString());
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
