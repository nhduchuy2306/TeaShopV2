/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.product;

import java.sql.Date;

/**
 *
 * @author Huy
 */
public class ProductDTO {
    private String productID;
    private String productName;
    private double productPrice;
    private String productStatus;
    private String productDescription;
    private int productDiscount;
    private String productImg;
    private Date productCreated;
    private String categoryID;
    private int quantity;
    private String productTypeName;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String productName, double productPrice, String productStatus, String productDescription, int productDiscount, String productImg, Date productCreated, String categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productStatus = productStatus;
        this.productDescription = productDescription;
        this.productDiscount = productDiscount;
        this.productImg = productImg;
        this.productCreated = productCreated;
        this.categoryID = categoryID;
    }

    public ProductDTO(String productID, String productName, double productPrice, String productStatus, String productDescription, int productDiscount, String productImg, Date productCreated, String categoryID, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productStatus = productStatus;
        this.productDescription = productDescription;
        this.productDiscount = productDiscount;
        this.productImg = productImg;
        this.productCreated = productCreated;
        this.categoryID = categoryID;
        this.quantity = quantity;
    }

    public ProductDTO(String productID, String productName, String productTypeName) {
        this.productID = productID;
        this.productName = productName;
        this.productTypeName = productTypeName;
    }

    public String getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        this.productTypeName = productTypeName;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public int getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(int productDiscount) {
        this.productDiscount = productDiscount;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public Date getProductCreated() {
        return productCreated;
    }

    public void setProductCreated(Date productCreated) {
        this.productCreated = productCreated;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", productPrice=" + productPrice + ", productStatus=" + productStatus + ", productDescription=" + productDescription + ", productDiscount=" + productDiscount + ", productImg=" + productImg + ", productCreated=" + productCreated + ", categoryID=" + categoryID + ", quantity=" + quantity + ", productTypeName=" + productTypeName + '}';
    }
    
}
