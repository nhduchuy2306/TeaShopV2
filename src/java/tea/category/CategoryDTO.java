/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.category;

/**
 *
 * @author Huy
 */
public class CategoryDTO {
    private String categoryID;
    private String categoryName;
    private String categoryImg;
    private String hashTag;

    public CategoryDTO() {
    }

    public CategoryDTO(String categoryID, String categoryName, String categoryImg,String hashTag) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryImg = categoryImg;
        this.hashTag = hashTag;
    }

    public CategoryDTO(String categoryID, String categoryName, String categoryImg) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryImg = categoryImg;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryImg() {
        return categoryImg;
    }

    public void setCategoryImg(String categoryImg) {
        this.categoryImg = categoryImg;
    }

    public String getHashTag() {
        return hashTag;
    }

    public void setHashTag(String hashTag) {
        this.hashTag = hashTag;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryID=" + categoryID + ", categoryName=" + categoryName + ", categoryImg=" + categoryImg + ", hashTag=" + hashTag + '}';
    }

}
