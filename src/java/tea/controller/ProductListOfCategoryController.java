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
@WebServlet(name = "ProductListOfCategoryController", urlPatterns = {"/ProductCategoryController"})
public class ProductListOfCategoryController extends HttpServlet {

    private static final String ERROR = "/client/404.jsp";
    private static final String SUCCESS = "/client/product.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        
        try {
            String cID = request.getParameter("cID");
            List<ProductDTO> product_by_category = new ProductDAO().getProductByID(cID);
            List<CategoryDTO> categoryList = new CategoryDAO().getAllCategory();
            List<ProductDTO> productNew = new ProductDAO().getListProductByType("1");
            
            request.setAttribute("TAG", cID);
            
            if(!product_by_category.isEmpty() && product_by_category!=null){
                request.setAttribute("PRODUCT_ALL", product_by_category);
                
                List<ProductDTO> product_all_after = new ArrayList<>();

                for (ProductDTO product : product_by_category) {
                    ProductDTO p = new ProductDAO().get(product.getProductID());
                    p.setProductPrice(product.getProductPrice()*(1 - Double.valueOf(product.getProductDiscount()) / 100));
                    product_all_after.add(p);
                }
                request.setAttribute("PRODUCT_ALL_AFTER", product_all_after);
                url = SUCCESS;
            }
            if(!categoryList.isEmpty() && categoryList!=null){
                request.setAttribute("CATEGORY_LIST", categoryList);
                url = SUCCESS;
            }
            if(!productNew.isEmpty() && productNew!=null){
                request.setAttribute("PRODUCT_NEW", productNew);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at ProductListOfCategoryController: " + e.toString()); 
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
