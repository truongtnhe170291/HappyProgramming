package models;

import java.sql.Date;

public class Account {

    private String userName;
    private String gmail;
    private String fullName;
    private String password;
    private Date dob;
    private boolean sex;
    private String address;
    private String phone;
    private String avatar;
    private int roleId;
    private int statusId;

    public Account() {
    }

    public Account(String userName) {
        this.userName = userName;
    }

    public Account(String userName, String gmail, String fullName, String password, Date dob, boolean sex, String address, String phone, int roleId, int statusId) {
        this.userName = userName;
        this.gmail = gmail;
        this.fullName = fullName;
        this.password = password;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
        this.phone = phone;
        this.roleId = roleId;
        this.statusId = statusId;
    }

    public Account(String userName, String gmail, String fullName, String password, Date dob, boolean sex, String address, String phone, String avatar, int roleId, int statusId) {
        this.userName = userName;
        this.gmail = gmail;
        this.fullName = fullName;
        this.password = password;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
        this.phone = phone;
        this.avatar = avatar;
        this.roleId = roleId;
        this.statusId = statusId;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
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

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @Override
    public String toString() {
        return "Account{" + "userName=" + userName + ", gmail=" + gmail + ", fullName=" + fullName + ", password=" + password + ", dob=" + dob + ", sex=" + sex + ", address=" + address + ", phone=" + phone + ", roleId=" + roleId + ", statusId=" + statusId + ", avatar=" + avatar +'}';
    }

}
