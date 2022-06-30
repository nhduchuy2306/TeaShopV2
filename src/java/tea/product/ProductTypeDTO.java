/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.product;

/**
 *
 * @author Huy
 */
public class ProductTypeDTO {
    private String productTypeID;
    private String productTypeName;

    public ProductTypeDTO() {
        productTypeID = "";
        productTypeName = "";
    }

    public ProductTypeDTO(String productTypeID, String productTypeName) {
        this.productTypeID = productTypeID;
        this.productTypeName = productTypeName;
    }

    public String getProductTypeID() {
        return productTypeID;
    }

    public void setProductTypeID(String productTypeID) {
        this.productTypeID = productTypeID;
    }

    public String getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        this.productTypeName = productTypeName;
    }

    @Override
    public String toString() {
        return "ProductType{" + "productTypeID=" + productTypeID + ", productTypeName=" + productTypeName + '}';
    }
    
}
