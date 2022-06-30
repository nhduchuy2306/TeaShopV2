/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.user;

import java.util.Date;

/**
 *
 * @author Huy
 */
public class UserError {

    private String userID;
    private String name;
    private String email;
    private String address;
    private String phone;
    private Date created;
    private String roleID;
    private String username;
    private String password;
    private String confirm;

    public UserError() {
        userID = "";
        name = "";
        email = "";
        address = "";
        phone = "";
        created = null;
        roleID = "";
        username = "";
        password = "";
        confirm = "";
    }

    public UserError(String userID, String name, String email, String address, String phone, Date created, String roleID, String username, String password, String confirm) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.created = created;
        this.roleID = roleID;
        this.username = username;
        this.password = password;
        this.confirm = confirm;
    }

    public UserError(String name, String email, String address, String phone, Date created, String roleID, String username, String password, String confirm) {
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.created = created;
        this.roleID = roleID;
        this.username = username;
        this.password = password;
        this.confirm = confirm;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

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

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    @Override
    public String toString() {
        return "UserError{" + "userID=" + userID + ", name=" + name + ", email=" + email + ", address=" + address + ", phone=" + phone + ", created=" + created + ", roleID=" + roleID + ", username=" + username + ", password=" + password + ", confirm=" + confirm + '}';
    }

}
