/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tea.category.CategoryDAO;
import tea.category.CategoryDTO;
import tea.product.ProductDAO;
import tea.product.ProductDTO;


/**
 *
 * @author Huy
 */
@WebServlet(name = "SearchController", urlPatterns = {"/product/search"})
public class SearchController extends HttpServlet {
    
    private static final String ERROR = "/client/404.jsp";
    private static final String SUCCESS = "/client/product-search.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");

            List<CategoryDTO> categoryList = new CategoryDAO().getAllCategory();
            List<ProductDTO> productRecently = new ProductDAO().getListProductByType("1");
            List<ProductDTO> product_search = new ProductDAO().search(search);
            
            
            if(categoryList != null && !categoryList.isEmpty()){
                request.setAttribute("CATEGORY_LIST", categoryList);
                url = SUCCESS;
            }
            if(productRecently != null && !productRecently.isEmpty()){
                request.setAttribute("PRODUCT_NEW", productRecently);
                url = SUCCESS;
            }
            
            if (product_search != null && !product_search.isEmpty()) {
                request.setAttribute("PRODUCT_SEARCH", product_search);
                
                List<ProductDTO> product_search_after = new ArrayList<>();
                
                for (ProductDTO product : product_search) {
                    ProductDTO p = new ProductDAO().get(product.getProductID());
                    p.setProductPrice((product.getProductPrice())*(1 - Double.valueOf(product.getProductDiscount())/100));
                    product_search_after.add(p);
                }
                
                request.setAttribute("PRODUCT_SEARCH_AFTER", product_search_after);
                url = SUCCESS;
            }
            
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
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
