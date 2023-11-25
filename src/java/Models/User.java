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
public class User {

    private String userID;
    private String googleID;
    private String fullName;
    private String roleID;
    private String status;
    private String password;
    private String email;   // New field for email
    private String address; // New field for address
    private String phone;   // New field for phone
    private String userImg;

    public User(String userID, String fullName, String roleID, String password) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
    }

    public User() {

    }

    public String getUserID() {
        return userID;
    }

    public String getFullName() {
        return fullName;
    }

    public String getRoleID() {
        return roleID;
    }

    public String getStatus() {
        return status;
    }

    public String getPassword() {
        return password;
    }

    public String getGoogleID() {
        return googleID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setGoogleID(String googleID) {
        this.googleID = googleID;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Getter and Setter for the new fields
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }
    
    @Override
    public String toString() {
        return "User{"
                + "userID='" + userID + '\''
                + ", fullName='" + fullName + '\''
                + ", roleID='" + roleID + '\''
                + ", status='" + status + '\''
                + ", email='" + email + '\''
                + // Include email in the toString
                ", address='" + address + '\''
                + // Include address in the toString
                ", phone='" + phone + '\''
                + // Include phone in the toString
                '}';
    }
}
