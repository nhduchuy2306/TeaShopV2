/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

    private static final String ERROR = "/client/404.jsp";
    private static final String HOME = "Home";
    private static final String HOME_CONTROLLER = "HomeController";
    private static final String INTRODUCE = "Introduce";
    private static final String INTRODUCE_CONTROLLER = "IntroduceController";
    private static final String SECURITY = "Security";
    private static final String SECURITY_CONTROLLER = "SecurityController";
    private static final String CONTACT = "Contact";
    private static final String CONTACT_CONTROLLER = "ContactController";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGIN_GOOGLE = "Login-google";
    private static final String LOGIN_GOOGLE_CONTROLLER = "LoginGoogleController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String PRODUCT = "Product";
    private static final String PRODUCT_CONTROLLER = "ProductController";
    private static final String PRODUCT_CATEGORY = "Product-id";
    private static final String PRODUCT_CATEGORY_CONTROLLER = "ProductCategoryController";
    private static final String PRODUCT_DETAIL = "Product-detail";
    private static final String PRODUCT_DETAIL_CONTROLLER = "ProductDetailController";
    private static final String REVIEW = "Review";
    private static final String REVIEW_CONTROLLER = "ReviewController";
    private static final String BLOG_DETAIL = "Blog-detail";
    private static final String BLOG_DETAIL_CONTROLLER = "BlogDetailController";
    private static final String BLOG_ARCHIVE = "Blog-archive";
    private static final String BLOG_ARCHIVE_CONTROLLER = "BlogArchiveController";
    private static final String ADD_CART = "Add-Cart";
    private static final String ADD_CART_CONTROLLER = "AddToCartController";
    private static final String CART = "Cart";
    private static final String CART_CONTROLLER = "CartController";
    private static final String DELETE_CART = "Delete-Item";
    private static final String DELETE_CART_CONTROLLER = "DeleteCartController";
    private static final String EDIT_CART = "Edit-Item";
    private static final String EDIT_CART_CONTROLLER = "EditCartController";
    private static final String CHECKOUT_CART = "Checkout";
    private static final String CHECKOUT_CART_CONTROLLER = "CheckoutCartController";
    private static final String TRANSACT = "Transact";
    private static final String TRANSACT_CONTROLLER = "TransactController";
    
    private static final String ADMIN_USER_MANAGEMENT = "Admin-user-management";
    private static final String ADMIN_USER_MANAGEMENT_CONTROLLER = "UserManagementController";
    private static final String ADMIN_PRODUCT_MANAGEMENT = "Admin-product-management";
    private static final String ADMIN_PRODUCT_MANAGEMENT_CONTROLLER = "ProductManagementController";
    
    private static final String ADMIN_EDIT_USER = "Admin-Edit-User";
    private static final String ADMIN_EDIT_USER_CONTROLLER = "EditAdminUserController";
    private static final String ADMIN_REMOVE_USER = "Admin-Remove-User";
    private static final String ADMIN_REMOVE_USER_CONTROLLER = "RemoveAdminUserController";
    private static final String ADMIN_SEARCH_USER = "Admin-Search-User";
    private static final String ADMIN_SEARCH_USER_CONTROLLER = "SearchAdminUserController";
    
    private static final String ADMIN_EDIT_PRODUCT = "Admin-Edit-Product";
    private static final String ADMIN_EDIT_PRODUCT_CONTROLLER = "EditAdminProductController";
    private static final String ADMIN_REMOVE_PRODUCT = "Admin-Remove-Product";
    private static final String ADMIN_REMOVE_PRODUCT_CONTROLLER = "RemoveAdminProductController";
    private static final String ADMIN_SEARCH_PRODUCT = "Admin-Search-Product";
    private static final String ADMIN_SEARCH_PRODUCT_CONTROLLER = "SearchAdminProductController";
    private static final String ADMIN_ADD_PRODUCT = "Admin-Add-Product";
    private static final String ADMIN_ADD_PRODUCT_CONTROLLER = "AddAdminProductController";
    
    private static final String ADMIN_BLOG = "Admin-Blog";
    private static final String ADMIN_BLOG_CONTROLLER = "BlogManagementController";
    private static final String ADMIN_BLOG_EDIT = "Admin-Blog-Edit";
    private static final String ADMIN_BLOG_EDIT_CONTROLLER = "AdminBlogEditController";
    private static final String ADMIN_BLOG_REMOVE = "Admin-Blog-Remove";
    private static final String ADMIN_BLOG_REMOVE_CONTROLLER = "AdminBlogRemoveController";
    private static final String ADMIN_BLOG_ADD = "Admin-Blog-Add";
    private static final String ADMIN_BLOG_ADD_CONTROLLER = "AdminBlogAddController";
    private static final String ADMIN_BLOG_SEARCH = "Admin-Search-Blog";
    private static final String ADMIN_BLOG_SEARCH_CONTROLLER = "AdminBlogSearchController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGIN_GOOGLE.equals(action)) {
                url = LOGIN_GOOGLE_CONTROLLER;
            } else if (HOME.equals(action)) {
                url = HOME_CONTROLLER;
            } else if (INTRODUCE.equals(action)) {
                url = INTRODUCE_CONTROLLER;
            } else if (SECURITY.equals(action)) {
                url = SECURITY_CONTROLLER;
            } else if (CONTACT.equals(action)) {
                url = CONTACT_CONTROLLER;
            } else if (REGISTER.equals(action)) {
                url = REGISTER_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (PRODUCT.equals(action)) {
                url = PRODUCT_CONTROLLER;
            } else if (PRODUCT_CATEGORY.equals(action)) {
                url = PRODUCT_CATEGORY_CONTROLLER;
            } else if (PRODUCT_DETAIL.equals(action)) {
                url = PRODUCT_DETAIL_CONTROLLER;
            } else if (REVIEW.equals(action)) {
                url = REVIEW_CONTROLLER;
            } else if (BLOG_DETAIL.equals(action)) {
                url = BLOG_DETAIL_CONTROLLER;
            } else if (BLOG_ARCHIVE.equals(action)) {
                url = BLOG_ARCHIVE_CONTROLLER;
            } else if (CART.equals(action)) {
                url = CART_CONTROLLER;
            } else if (ADD_CART.equals(action)) {
                url = ADD_CART_CONTROLLER;
            } else if (DELETE_CART.equals(action)) {
                url = DELETE_CART_CONTROLLER;
            } else if (EDIT_CART.equals(action)) {
                url = EDIT_CART_CONTROLLER;
            } else if (CHECKOUT_CART.equals(action)) {
                url = CHECKOUT_CART_CONTROLLER;
            } else if (TRANSACT.equals(action)) {
                url = TRANSACT_CONTROLLER;
            } 
            /// Admin
            else if (ADMIN_USER_MANAGEMENT.equals(action)) {
                url = ADMIN_USER_MANAGEMENT_CONTROLLER;
            } else if (ADMIN_PRODUCT_MANAGEMENT.equals(action)) {
                url = ADMIN_PRODUCT_MANAGEMENT_CONTROLLER;
            } else if (ADMIN_EDIT_USER.equals(action)) {
                url = ADMIN_EDIT_USER_CONTROLLER;
            } else if (ADMIN_REMOVE_USER.equals(action)) {
                url = ADMIN_REMOVE_USER_CONTROLLER;
            } else if (ADMIN_SEARCH_USER.equals(action)) {
                url = ADMIN_SEARCH_USER_CONTROLLER;
            } else if (ADMIN_EDIT_PRODUCT.equals(action)) {
                url = ADMIN_EDIT_PRODUCT_CONTROLLER;
            } else if (ADMIN_REMOVE_PRODUCT.equals(action)) {
                url = ADMIN_REMOVE_PRODUCT_CONTROLLER;
            } else if (ADMIN_SEARCH_PRODUCT.equals(action)) {
                url = ADMIN_SEARCH_PRODUCT_CONTROLLER;
            } else if (ADMIN_ADD_PRODUCT.equals(action)) {
                url = ADMIN_ADD_PRODUCT_CONTROLLER;
            } else if (ADMIN_BLOG.equals(action)) {
                url = ADMIN_BLOG_CONTROLLER;
            } else if (ADMIN_BLOG_EDIT.equals(action)) {
                url = ADMIN_BLOG_EDIT_CONTROLLER;
            } else if (ADMIN_BLOG_REMOVE.equals(action)) {
                url = ADMIN_BLOG_REMOVE_CONTROLLER;
            } else if (ADMIN_BLOG_ADD.equals(action)) {
                url = ADMIN_BLOG_ADD_CONTROLLER;
            } else if (ADMIN_BLOG_SEARCH.equals(action)) {
                url = ADMIN_BLOG_SEARCH_CONTROLLER;
            } 
        } catch (Exception e) {
            log("error at MainController: " + e.toString());
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
