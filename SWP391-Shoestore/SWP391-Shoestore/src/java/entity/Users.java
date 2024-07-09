/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Users {

    int userID;
    String userName;
    String password;
    String email;
    int roleID;
    int statusID;
    private Boolean isActive;
    private byte[] secretKey;

    private Boolean isSigninWithGoogle;

    public Users(int userID, String userName, String password, String email, int roleID, int statusID) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.roleID = roleID;
        this.statusID = statusID;
    }

    public Users(int userID, String userName, String password, String email) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
    }

    public Users(String userName, String password, String email) {
        this.userName = userName;
        this.password = password;
        this.email = email;
    }

    public Users(int userID, String userName, String password, String email, int roleID, int statusID, Boolean isActive, byte[] secretKey, Boolean isSigninWithGoogle) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.roleID = roleID;
        this.statusID = statusID;
        this.isActive = isActive;
        this.secretKey = secretKey;
        this.isSigninWithGoogle = isSigninWithGoogle;
    }

    public Users(int userID, String userName, String password, String email, int roleID, int statusID, Boolean isActive, byte[] secretKey) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.roleID = roleID;
        this.statusID = statusID;
        this.isActive = isActive;
        this.secretKey = secretKey;
    }

    public Users() {
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public byte[] getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(byte[] secretKey) {
        this.secretKey = secretKey;
    }

    public Boolean getIsSigninWithGoogle() {
        return isSigninWithGoogle;
    }

    public void setIsSigninWithGoogle(Boolean isSigninWithGoogle) {
        this.isSigninWithGoogle = isSigninWithGoogle;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getStatusID() {
        if (statusID == 1) {
            return "Active";
        } else if (statusID == 2) {
            return "Locked";
        } else if (statusID == 3) {
            return "Gmail Login";
        } else {
            return "Unverified";
        }
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    @Override
    public String toString() {
        return "Users{" + "userID=" + userID + ", userName=" + userName + ", password=" + password + ", email=" + email + ", roleID=" + roleID + ", statusID=" + statusID + '}';
    }

}
