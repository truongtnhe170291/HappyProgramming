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
    
    private String mentorGmail ,avatar;

    public Mentor() {
    }

    public Mentor(String avatar, String gmail, String userName, String fullName, String passWord, String sex, String address, String phone, String role, String status, Date dob) {
        super(gmail, userName, fullName, passWord, sex, address, phone, role, status, dob);
        this.avatar = avatar;
    }

    

    public String getMentorGmail() {
        return mentorGmail;
    }

    public void setMentorGmail(String mentorGmail) {
        this.mentorGmail = mentorGmail;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Mentor{" + "mentorGmail=" + mentorGmail + ", avatar=" + avatar + '}';
    }

}
