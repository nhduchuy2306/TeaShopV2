/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.order;

/**
 *
 * @author Huy
 */
public class OrderDetailDTO {
    private String orderDetailID;
    private int quantity;
    private double price;
    private String productID;
    private String orderID;

    public OrderDetailDTO() {
    }

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    @Override
    public String toString() {
        return "OrderDetailDTO{" + "orderDetailID=" + orderDetailID + ", quantity=" + quantity + ", price=" + price + ", productID=" + productID + ", orderID=" + orderID + '}';
    }

    
}
