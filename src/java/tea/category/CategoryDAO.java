/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import tea.common.Common;
import tea.utils.DBUtils;

/**
 *
 * @author Huy
 */
public class CategoryDAO {

    private static final String GET_ALL_CATEGORY = "SELECT categoryID,[name],images,hashtag FROM tblCategory";
    private static final String GET_CATEGORY_BY_PRODUCT = "select categoryID,[name],images,hashtag from tblCategory\n"
            + "where categoryID =  (\n"
            + "	select categoryID\n"
            + "	from tblProduct\n"
            + "	where productID = ?\n"
            + ")";

    ;
    
    public List<CategoryDTO> getAllCategory() {
        List<CategoryDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_CATEGORY);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new CategoryDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public CategoryDTO getCategoryByProduct(String id) {
        CategoryDTO c = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CATEGORY_BY_PRODUCT);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    c = new CategoryDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return c;
    }
}
