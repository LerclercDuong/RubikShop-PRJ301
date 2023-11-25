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
public class Product {

    private int productID;
    private String productName;
    private String description;
    private String categoryName;
    private double unitPrice;
    private int unitInStock;
    private String image;
    
    public Product(int productID, String productName, String description, String categoryName, double unitPrice, int unitInStock, String image) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.categoryName = categoryName;
        this.unitPrice = unitPrice;
        this.unitInStock = unitInStock;
        this.image = image;
    }


    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryID(String categoryName) {
        this.categoryName = categoryName;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getUnitInStock() {
        return unitInStock;
    }

    public void setUnitInStock(int unitInStock) {
        this.unitInStock = unitInStock;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    

    @Override
    public String toString() {
        return "Product{" +
                "productID=" + productID +
                ", productName='" + productName + '\'' +
                ", description='" + description + '\'' +
                ", categoryName=" + categoryName +
                ", unitPrice=" + unitPrice +
                ", unitInStock=" + unitInStock +
                ", image='" + image + '\'' +
                '}';
    }

}
