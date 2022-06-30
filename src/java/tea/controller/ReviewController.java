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
import javax.servlet.http.HttpSession;
import tea.product.ProductDAO;
import tea.product.ProductDTO;
import tea.review.ReviewDTO;
import tea.user.UserDTO;


/**
 *
 * @author Huy
 */
@WebServlet(name = "ReviewController", urlPatterns = {"/ReviewController"})
public class ReviewController extends HttpServlet {
    
    private static final String ERROR = "/client/404.jsp";
    private static String SUCCESS = "/MainController?action=Product-detail&pID=";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String rID = request.getParameter("rID");
            String content = request.getParameter("content");
            String created = request.getParameter("created");
            ProductDTO p = new ProductDAO().get(rID);
            HttpSession session = request.getSession();
            UserDTO u = (UserDTO)session.getAttribute("USER_LOGIN");

            boolean check = new ProductDAO()
                    .createNewReview(new ReviewDTO(p.getProductID(),content, Date.valueOf(created),Integer.parseInt(u.getUserID())));
            
            if(check){
                url = (SUCCESS += rID);
//                response.sendRedirect(request.getContextPath()+SUCCESS+rID);
//            }
//            else{
//                request.getRequestDispatcher(ERROR).forward(request, response);
            }
        } catch (Exception e) {
            log("Error at ReviewController: " + e.toString());
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
