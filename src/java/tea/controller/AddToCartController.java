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
import tea.items.Cart;
import tea.items.ItemDTO;
import tea.product.ProductDAO;
import tea.product.ProductDTO;

/**
 *
 * @author Huy
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "MainController?action=Product&pageNum=1";
    private static final String SUCCESS = "MainController?action=Product&pageNum=1";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        int countItem = 1;
        try {
            HttpSession session = request.getSession();
            String pID = request.getParameter("product-id");
            ProductDTO product = new ProductDAO().get(pID);
            if(product.getProductStatus().equals(0)){
                request.setAttribute("ERROR", product.getProductName() + " IS OUT OF STOCK");
                return;
            }
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                }
                if (product.getQuantity() >= 1) {
                    boolean check = cart.addtoCart(new ItemDTO(countItem++, product, 1, product.getProductPrice()));
                    if (check) {
                        session.setAttribute("CART", cart);
                        request.setAttribute("SUCCESS", "Add " + 1 + " | " + product.getProductName() + " Successfully");
                        url = SUCCESS;
                    }
                } else {
                    request.setAttribute("ERROR", product.getProductName() + " IS OUT OF STOCK");
                }
            }
        } catch (Exception e) {
            log("Error at AddtocartController: " + e.toString());
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
