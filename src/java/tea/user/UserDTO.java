/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.user;

import java.sql.Date;

/**
 *
 * @author Huy
 */
public class UserDTO {
    private String userID;
    private String name;
    private String email;
    private String address;
    private String phone;
    private Date create;
    private String roleID;
    private String password;
    private String username;

    public UserDTO() {
        userID = "";
        name = "";
        email = "";
        address = "";
        phone = "";
        create = null;
        roleID = "";
        password = "";
        username = "";
    }

    public UserDTO(String userID, String name, String email, String address, String phone, Date create, String roleID, String password, String username) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.create = create;
        this.roleID = roleID;
        this.password = password;
        this.username = username;
    }
    public UserDTO(String userID, String name, String email, String address, String phone, Date create, String roleID, String username) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.create = create;
        this.roleID = roleID;
        this.username = username;
    }
    public UserDTO(String name, String email, String address, String phone, Date create, String roleID, String password, String username) {
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.create = create;
        this.roleID = roleID;
        this.password = password;
        this.username = username;
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

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", name=" + name + ", email=" + email + ", address=" + address + ", phone=" + phone + ", create=" + create + ", roleID=" + roleID + ", password=" + password + ", username=" + username + '}';
    }

    
    
    
}
