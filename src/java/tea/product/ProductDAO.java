/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import tea.common.Common;
import tea.review.ReviewDTO;
import tea.utils.DBUtils;

/**
 *
 * @author Huy
 */
public class ProductDAO {

    private static final String GET_PRODUCT_BY_ID = "SELECT productID, [name], price, status, description, discount,"
            + " image_link, created, categoryID FROM tblProduct WHERE categoryID = ?";
    private static final String GET_ALL_PRODUCT = "SELECT productID, [name], price, status, description, discount,"
            + " image_link, created, categoryID, quantity FROM tblProduct";
    private static final String GET_PRODUCT = "SELECT productID, [name], price, status, description, discount,"
            + " image_link, created, categoryID, quantity FROM tblProduct WHERE productID = ?";
    private static final String GET_PRODUCT_BY_TYPE = "SELECT p.productID,p.[name],p.price,p.[status],"
            + "p.[description],p.discount,p.image_link,p.created,p.categoryID\n"
            + "FROM tblProduct p, tblProductProductType ppt\n"
            + "WHERE p.productID = ppt.productID\n"
            + "AND ppt.productTypeID = ?";
    private static final String NUMBER_OF_PRODUCT = "SELECT COUNT(*) FROM tblProduct";
    private static final String PAGING_PRODUCT = "SELECT productID, [name], price, [status], "
            + "[description], discount, image_link, created, categoryID \n"
            + "FROM tblProduct\n"
            + "ORDER BY productID\n"
            + "offset ? rows fetch next 9 rows only";
    private static final String GET_ALL_PRODUCT_BY_CATEGORY_ID = "SELECT productID, [name], price, status, "
            + "description, discount,"
            + "image_link, created, categoryID \n"
            + "FROM tblProduct\n"
            + "WHERE categoryID = (\n"
            + "	SELECT categoryID\n"
            + "	FROM tblProduct\n"
            + "	WHERE productID = ?\n"
            + ")";
    private static final String GET_ALL_PRODUCT_NOT_CURR_PRODUCT = "SELECT productID, [name], price, status, "
            + "description, discount,"
            + "image_link, created, categoryID \n"
            + "FROM tblProduct\n"
            + "WHERE productID != ? AND categoryID = ?";
    private static final String GET_ALL_REVIEW_BY_PROID = "SELECT r.reviewID, r.productID, r.[content], r.created, u.[name] "
            + "FROM tblReview r, tblUsers u\n"
            + "WHERE r.userID = u.userID AND  productID = ?";
    private static final String CREATE_NEW_REVIEW = "INSERT INTO tblReview(productID, [content], created, userID)"
            + "VALUES(?,?,?,?)";
    private static final String SEARCH = "SELECT productID, [name], price, status, "
            + "description, discount,"
            + "image_link, created, categoryID, quantity \n"
            + "FROM tblProduct\n"
            + "WHERE [name] like ? ";
    private static final String UPDATE = "UPDATE tblProduct SET productID = ?, [name] = ?, price = ?, status = ?, "
            + "description = ?, discount = ?,"
            + "image_link = ?, created = ?, categoryID = ?, quantity = ? \n"
            + "WHERE productID = ? ";
    private static final String DELETE = "DELETE FROM tblProduct WHERE productID = ?";
    private static final String ADD = "INSERT INTO tblProduct( productID, [name], price, status, "
            + "description, discount,"
            + "image_link, created, categoryID, quantity) VALUES (?,?,?,?,?,?,?,?,?,?)";
    private static final String GET_PRODUCT_TYPE = "SELECT p.productID, p.[name], p.price,p.[status],p.[description],p.discount,p.image_link,p.created,p.categoryID,p.quantity\n"
            + "FROM tblProductProductType ppt, tblProduct p\n"
            + "WHERE p.productID = ppt.productID \n"
            + "AND p.productID = ?";
    private static final String REMOVE_BY_PRODUCT_TYPE = "DELETE FROM tblProductProductType WHERE productID = ?";

