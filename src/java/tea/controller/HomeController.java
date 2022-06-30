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
import tea.banner.BannerDAO;
import tea.banner.BannerDTO;
import tea.blognew.BlogNewDAO;
import tea.blognew.BlogNewDTO;
import tea.category.CategoryDAO;
import tea.category.CategoryDTO;
import tea.product.ProductDAO;
import tea.product.ProductDTO;


/**
 *
 * @author Huy
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

    private static final String ERROR = "/client/404.jsp";
    private static final String SUCCESS = "/client/index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        DecimalFormat df = new DecimalFormat("#.000");
        
        String url = ERROR;
        try {
            List<BannerDTO> bannerList = new BannerDAO().getAllBanner();
            List<CategoryDTO> categoryList = new CategoryDAO().getAllCategory();

            List<ProductDTO> product_caphe = new ProductDAO().getProductByID("1");
            List<ProductDTO> product_trasua = new ProductDAO().getProductByID("2");
            List<ProductDTO> product_hitea = new ProductDAO().getProductByID("3");
            List<ProductDTO> product_daxay = new ProductDAO().getProductByID("4");
            List<ProductDTO> product_thuongthuc = new ProductDAO().getProductByID("5");
            List<ProductDTO> product_snack = new ProductDAO().getProductByID("6");
            
            List<ProductDTO> product_all = new ProductDAO().getAllProduct();
            List<ProductDTO> product_new = new ProductDAO().getListProductByType("1");
            List<ProductDTO> product_sale = new ProductDAO().getListProductByType("2");
            List<ProductDTO> product_best_choice = new ProductDAO().getListProductByType("3");
            
            List<BlogNewDTO> blogNewList = new BlogNewDAO().getAllBlogNew();
            
//            banner
            if (bannerList != null && !bannerList.isEmpty()) {
                request.setAttribute("BANNER_LIST", bannerList);
                url = SUCCESS;
            }
//            category
            if (categoryList != null && !categoryList.isEmpty()) {
                request.setAttribute("CATEGORY_LIST", categoryList);
                url = SUCCESS;
            }
//            ca phe
            if (product_caphe != null && !product_caphe.isEmpty()) {
                request.setAttribute("PRODUCT_CAPHE", product_caphe);
                url = SUCCESS;
            }
//            tra sua
            if (product_trasua != null && !product_trasua.isEmpty()) {
                request.setAttribute("PRODUCT_TRASUA", product_trasua);
                url = SUCCESS;
            }
//            hi tea
            if (product_hitea != null && !product_hitea.isEmpty()) {
                request.setAttribute("PRODUCT_HITEA", product_hitea);
                url = SUCCESS;
            }
//            da xay
            if (product_daxay != null && !product_daxay.isEmpty()) {
                request.setAttribute("PRODUCT_DAXAY", product_daxay);
                url = SUCCESS;
            }
//            thuong thuc
            if (product_thuongthuc != null && !product_thuongthuc.isEmpty()) {
                request.setAttribute("PRODUCT_THUONGTHUC", product_thuongthuc);
                url = SUCCESS;
            }
//            snack
            if (product_snack != null && !product_snack.isEmpty()) {
                request.setAttribute("PRODUCT_SNACK", product_snack);
                url = SUCCESS;
            }
//            All
            if (product_all != null && !product_all.isEmpty()) {
                request.setAttribute("PRODUCT_ALL", product_all);
                List<ProductDTO> product_all_after = new ArrayList<>();
                for (ProductDTO product : product_all) {
                    ProductDTO p = new ProductDAO().get(product.getProductID());
                    p.setProductPrice(product.getProductPrice()*(1 - Double.valueOf(product.getProductDiscount())/100));
                    product_all_after.add(p);
                }
                request.setAttribute("PRODUCT_ALL_AFTER", product_all_after);
                url = SUCCESS;
            }
            if (product_new != null && !product_new.isEmpty()) {
                request.setAttribute("PRODUCT_NEW", product_new);
                url = SUCCESS;
            }
            if (product_best_choice != null && !product_best_choice.isEmpty()) {
                request.setAttribute("PRODUCT_BEST_CHOICE", product_best_choice);
                url = SUCCESS;
            }
            if (product_sale != null && !product_sale.isEmpty()) {
                request.setAttribute("PRODUCT_SALE", product_sale);
                url = SUCCESS;
            }
            if(blogNewList !=null && !blogNewList.isEmpty()){
                request.setAttribute("BLOG_NEW", blogNewList);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at HomeController: "+ e.toString());
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
