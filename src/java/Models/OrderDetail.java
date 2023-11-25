/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author doant
 */
public class OrderDetail {

    private int orderID;
    private Product product;
    private int quantity;
    private double price;

    public OrderDetail(Product product, int quantity, double price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrderID() {
        return orderID;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public void setProduct(Product product) {
        this.product = product;
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
    
    
    

}
