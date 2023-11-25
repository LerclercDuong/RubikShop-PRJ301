/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.HashMap;

/**
 *
 * @author doant
 */
import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartDetail> cart;

    public Cart() {

    }

    public Cart(Map<Integer, CartDetail> cart) {
        this.cart = cart;
    }

    public Map<Integer, CartDetail> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, CartDetail> cart) {
        this.cart = cart;
    }

    public void add(CartDetail cartDetail) {
        if (this.cart == null) {
            this.cart = new HashMap<Integer, CartDetail>();
        }
        if (this.cart.containsKey(cartDetail.getProduct().getProductID())) {
            int currentQuantity = this.cart.get(cartDetail.getProduct().getProductID()).getQuantity();
            cartDetail.setQuantity(currentQuantity + cartDetail.getQuantity());
        }
        cart.put(cartDetail.getProduct().getProductID(), cartDetail);
    }

    public boolean remove(int id) {
        boolean result = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                result = true;
            }
        }
        return result;
    }

    public boolean edit(int id, CartDetail cartdetail) {
        boolean result = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, cartdetail);
                result = true;
            }
        }
        return result;
    }
}
