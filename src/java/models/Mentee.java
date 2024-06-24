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
    
    public Mentee() {
    }
    
    public Mentee(String userName) {
        super(userName);
    }

    public Mentee(String userName, String gmail, String fullName, String password, Date dob, boolean sex, String address, String phone, String avatar, int roleId, int statusId) {
        super(userName, gmail, fullName, password, dob, sex, address, phone, avatar, roleId, statusId);
    }
    
}
