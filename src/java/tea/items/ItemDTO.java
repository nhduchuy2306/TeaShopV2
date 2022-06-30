/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.items;

import tea.product.ProductDTO;

/**
 *
 * @author Huy
 */
public class ItemDTO {
    private int id;
    private ProductDTO product;
    private int quantity;
    private double price;

    public ItemDTO() {
    }

    public ItemDTO(int id, ProductDTO product, int quantity, double price) {
        this.id = id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Item{" + "id=" + id + ", product=" + product + ", quantity=" + quantity + ", price=" + price + '}';
    }

    
}
