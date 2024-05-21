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
    private String mentorName;
    private String avatar;
    private String full_name;
    private float starAVG;

    public MentorProfile() {
    }

    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }

    public MentorProfile(String mentorName, String avatar, String full_name, float starAVG) {
        this.mentorName = mentorName;
        this.avatar = avatar;
        this.full_name = full_name;
        this.starAVG = starAVG;
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

    public float getStar() {
        return starAVG;
    }

    public void setStar(float starAVG) {
        this.starAVG = starAVG;
    }

    @Override
    public String toString() {
        return "MentorProfile{" + "mentorName=" + mentorName + ", avatar=" + avatar + ", full_name=" + full_name + ", starAVG=" + starAVG + '}';
    }

    

  
    
}
