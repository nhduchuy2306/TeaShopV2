/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.banner;

/**
 *
 * @author Huy
 */
public class BannerDTO {
    private int bannerID;
    private String bannerImg;

    public BannerDTO() {
    }

    public BannerDTO(int bannerID, String bannerImg) {
        this.bannerID = bannerID;
        this.bannerImg = bannerImg;
    }

    public int getBannerID() {
        return bannerID;
    }

    public void setBannerID(int bannerID) {
        this.bannerID = bannerID;
    }

    public String getBannerImg() {
        return bannerImg;
    }

    public void setBannerImg(String bannerImg) {
        this.bannerImg = bannerImg;
    }

    @Override
    public String toString() {
        return "Banner{" + "bannerID=" + bannerID + ", bannerImg=" + bannerImg + '}';
    }

}
