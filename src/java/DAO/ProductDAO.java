/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Utils.DBUtils;
import Models.Category;
import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author doant
 */
//CREATE TABLE tblProduct(
//   productID INT PRIMARY KEY NOT NULL,
//   productName NVARCHAR(255) NOT NULL,
//   description NVARCHAR(MAX) DEFAULT '',
//   categoryID INT NOT NULL,
//   unitPrice INT NOT NULL,
//   unitInStock INT NOT NULL,
//   image NVARCHAR(MAX) NULL,
//   Foreign key(categoryID) references tblCategory(categoryID),
//);	
public class ProductDAO {

    private static final String SEARCH_PRODUCT
            = "SELECT productID, productName, description, categoryID, unitPrice, unitInStock, image FROM tblProducts WHERE productName LIKE ? AND categoryID LIKE ?";
    private static final String GET_CATEGORY_ID
            = "SELECT categoryID FROM tblCategorys WHERE categoryName = ?";
    private static final String GET_CATEGORY
            = "SELECT categoryID, categoryName, image FROM tblCategorys";
    private static final String GET_PRODUCT_BY_ID
            = "SELECT productID, productName, description, categoryID, unitPrice, unitInStock, image FROM tblProducts WHERE productID = ?";

    /**
     * Retrieves a product by its unique ID.
     *
     * @param ID The unique product identifier.
     * @return A Product object representing the product.
     * @throws SQLException If a database error occurs.
     */
    public Product getProductByID(String ID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Product product = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                // Create a SQL query to retrieve the product by its ID
                ptm = conn.prepareStatement(GET_PRODUCT_BY_ID);
                ptm.setString(1, ID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String productID
                            = rs.getString("productID");
                    String productName
                            = rs.getString("productName");
                    String description
                            = rs.getString("description");
                    String unitPrice
                            = rs.getString("unitPrice");
                    String unitInStock
                            = rs.getString("unitInStock");
                    String categoryID
                            = rs.getString("categoryID");
                    String image
                            = rs.getString("image");

                    product = new Product(
                            Integer.parseInt(productID),
                            productName,
                            description,
                            categoryID,
                            Double.parseDouble(unitPrice),
                            Integer.parseInt(unitInStock),
                            image
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return product;
    }

    /**
     * Retrieves a list of products based on search criteria.
     *
     * @param name The product name or search keyword.
     * @param category The category ID for filtering (use -1 for no filter).
     * @param page The page number for pagination.
     * @param size The number of products to fetch per page.
     * @return A list of Product objects matching the search criteria.
     * @throws SQLException If a database error occurs.
     */
    public List<Product> getListProduct(String name, int category) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<Product> result = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRODUCT);
                ptm.setString(1, "%" + name + "%");
                if (category == -1) {
                    ptm.setString(2, "%" + "" + "%");
                } else {
                    ptm.setString(2, "%" + category + "%");
                }

                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID
                            = rs.getString("productID");
                    String productName
                            = rs.getString("productName");
                    String description
                            = rs.getString("description");
                    String unitPrice
                            = rs.getString("unitPrice");
                    String unitInStock
                            = rs.getString("unitInStock");
                    String categoryID
                            = rs.getString("categoryID");
                    String image
                            = rs.getString("image");

                    Product product = new Product(
                            Integer.parseInt(productID),
                            productName,
                            description,
                            categoryID,
                            Double.parseDouble(unitPrice),
                            Integer.parseInt(unitInStock),
                            image
                    );
                    result.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    /**
     * Retrieves a list of product categories.
     *
     * @return A list of Category objects representing product categories.
     * @throws SQLException If a database error occurs.
     */
    public List<Category> getListCategory() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<Category> categoryList = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CATEGORY);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int categoryID
                            = rs.getInt("categoryID");
                    String categoryName
                            = rs.getString("categoryName");
                    String categoryImage
                            = rs.getString("image");

                    Category category = new Category(
                            categoryID,
                            categoryName,
                            categoryImage);

                    categoryList.add(category);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return categoryList;
    }

    /**
     * Retrieves the category ID based on the category name.
     *
     * @param categoryName The name of the category.
     * @return The category ID corresponding to the given category name.
     * @throws SQLException If a database error occurs.
     */
    public int getCategoryID(String categoryName) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int categoryID = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CATEGORY_ID);
                ptm.setString(1, categoryName);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    categoryID
                            = rs.getInt("categoryID");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return categoryID;
    }
}
