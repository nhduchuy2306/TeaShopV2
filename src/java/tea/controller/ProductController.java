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
@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {

    private static final String ERROR = "/client/404.jsp";
    private static final String SUCCESS = "/client/product.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DecimalFormat df = new DecimalFormat("#.000");
        String url = ERROR;
        try {
            String pageNumber = request.getParameter("pageNum");

            List<CategoryDTO> categoryList = new CategoryDAO().getAllCategory();
            List<ProductDTO> productRecently = new ProductDAO().getListProductByType("1");
            List<ProductDTO> product_all = new ProductDAO().getAllProduct();
            List<ProductDTO> product_by_pageNum = new ProductDAO().pagingProduct(pageNumber);
            
            int numOfPage = new ProductDAO().numberOfProduct();
            int endPage = numOfPage/9;
            if(endPage%9!=0){
                endPage++;
            }
            
            request.setAttribute("END_PAGE", endPage);
            request.setAttribute("PAGE_TAG", pageNumber);
            
            if(categoryList != null && !categoryList.isEmpty()){
                request.setAttribute("CATEGORY_LIST", categoryList);
                url = SUCCESS;
            }
            if(productRecently != null && !productRecently.isEmpty()){
                request.setAttribute("PRODUCT_NEW", productRecently);
                url = SUCCESS;
            }
            
            if (product_all != null && !product_all.isEmpty()) {
                request.setAttribute("PRODUCT_ALL", product_all);
                
                List<ProductDTO> product_all_after = new ArrayList<>();
                
                for (ProductDTO product : product_all) {
                    ProductDTO p = new ProductDAO().get(product.getProductID());
//                    p.setProductPrice(product.getProductPrice()*(1 - Double.valueOf(product.getProductDiscount())/100));
                    product_all_after.add(p);
                }
                
                request.setAttribute("PRODUCT_ALL_AFTER", product_all_after);
                url = SUCCESS;
            }
            
            if(product_by_pageNum != null && !product_by_pageNum.isEmpty()){
                request.setAttribute("PRODUCT_ALL", product_by_pageNum);
                url = SUCCESS;
            }
            
        } catch (Exception e) {
            log("Error at ProductController: "+e.toString());
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
