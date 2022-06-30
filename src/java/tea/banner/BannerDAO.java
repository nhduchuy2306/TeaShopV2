/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.banner;

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
public class BannerDAO {
    private static final String GET_ALL_BANNER = "SELECT bannerNewID, images FROM tblBannerNew";
    
    public List<BannerDTO> getAllBanner(){
        List<BannerDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_ALL_BANNER);
                rs = ptm.executeQuery();
                while(rs.next()){
                    list.add(new BannerDTO(rs.getInt(1), rs.getString(2)));
                }
            }
        } catch (Exception e) {
        } finally{
            Common.CloseConnection(conn, ptm, rs);
        }
        return list;
    }
}
