/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author doant
 */
public class Order {

    private String orderID;
    private String userID;
    private String paymentMethod;
    private Date orderDate;
    private ArrayList<OrderDetail> orderDetail;

    public Order(String orderID, String userID, Date orderDate, ArrayList<OrderDetail> orderDetail, String paymentMethod) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.orderDetail = orderDetail;
        this.paymentMethod = paymentMethod;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getUserID() {
        return userID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public ArrayList<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(ArrayList<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    

}
