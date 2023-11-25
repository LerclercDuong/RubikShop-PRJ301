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
public class Category {

    int categoryID;
    String categoryName;
    String categoryImage;

    public Category() {
    }

    public Category(int categoryID, String categoryName, String categoryImage) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryImage = categoryImage;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public String getCategoryImage() {
        return categoryImage;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setCategoryImage(String categoryImage) {
        this.categoryImage = categoryImage;
    }

}
