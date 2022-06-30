/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.user;

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
public class UserDAO {
    
    public static final String LOGIN = "SELECT userID, [name], email, [address], phone, created, roleID, username\n"
            + "FROM tblUsers \n"
            + "WHERE username = ?\n"
            + "AND [password] = ?";
    public static final String REGISTER = "INSERT INTO tblUsers([name], email, [address], phone, created, "
            + "roleID, [password], username) \n"
            + "VALUES(?,?,?,?,?,?,?,?)";
    public static final String GET_ROLE_NAME = "SELECT roleName FROM tblRoles WHERE roleID = ?";
    public static final String GET_ROLE_ID = "SELECT roleID FROM tblRoles WHERE roleName = ?";
    public static final String CHECK_EMAIL = "SELECT userID, [name], email, [address], phone, created, roleID, username "
            + "FROM tblUsers WHERE email = ?";
    public static final String GET_ALL_USER = "SELECT u.userID, u.[name], u.email, u.[address], u.phone, u.created, r.roleName, "
            + "u.username FROM tblUsers u , tblRoles r WHERE u.roleID = r.roleID";
    public static final String UPDATE = "UPDATE tblUsers SET [name] = ?, email = ?, "
            + "[address] = ?, phone = ?, created = ?, roleID = ?, username = ? "
            + "WHERE userID = ?";
    public static final String REMOVE = "DELETE FROM tblUsers WHERE userID = ?";
    public static final String SEARCH = "SELECT userID, [name], email, [address], phone, created, roleID, "
            + "username FROM tblUsers WHERE [name] LIKE ?";
    
    public String getRoleName(String roleID) {
        String ans = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ROLE_NAME);
                ptm.setString(1, roleID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    ans = rs.getString(1);
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return ans;
    }

    public String getRoleID(String roleName) {
        String ans = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ROLE_ID);
                ptm.setString(1, roleName);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    ans = rs.getString(1);
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return ans;
    }

    public UserDTO login(String username, String password) {
        UserDTO u = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    u = new UserDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6),
                            rs.getString(7),
                            rs.getString(8));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        
        return u;
    }

    public boolean register(UserDTO u) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REGISTER);
                ptm.setString(1, u.getName());
                ptm.setString(2, u.getEmail());
                ptm.setString(3, u.getAddress());
                ptm.setString(4, u.getPhone());
                ptm.setDate(5, u.getCreate());
                ptm.setString(6, getRoleID(u.getRoleID()));
                ptm.setString(7, u.getPassword());
                ptm.setString(8, u.getUsername());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return check;
    }

    public boolean isDuplicateEmail(String email) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EMAIL);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return check;
    }

    public UserDTO getUserByEmail(String email) {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EMAIL);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    user = new UserDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6),
                            rs.getString(7),
                            rs.getString(8));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return user;
    }

    public List<UserDTO> getAllUser() {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_USER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new UserDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6),
                            rs.getString(7),
                            rs.getString(8)));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public boolean update(UserDTO u) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, u.getName());
                ptm.setString(2, u.getEmail());
                ptm.setString(3, u.getAddress());
                ptm.setString(4, u.getPhone());
                ptm.setDate(5, u.getCreate());
                ptm.setString(6, getRoleID(u.getRoleID()));
                ptm.setString(7, u.getUsername());
                ptm.setString(8, u.getUserID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return check;
    }

    public boolean delete(String userID) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REMOVE);
                ptm.setString(1, userID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return check;
    }

    public List<UserDTO> search(String s) {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + s + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new UserDTO(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6),
                            getRoleName(rs.getString(7)),
                            rs.getString(8)));
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public static void main(String[] args) {
        System.out.println(new UserDAO().isDuplicateEmail("nguyenhuy1323614@gmail.com"));
    }
    
}
