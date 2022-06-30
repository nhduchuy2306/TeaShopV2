/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import tea.common.Common;
import tea.user.UserDTO;
import tea.utils.DBUtils;

/**
 *
 * @author Huy
 */
public class OrderDAO {

    private static final String GET_MAX_ID = "SELECT MAX(orderID) FROM tblOrder";
    private static final String INSERT_ORDER = "INSERT INTO tblOrder(userID,date,total) VALUES(?,?,?)";

    public int getMaxOrderID() {
        int res = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_MAX_ID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                res = rs.getInt(1);
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return res;
    }

    public boolean insert(String userID, Date date, double total) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1, userID);
                ptm.setDate(2, date);
                ptm.setDouble(3, total);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return check;
    }
}
