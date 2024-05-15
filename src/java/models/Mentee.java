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
    private String menteeGmail, avatar;

    public Mentee() {
    }

    public Mentee(String avatar, String gmail, String userName, String fullName, String passWord, String dob, String sex, String address, String phone, String role, String status) {
        super(gmail, userName, fullName, passWord, dob, sex, address, phone, role, status);
        this.avatar = avatar;
    }
    
    public String getMenteeGmail() {
        return menteeGmail;
    }

    public void setMenteeGmail(String menteeGmail) {
        this.menteeGmail = menteeGmail;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Mentee{" + "menteeGmail=" + super.getGmail() + ", avatar=" + avatar + '}';
    }

}
