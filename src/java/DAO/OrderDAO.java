/*CREATE TABLE tblOrders (
   orderID int PRIMARY KEY,
   userID VARCHAR(30) NOT NULL,
   orderDate DATE NOT NULL DEFAULT GETDATE(),
   FOREIGN KEY (userID) REFERENCES tblUsers(userID)
);
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Utils.DBUtils;
import Models.Cart;
import Models.CartDetail;
import Models.Order;
import Models.OrderDetail;
import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author doant
 */
/**
 * This class represents a Data Access Object (DAO) for managing orders and
 * order details in the database.
 */
public class OrderDAO {

    private static final String INSERT_ORDER
            = "INSERT INTO tblOrders(orderID, userID, paymentMethod) VALUES (?, ?, ?)";
    private static final String INSERT_ORDER_DETAIL
            = "INSERT INTO tblOrderDetails(orderID, productID, quantity, price) VALUES (?, ?, ?, ?)";
    private static final String GET_ORDER_BY_USER_ID
            = "SELECT orderID, orderDate, paymentMethod FROM tblOrders WHERE userID = ? ORDER BY orderDate DESC";
    private static final String GET_ORDER_DETAIL_BY_ORDER_ID
            = "SELECT productID, quantity, price FROM tblOrderDetails WHERE orderID = ?";
    private static final String UPDATE_QUANTITY
            = "UPDATE tblProducts SET unitInStock=unitInStock-? WHERE productID = ?";

    /**
     * Inserts a new order and its details into the database.
     *
     * @param orderID The unique order identifier.
     * @param userID The user ID associated with the order.
     * @param cart The shopping cart containing order details.
     * @param paymentMethod The payment method used for the order.
     * @return True if the order was successfully inserted, false otherwise.
     * @throws SQLException If a database error occurs.
     */
    public boolean insertOrder(String orderID, String userID, Cart cart, String paymentMethod) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm_order = null;
        PreparedStatement ptm_orderDetail = null;
        PreparedStatement ptm_updateStock = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm_order = conn.prepareStatement(INSERT_ORDER);
                ptm_order.setString(1, orderID);
                ptm_order.setString(2, userID);
                ptm_order.setString(3, paymentMethod);
                check = ptm_order.executeUpdate() > 0 ? true : false;
                if (cart != null && check) {
                    for (CartDetail e : cart.getCart().values()) {
                        ptm_orderDetail = conn.prepareStatement(INSERT_ORDER_DETAIL);
                        ptm_orderDetail.setString(1, orderID);
                        ptm_orderDetail.setInt(2, e.getProduct().getProductID());
                        ptm_orderDetail.setInt(3, e.getQuantity());
                        ptm_orderDetail.setDouble(4, (e.getQuantity() * e.getProduct().getUnitPrice()));
                        ptm_orderDetail.executeUpdate();
                        ptm_updateStock = conn.prepareStatement(UPDATE_QUANTITY);
                        ptm_updateStock.setInt(1, e.getQuantity());
                        ptm_updateStock.setInt(2, e.getProduct().getProductID());
                        ptm_updateStock.executeUpdate();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm_order != null) {
                ptm_order.close();
            }
            if (ptm_orderDetail != null) {
                ptm_orderDetail.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    /**
     * Retrieves a list of orders for a given user ID.
     *
     * @param userID The user ID for which to retrieve orders.
     * @return An ArrayList of Order objects representing the user's orders.
     * @throws SQLException If a database error occurs.
     */
    public ArrayList<Order> getOrder(String userID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm_order = null;
        PreparedStatement ptm_orderDetail = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        ArrayList<Order> orderList = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ProductDAO productDAO = new ProductDAO();
                ptm_order = conn.prepareStatement(GET_ORDER_BY_USER_ID);
                ptm_order.setString(1, userID);
                rs = ptm_order.executeQuery();
                while (rs.next()) {
                    ptm_orderDetail = conn.prepareStatement(GET_ORDER_DETAIL_BY_ORDER_ID);
                    ptm_orderDetail.setString(1, rs.getString("orderID"));
                    ArrayList<OrderDetail> orderDetailList = new ArrayList();
                    rs2 = ptm_orderDetail.executeQuery();
                    while (rs2.next()) {
                        int productID = rs2.getInt("productID");
                        int quantity = rs2.getInt("quantity");
                        double price = rs2.getDouble("price");
                        Product newProduct = productDAO.getProductByID(String.valueOf(productID));
                        OrderDetail newOrderDetail = new OrderDetail(newProduct, quantity, price);
                        orderDetailList.add(newOrderDetail);
                    }
                    String orderID = rs.getString("orderID");
                    String paymentMethod = rs.getString("paymentMethod");
                    Date orderDate = rs.getDate("orderDate");
                    Order newOrder = new Order(orderID, userID, orderDate, orderDetailList, paymentMethod);
                    orderList.add(newOrder);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (rs2 != null) {
                rs2.close();
            }
            if (ptm_order != null) {
                ptm_order.close();
            }
            if (ptm_orderDetail != null) {
                ptm_orderDetail.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderList;
    }
}
