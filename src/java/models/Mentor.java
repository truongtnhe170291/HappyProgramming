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
public class Mentor extends Account{
    private double rate;
    

    public Mentor() {
    }

    public Mentor(String userName) {
        super(userName);
    }
    

    public Mentor(String userName, String gmail, String fullName, String password, Date dob, boolean sex, String address, String phone, String avatar, int roleId, int statusId) {
        super(userName, gmail, fullName, password, dob, sex, address, phone, avatar, roleId, statusId);
    }

    public Mentor(double rate, String userName, String gmail, String fullName, String password, Date dob, boolean sex, String address, String phone, String avatar, int roleId, int statusId) {
        super(userName, gmail, fullName, password, dob, sex, address, phone, avatar, roleId, statusId);
        this.rate = rate;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    

}
