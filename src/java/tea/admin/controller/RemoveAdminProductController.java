/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.admin.controller;

import java.io.IOException;
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
@WebServlet(name = "RemoveAdminProductController", urlPatterns = {"/RemoveAdminProductController"})
public class RemoveAdminProductController extends HttpServlet {

    private static final String ERROR = "ProductManagementController";
    private static final String SUCCESS = "ProductManagementController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String pID = request.getParameter("pID");
            ProductDAO productDAO = new ProductDAO();
            ProductDTO p = productDAO.getProductByType(pID);
            if (p == null) {
                boolean check = productDAO.delete(pID);
                if (check) {
                    request.setAttribute("SUCCESS", "REMOVE SUCCESSFULLY!");
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "REMOVE FAIL!");
                }
            } else {
                boolean check = productDAO.removeProductByType(pID);
                if (check) {
                    boolean check2 = productDAO.delete(pID);
                    if (check2) {
                        request.setAttribute("SUCCESS", "REMOVE SUCCESSFULLY!");
                        url = SUCCESS;
                    } else {
                        request.setAttribute("ERROR", "REMOVE FAIL!");
                    }
                }
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
