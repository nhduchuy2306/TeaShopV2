/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.blognew;

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
public class BlogNewDAO {

    private static final String GET_ALL_BLOG_NEW = "SELECT blogNewID, title, content,images FROM tblBlogNew";
    private static final String GET_BLOG_BY_BLOG_ID = "SELECT blogNewID, title, content,images FROM tblBlogNew "
                                                    + "WHERE blogNewID = ?";
    private static final String GET_LIST_BLOG_NOT_CURR_BLOG = "SELECT blogNewID, title, content,images FROM tblBlogNew "
                                                    + "WHERE blogNewID != ?";
    private static final String UPDATE = "UPDATE tblBlogNew SET blogNewID = ?, title = ?, content = ?, images = ? "
            + "WHERE blogNewID = ? ";
    private static final String DELETE = "DELETE FROM tblBlogNew WHERE blogNewID = ?";
    private static final String ADD_BLOG = "INSERT INTO tblBlogNew(blogNewID, title, content, images)"
            + " VALUES(?,?,?,?)";
    private static final String GET_BLOG_BY_BLOG_TITLE = "SELECT blogNewID, title, content, images FROM tblBlogNew "
                                                    + "WHERE title like ?";

    public List<BlogNewDTO> getAllBlogNew() {
        List<BlogNewDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_BLOG_NEW);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new BlogNewDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public BlogNewDTO getBlogNewByBlogID(String id) {
        BlogNewDTO bn = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_BLOG_BY_BLOG_ID);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if(rs.next()){
                    bn = new BlogNewDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return bn;
    }
    
    public List<BlogNewDTO> getRemainBlog(String id){
        List<BlogNewDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_LIST_BLOG_NOT_CURR_BLOG);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                while(rs.next()){
                    list.add(new BlogNewDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
                }
            }
        } catch (Exception e) {
        } finally {
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }

    public boolean update(BlogNewDTO blogNew) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, blogNew.getBlogNewID());
                ptm.setString(2, blogNew.getTitle());
                ptm.setString(3, blogNew.getContent());
                ptm.setString(4, blogNew.getBlogImg());
                ptm.setString(5, blogNew.getBlogNewID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return check;
    }
    
    public boolean delete(String bID){
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, bID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return check;
    }
    
    public boolean addBlog(BlogNewDTO blogNew) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(ADD_BLOG);
                ptm.setString(1, blogNew.getBlogNewID());
                ptm.setString(2, blogNew.getTitle());
                ptm.setString(3, blogNew.getContent());
                ptm.setString(4, blogNew.getBlogImg());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            Common.CloseConnection(conn, ptm);
        }
        return check;
    }
    
    public List<BlogNewDTO> getBlogNewByBlogTitle(String title) {
        List<BlogNewDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_BLOG_BY_BLOG_TITLE);
                ptm.setString(1, "%"+title+"%");
                rs = ptm.executeQuery();
                if(rs.next()){
                    list.add(new BlogNewDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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
        System.out.println(new BlogNewDAO().getBlogNewByBlogTitle("NĂNG"));
    }
}
