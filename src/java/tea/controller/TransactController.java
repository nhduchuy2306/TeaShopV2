/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tea.items.Cart;
import tea.items.ItemDTO;
import tea.items.SendEmail;
import tea.order.OrderDAO;
import tea.order.OrderDetailDAO;
import tea.product.ProductDAO;
import tea.product.ProductDTO;
import tea.user.UserDTO;

/**
 *
 * @author Huy
 */
@WebServlet(name = "TransactController", urlPatterns = {"/TransactController"})
public class TransactController extends HttpServlet {

    private static final String ERROR = "CheckoutCartController";
    private static final String SUCCESS = "CheckoutCartController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            
            String statuspayment = request.getParameter("statuspayment");
            if(statuspayment!=null && statuspayment.equals("fail")){
                request.setAttribute("ERROR", "PAYMENT FAIL!!!");
                return;
            }
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO user = (UserDTO) session.getAttribute("USER_LOGIN");
            ProductDAO productDAO = new ProductDAO();
            List<ItemDTO> list = new ArrayList<>();
            SendEmail se = new SendEmail();
            OrderDAO orderDAO = new OrderDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            double total = 0;
            if (cart != null) {
                boolean check = false;
                String transaction_name = request.getParameter("transaction_name");
                String transaction_email = request.getParameter("transaction_email");
                String transaction_phone = request.getParameter("transaction_phone");
                String transaction_address = request.getParameter("transaction_address");
                String transaction_created = request.getParameter("transaction_created");
                String transaction_payment = request.getParameter("transaction_payment");
                if(transaction_payment == null){
                    request.setAttribute("ERROR", "MUST CHECK CASH ON DELIVERY");
                    return;
                }

                for (String pID : cart.getCart().keySet()) {
                    ItemDTO item = cart.getItem(pID);
                    double price = item.getPrice();
                    double discount = item.getProduct().getProductDiscount();
                    discount /= 100;
                    price = price * item.getQuantity() * (1 - discount);
                    total += price;
                    String productID = item.getProduct().getProductID();
                    ProductDTO product = productDAO.get(productID);
                    if (product.getQuantity() - item.getQuantity() >= 0) {
                        product.setQuantity(product.getQuantity() - item.getQuantity());
                        boolean checkQuantityUpdate = productDAO.update(product);
                        if (checkQuantityUpdate) {
                            url = SUCCESS;
                            list.add(item);
                        }
                        check = true;
                    } else {
                        request.setAttribute("ERROR", "WE DON'T HAVE ENOUGH THIS PRODUCT " + product.getProductName());
                        url = ERROR;
                        check = false;
                        break;
                    }
                }
                if (check) {
                    LocalDate date = java.time.LocalDate.now();
                    boolean checkOrder = orderDAO.insert(user.getUserID(), Date.valueOf(date), total);
                    int orderNum = orderDAO.getMaxOrderID();
                    System.out.println(orderNum);
                    if (checkOrder) {
                        boolean checkOrderDetail = false;
                        for (ItemDTO item : list) {
                            double discount = item.getProduct().getProductDiscount();
                            discount /= 100;
                            double price = item.getPrice() * item.getQuantity() * (1 - discount);
                            checkOrderDetail = orderDetailDAO.insert(item.getQuantity(), price, item.getProduct().getProductID(), orderNum);
                        }
                        if (checkOrderDetail) {
                            boolean sendMail = se.sendEmail(transaction_name, transaction_email, transaction_phone, transaction_address, transaction_created, transaction_payment, cart);
                            if (sendMail) {
                                session.removeAttribute("CART");
                                request.setAttribute("SUCCESS", "PAYMENT SUCCESSFULLY!!!");
                            }
                        } else {
                            request.setAttribute("ERROR", "PAYMENT FAIL!!!");
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
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
