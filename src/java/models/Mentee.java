/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;

/**
 *
 * @author 2k3so
 */
public class Mentee extends Account{
    private String menteeName, avatar;

    public Mentee() {
    }

    public Mentee(String avatar, String userName, String gmail, String fullName, String password, Date dob, boolean sex, String address, String phone, int roleId, int statusId) {
        super(userName, gmail, fullName, password, dob, sex, address, phone, roleId, statusId);
        this.avatar = avatar;
    }
    
    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Mentee{" + super.toString() + "avatar=" + avatar + '}';
    }
    
}
