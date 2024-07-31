/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

/**
 *
 * @author DIEN MAY XANH
 */
public class MentorProfileRate {
    
   
    private String mentorName;
    private String avatar;
    private String full_name;
    private float starAVG;
    private List<Skill> listSkills;
    private int cv_id;
    private float rate;  // Thêm thuộc tính rate

    public MentorProfileRate() {
    }

    public MentorProfileRate(String mentorName, String avatar, String full_name, float starAVG, List<Skill> listSkills, int cv_id, float rate) {
        this.mentorName = mentorName;
        this.avatar = avatar;
        this.full_name = full_name;
        this.starAVG = starAVG;
        this.listSkills = listSkills;
        this.cv_id = cv_id;
        this.rate = rate;  // Khởi tạo thuộc tính rate
    }

    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }

    public float getStarAVG() {
        return starAVG;
    }

    public void setStarAVG(float starAVG) {
        this.starAVG = starAVG;
    }

    public List<Skill> getListSkills() {
        return listSkills;
    }

    public void setListSkills(List<Skill> listSkills) {
        this.listSkills = listSkills;
    }

    public int getCv_id() {
        return cv_id;
    }

    public void setCv_id(int cv_id) {
        this.cv_id = cv_id;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
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

    @Override
    public String toString() {
        return "MentorProfile{" + "mentorName=" + mentorName + ", avatar=" + avatar + ", full_name=" + full_name + ", starAVG=" + starAVG + ", listSkills=" + listSkills + ", cv_id=" + cv_id + ", rate=" + rate + '}';
    }
}

