/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Huy
 */
public class Common {
    public static int countItem = 1;
    public static void CloseConnection(Connection conn, PreparedStatement ptm, ResultSet rs) {
        try {
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
            if(rs!=null) rs.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    public static void CloseConnection(Connection conn, PreparedStatement ptm) {
        try {
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    public static Cookie getCookie(HttpServletRequest request, String name){
        Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            if(c.getName().equals(name)){
                return c;
            }
        }
        return null;
    }
}