    public List<ProductDTO> getProductByID(String id) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BY_ID);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new ProductDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getDate(8),
                            rs.getString(9)));
                }
            }
        } catch (Exception e) {

        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<ProductDTO> getAllProduct() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new ProductDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getDate(8),
                            rs.getString(9),
                            rs.getInt(10)));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public ProductDTO get(String productID) {
        ProductDTO p = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    p = new ProductDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getDate(8),
                            rs.getString(9),
                            rs.getInt(10));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return p;
    }

    public List<ProductDTO> getListProductByType(String type) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BY_TYPE);
                ptm.setString(1, type);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new ProductDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getDate(8),
                            rs.getString(9)));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public int numberOfProduct() {
        int num = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(NUMBER_OF_PRODUCT);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    num = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return num;
    }

    public List<ProductDTO> pagingProduct(String index) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(PAGING_PRODUCT);
                ptm.setInt(1, (Integer.parseInt(index) - 1) * 9);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new ProductDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getDate(8),
                            rs.getString(9)));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<ProductDTO> getAllProductByCategoryID(String id) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_PRODUCT_BY_CATEGORY_ID);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new ProductDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getDate(8),
                            rs.getString(9)));
                }
            }
        } catch (Exception e) {

        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<ProductDTO> getAllProductNotCurrProduct(String id, String cateID) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_PRODUCT_NOT_CURR_PRODUCT);
                ptm.setString(1, id);
                ptm.setString(2, cateID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new ProductDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getDate(8),
                            rs.getString(9)));
                }
            }
        } catch (Exception e) {

        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<ReviewDTO> getAllReviewByID(String productID) {
        List<ReviewDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_REVIEW_BY_PROID);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new ReviewDTO(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getDate(4),
                            rs.getString(5)));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public boolean createNewReview(ReviewDTO r) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_NEW_REVIEW);
                ptm.setString(1, r.getProductID());
                ptm.setString(2, r.getContent());
                ptm.setDate(3, r.getCreated());
                ptm.setInt(4, r.getUserID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm);
        }

        return check;
    }

    public List<ProductDTO> search(String name) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + name + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new ProductDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getDate(8),
                            rs.getString(9),
                            rs.getInt(10)));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public boolean update(ProductDTO p) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, p.getProductID());
                ptm.setString(2, p.getProductName());
                ptm.setDouble(3, p.getProductPrice());
                ptm.setString(4, p.getProductStatus());
                ptm.setString(5, p.getProductDescription());
                ptm.setInt(6, p.getProductDiscount());
                ptm.setString(7, p.getProductImg());
                ptm.setDate(8, p.getProductCreated());
                ptm.setString(9, p.getCategoryID());
                ptm.setInt(10, p.getQuantity());
                ptm.setString(11, p.getProductID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return check;
    }

    public boolean delete(String productID) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return check;
    }

    public boolean addProduct(ProductDTO p) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD);
                ptm.setString(1, p.getProductID());
                ptm.setString(2, p.getProductName());
                ptm.setDouble(3, p.getProductPrice());
                ptm.setString(4, p.getProductStatus());
                ptm.setString(5, p.getProductDescription());
                ptm.setInt(6, p.getProductDiscount());
                ptm.setString(7, p.getProductImg());
                ptm.setDate(8, p.getProductCreated());
                ptm.setString(9, p.getCategoryID());
                ptm.setInt(10, p.getQuantity());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return check;
    }

    public ProductDTO getProductByType(String productID) {
        ProductDTO p = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_TYPE);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    p = new ProductDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getDate(8),
                            rs.getString(9),
                            rs.getInt(10));
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return p;
    }

    public boolean removeProductByType(String productID) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REMOVE_BY_PRODUCT_TYPE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return check;
    }

    public static void main(String[] args) {
        System.out.println(new ProductDAO().getAllProduct());
    }
}
