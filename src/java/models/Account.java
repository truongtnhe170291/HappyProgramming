/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author 2k3so
 */
public class Account {
    private String gmail, userName, fullName, passWord, dob, sex, address, phone, role, status;

    public Account() {
    }

    public Account(String gmail, String userName, String fullName, String passWord, String dob, String sex, String address, String phone, String role, String status) {
        this.gmail = gmail;
        this.userName = userName;
        this.fullName = fullName;
        this.passWord = passWord;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
        this.phone = phone;
        this.role = role;
        this.status = status;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" + "gmail=" + gmail + ", userName=" + userName + ", fullName=" + fullName + ", passWord=" + passWord + ", dob=" + dob + ", sex=" + sex + ", address=" + address + ", phone=" + phone + ", role=" + role + ", status=" + status + '}';
    }
    
}
