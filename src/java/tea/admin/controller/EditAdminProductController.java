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
import tea.product.ProductDAO;
import tea.product.ProductDTO;


/**
 *
 * @author Huy
 */
@WebServlet(name = "EditAdminProductController", urlPatterns = {"/EditAdminProductController"})
public class EditAdminProductController extends HttpServlet {

    private static final String ERROR = "ProductManagementController";
    private static final String SUCCESS = "SearchAdminProductController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
//            String search = request.getParameter("searchadmin");
            String productID = request.getParameter("productID");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String status = request.getParameter("status");
            String description = request.getParameter("description");
            int discount = Integer.parseInt(request.getParameter("discount"));
            String img_link = request.getParameter("img-link");
            String created = request.getParameter("created");
            String categoryID = request.getParameter("categoryID");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            ProductDAO productDAO = new ProductDAO();
            boolean check = productDAO.update(new ProductDTO(productID, name, Double.parseDouble(price), status, description, discount, img_link, 
                    Date.valueOf(created), categoryID, quantity));
            
            if(check){
                request.setAttribute("SUCCESS", "UPDATE PRODUCT SUCCESSFULLY!");
                url = SUCCESS;
            }
            else{
                request.setAttribute("ERROR", "UPDATE PRODUCT FAIL!");
            }
        } catch (Exception e) {
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
