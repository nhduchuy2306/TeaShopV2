/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.review;

import java.sql.Date;

/**
 *
 * @author Huy
 */
public class ReviewDTO {
    private int reviewID;
    private String productID;
    private String content;
    private Date created;
    private int userID;
    private String name;

    public ReviewDTO() {
    }

    public ReviewDTO(int reviewID, String productID, String content, Date created, int userID) {
        this.reviewID = reviewID;
        this.productID = productID;
        this.content = content;
        this.created = created;
        this.userID = userID;
    }
    
    public ReviewDTO(int reviewID, String productID, String content, Date created, String name) {
        this.reviewID = reviewID;
        this.productID = productID;
        this.content = content;
        this.created = created;
        this.name = name;
    }
    
    public ReviewDTO(String productID, String content, Date created, int userID) {
        this.productID = productID;
        this.content = content;
        this.created = created;
        this.userID = userID;
    }

    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Review{" + "reviewID=" + reviewID + ", productID=" + productID + ", content=" + content + ", created=" + created + ", userID=" + userID + ", name=" + name + '}';
    }
    
    
}
