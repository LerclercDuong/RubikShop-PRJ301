/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Utils.DBUtils;
import Models.User;
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
public class UserDAO {

    private static final String LOGIN
            = "SELECT userID, fullName, roleID, email, address, phone FROM tblUsers WHERE userID=? AND password=? AND status=1";
    private static final String GET_ROLE_NAME
            = "SELECT roleName FROM tblRoles WHERE roleID=?";
    private static final String SEARCH
            = "SELECT userID, email, googleID, fullName, roleID, address, phone FROM tblUsers WHERE fullName LIKE ? AND status = 1";
    private static final String DELETE
            = "DELETE FROM tblUsers WHERE userID=?";
    private static final String SOFT_DELETE
            = "UPDATE tblUsers SET status=? WHERE userID=?";
    private static final String UPDATE
            = "UPDATE tblUsers SET fullName=?, roleID=?, address=?, phone=? WHERE userID=?";
    private static final String INSERT
            = "INSERT INTO tblUsers (userID, fullName, password, email, address, phone, roleID, status, googleID) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String CHECK_DUPLICATE
            = "SELECT fullName FROM tblUsers WHERE userID=?";
    private static final String GET_USER_BY_GOOGLE_ID
            = "SELECT userID FROM tblUsers WHERE googleID=?";
    private static final String CHECK_GOOGLE_USER
            = "SELECT userID FROM tblUsers WHERE googleID=?";
    private static final String COUNT_USER
            = "SELECT Count(*) as num FROM tblUsers WHERE roleID='AD'";

    public String countUser() throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String result = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_USER);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    
                    result = rs.getString(1);
                    System.out.println(result);
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
    public User checkLogin(String userID, String pwd) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        User user = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, pwd);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    user = new User(userID, fullName, roleID, "");
                    user.setAddress(address);
                    user.setEmail(email);
                    user.setPhone(phone);
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
        return user;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public List<User> getListUser(String search) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<User> result = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID
                            = rs.getString("userID");
                    String fullName
                            = rs.getString("fullName");
                    String roleID
                            = rs.getString("roleID");
                    //additional
                    String googleID
                            = rs.getString("googleID"); // Retrieve email from the result set
                    String email
                            = rs.getString("email"); // Retrieve email from the result set
                    String address
                            = rs.getString("address"); // Retrieve address from the result set
                    String phone
                            = rs.getString("phone"); // Retrieve phone from the result set

                    User user = new User(userID, fullName, roleID, "***");
                    result.add(user);
                    // Set the additional fields in the User object
                    user.setGoogleID(googleID);
                    user.setEmail(email);
                    user.setAddress(address);
                    user.setPhone(phone);

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

    public boolean update(User user) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getRoleID());
                ptm.setString(3, user.getAddress());
                ptm.setString(4, user.getPhone());
                ptm.setString(5, user.getUserID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {

        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean delete(String userID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SOFT_DELETE);
                ptm.setBoolean(1, false);
                ptm.setString(2, userID);
                result = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean insert(User user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getPassword());
                ptm.setString(4, user.getEmail());
                ptm.setString(5, user.getAddress());
                ptm.setString(6, user.getPhone());
                ptm.setString(7, user.getRoleID());
                ptm.setString(8, user.getStatus());
                ptm.setString(9, user.getGoogleID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    //if google is not in db yet, insert it
    public void checkGoogleUser(User googleUser) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_USER_BY_GOOGLE_ID);
                ptm.setString(1, googleUser.getGoogleID());
                rs = ptm.executeQuery();
                if (!rs.next()) {
                    this.insert(googleUser);
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
    }
}
