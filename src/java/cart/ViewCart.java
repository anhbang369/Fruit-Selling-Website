/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author 84348
 */
public class ViewCart {
    private Map<String, CartDTO> cart;

    public ViewCart() {
    }

    public ViewCart(Map<String, CartDTO> cart) {
        this.cart = cart;
    }

    public Map<String, CartDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, CartDTO> cart) {
        this.cart = cart;
    }
    public boolean add(CartDTO tm){
        boolean check=false;
        if(this.cart ==null){
            this.cart=new HashMap<>();
        }if(this.cart.containsKey(tm.getProductID())){
            
        }
        cart.put(tm.getProductID(), tm);
        check=true;
        return check;
    }
    public boolean remove(String productID){
        boolean check = false;
        if(this.cart!=null){
            if(this.cart.containsKey(productID)){
                this.cart.remove(productID);
            }
        }
        return check;
    }
    public boolean edit(String productID, CartDTO tm){
        boolean check = false;
        if(this.cart!=null){
            if(this.cart.containsKey(productID)){
                this.cart.replace(productID, tm);
            }
        }
        return check;
    }
}
