/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.controller;

import java.io.IOException;
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
import tea.review.ReviewDTO;


/**
 *
 * @author Huy
 */
@WebServlet(name = "ProductDetailController", urlPatterns = {"/ProductDetailController"})
public class ProductDetailController extends HttpServlet {

    private static final String ERROR = "/client/404.jsp";
    private static final String SUCCESS = "/client/product-detail.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String pid = request.getParameter("pID");
            ProductDTO p = new ProductDAO().get(pid);
            CategoryDTO c = new CategoryDAO().getCategoryByProduct(pid);
            List<ProductDTO> remainProductNotCurr = new ProductDAO().getAllProductNotCurrProduct(pid,c.getCategoryID());
            List<ReviewDTO> listReview = new ProductDAO().getAllReviewByID(pid);
            
            if(p!=null){
                request.setAttribute("DETAIL_PRODUCT", p);
                url = SUCCESS;
                ProductDTO pDis = p;
                pDis.setProductPrice(p.getProductPrice()*(1 - Double.valueOf(p.getProductDiscount()) / 100));
                request.setAttribute("DETAIL_PRODUCT_DISCOUNT", pDis);
            }
            if(c!=null){
                request.setAttribute("NAME_CATE_OF_PRODUCT", c);
                url = SUCCESS;
            }
            if(listReview!=null && !listReview.isEmpty()){
                request.setAttribute("LIST_REVIEW", listReview);
                url = SUCCESS;
            }
            if(remainProductNotCurr!=null && !remainProductNotCurr.isEmpty()){
                request.setAttribute("REMAIN_PRODUCT_NOT_CURR", remainProductNotCurr);
                List<ProductDTO> productAfter = new ArrayList<>();
                for (ProductDTO product : remainProductNotCurr) {
                    ProductDTO pr = new ProductDAO().get(product.getProductID());
                    pr.setProductPrice(product.getProductPrice()*(1 - Double.valueOf(product.getProductDiscount())/100));
                    productAfter.add(pr);
                }
                request.setAttribute("PRODUCT_AFTER", productAfter);
                url = SUCCESS;
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
