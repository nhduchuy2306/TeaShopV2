/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tea.product.ProductDAO;
import tea.product.ProductDTO;


/**
 *
 * @author Huy
 */
@WebServlet(name = "DecreaseCartController", urlPatterns = {"/decrease-cart"})
public class DecreaseCartController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //   txt = "1/10/11/1"
        //   ids = [1,10,11,1]
        String id = request.getParameter("product-id");
        ProductDTO product = new ProductDAO().get(id);
        Cookie arr[] = request.getCookies();
        String txt = "";
        for (Cookie o : arr) {
            if (o.getName().equals("cart")) {
                txt = txt + o.getValue();
                o.setMaxAge(0);
                response.addCookie(o);
            }
        }
        String ids[] = txt.split("/");
        int n = ids.length;
        String txtOutPut = "";

        for (int i = 0; i < n; i++) {
            if(ids[i].equals(product.getProductID())){
                for(int j = i+1; j < n; j++){
                    ids[j] = ids[j-1];
                }
                n--;
                break;
            }
        }
        
        for (int i = 0; i < n; i++) {
            if (txtOutPut.isEmpty()) {
                txtOutPut = ids[i];
            } else {
                txtOutPut = txtOutPut + "/" + ids[i];
            }
        }
        
        if (!txtOutPut.isEmpty()) {
            Cookie c = new Cookie("cart", txtOutPut);
            c.setMaxAge(60 * 60 * 24);
            response.addCookie(c);
        }
        response.sendRedirect("cart");
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
