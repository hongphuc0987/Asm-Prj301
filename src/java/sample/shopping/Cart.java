/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author tranthihongphuc
 */
public class Cart {

    private Map<String, Fruit> cart;

    public Cart() {
    }

    public Cart(Map<String, Fruit> cart) {
        this.cart = cart;
    }

    public Map<String, Fruit> getCart() {
        return cart;
    }

    public void setCart(Map<String, Fruit> cart) {
        this.cart = cart;
    }

    public void add(Fruit fruit) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(fruit.getId())) {
            int currentQuantity = this.cart.get(fruit.getId()).getQuantity();
            fruit.setQuantity(currentQuantity + fruit.getQuantity());
        }
        cart.put(fruit.getId(), fruit);
    }

    public void delete(String id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public void update(String id, Fruit newfruit) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.replace(id, newfruit);
        }
    }
}
