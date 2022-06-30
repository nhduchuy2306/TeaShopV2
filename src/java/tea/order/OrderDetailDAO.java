/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import tea.common.Common;
import tea.utils.DBUtils;

/**
 *
 * @author Huy
 */
public class OrderDetailDAO {
    
    private static final String INSERT = "INSERT INTO tblOrderDetail(quantity, price, productID, orderID) VALUES(?,?,?,?)";
    
    public boolean insert(int quantity, double price, String productID, int orderID){
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, quantity);
                ptm.setDouble(2, price);
                ptm.setString(3, productID);
                ptm.setInt(4, orderID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return check;
    }
}
