/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.users;

/**
 *
 * @author tranthihongphuc
 */
public class UserDTO {

    private String UserID;
    private String fullName;
    private String roleID;
    private String password;

    public UserDTO() {
    }

    public UserDTO(String UserID, String fullName, String roleID, String password) {
        this.UserID = UserID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
