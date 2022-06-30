/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.items;

import java.util.HashMap;

/**
 *
 * @author Huy
 */
public class Cart {
    private HashMap<String, ItemDTO> cart;

    public Cart() {
    }

    public Cart(HashMap<String, ItemDTO> cart) {
        this.cart = cart;
    }

    public HashMap<String, ItemDTO> getCart() {
        return cart;
    }

    public void setCart(HashMap<String, ItemDTO> cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return "Cart{" + "cart=" + cart + '}';
    }
    
    public boolean addtoCart(ItemDTO item){
        boolean check = false;
        if(this.cart==null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(item.getProduct().getProductID())){
            int currentQuantity = this.cart.get(item.getProduct().getProductID()).getQuantity();
            item.setQuantity(currentQuantity + item.getQuantity());
        }
        this.cart.put(item.getProduct().getProductID(), item);
        check = true;
        return check;
    }
    
    public boolean remove(String id){
        boolean check = false;
        if(this.cart!=null){
            if(this.cart.containsKey(id)){
                this.cart.remove(id);
                check = true;
            }
        }
        return check;
    }
    
    public boolean edit(String id, ItemDTO item){
        boolean check = false;
        if(this.cart!=null){
            if(this.cart.containsKey(id)){
                this.cart.replace(id, item);
                check = true;
            }
        }
        return check;
    }
    
    public ItemDTO getItem(String id){
        return this.cart.get(id);
    }
}
