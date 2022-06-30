/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.order;

import java.util.Date;
import tea.user.UserDTO;

public class OrderDTO {
    private int orderID;
    private UserDTO user;
    private Date date;
    private double total;

    public OrderDTO() {
    }

    public OrderDTO(int orderID, UserDTO user, Date date, double total) {
        this.orderID = orderID;
        this.user = user;
        this.date = date;
        this.total = total;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", user=" + user + ", date=" + date + ", total=" + total + '}';
    }

}