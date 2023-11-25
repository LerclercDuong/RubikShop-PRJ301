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
public class UserError {

    public String userIDError;
    public String fullNameError;
    public String passwordError;
    public String roleID;
    private String confirmError;
    private String error;

    public UserError() {
        this.userIDError = "*";
        this.fullNameError = "*";
        this.passwordError = "*";
        this.roleID = "*";
        this.confirmError = "*";
        this.error = "*";
    }

    public UserError(String userIDError, String fullNameError, String passwordError, String roleID, String confirmError, String error) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.roleID = roleID;
        this.confirmError = confirmError;
        this.error = error;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public String getError() {
        return error;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public void setError(String error) {
        this.error = error;
    }

    @Override
    public String toString() {
        return "UserError{" + "userIDError=" + userIDError + ", fullNameError=" + fullNameError + ", passwordError=" + passwordError + ", roleID=" + roleID + ", confirmError=" + confirmError + ", error=" + error + '}';
    }

}
