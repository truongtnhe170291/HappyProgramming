/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

/**
 *
 * @author Admin
 */
public class MentorProfile {
    private int cvID;
    private String avatar;
    private String full_name;
    private int star;

    public MentorProfile(int cvID, String avatar, String full_name, int star) {
        this.cvID = cvID;
        this.avatar = avatar;
        this.full_name = full_name;
        this.star = star;
    }

    public int getCvID() {
        return cvID;
    }

    public void setCvID(int cvID) {
        this.cvID = cvID;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    @Override
    public String toString() {
        return "MentorProfile{" + "cvID=" + cvID + ", avatar=" + avatar + ", full_name=" + full_name + ", star=" + star + '}';
    }
    
}
