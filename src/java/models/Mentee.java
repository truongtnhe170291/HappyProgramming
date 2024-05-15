/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author 2k3so
 */
public class Mentee extends Account{
    private String menteeGmail;

    public Mentee() {
    }

    public Mentee(String gmail, String userName, String fullName, String passWord, String dob, String sex, String address, String phone, String role, String status) {
        super(gmail, userName, fullName, passWord, dob, sex, address, phone, role, status);
    }

    @Override
    public String toString() {
        return "Mentee{" + "menteeGmail=" + menteeGmail + '}';
    }
    
}
