/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;
import java.sql.Date;
/**
 *
 * @author Admin
 */
public class MentorProfileDTO {
       private int cvID;
       private String gmail;
       private String fullName;
       private boolean sex;
       private String address;
       private String phone;
       private Date dob;
       private String avatar;
       private float rate;
       private String profession;
       private String professionIntro;
       private String achievementDescription;
       private String service_description;
       private List<FeedBackDTO> feedBacks;
       private List<Skill> listSkills;
       private String mentorName;
       private float starAVG;

    public MentorProfileDTO() {
    }

    public MentorProfileDTO(int cvID, String gmail, String fullName, boolean sex, String address, String phone, Date dob, String avatar, float rate, String profession, String professionIntro, String achievementDescription, String service_description, List<FeedBackDTO> feedBacks, List<Skill> listSkills) {
        this.cvID = cvID;
        this.gmail = gmail;
        this.fullName = fullName;
        this.sex = sex;
        this.address = address;
        this.phone = phone;
        this.dob = dob;
        this.avatar = avatar;
        this.rate = rate;
        this.profession = profession;
        this.professionIntro = professionIntro;
        this.achievementDescription = achievementDescription;
        this.service_description = service_description;
        this.feedBacks = feedBacks;
        this.listSkills = listSkills;
    }

    public MentorProfileDTO(int cvID, String gmail, String fullName, boolean sex, String address, String phone, Date dob, String avatar, float rate, String profession, String professionIntro, String achievementDescription, String service_description, List<FeedBackDTO> feedBacks, List<Skill> listSkills, String mentorName, float starAVG) {
        this.cvID = cvID;
        this.gmail = gmail;
        this.fullName = fullName;
        this.sex = sex;
        this.address = address;
        this.phone = phone;
        this.dob = dob;
        this.avatar = avatar;
        this.rate = rate;
        this.profession = profession;
        this.professionIntro = professionIntro;
        this.achievementDescription = achievementDescription;
        this.service_description = service_description;
        this.feedBacks = feedBacks;
        this.listSkills = listSkills;
        this.mentorName = mentorName;
        this.starAVG = starAVG;
    }

   
    

    public List<FeedBackDTO> getFeedBacks() {
        return feedBacks;
    }

    public void setFeedBacks(List<FeedBackDTO> feedBacks) {
        this.feedBacks = feedBacks;
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

    
    
        
   

    public int getCvID() {
        return cvID;
    }

    public void setCvID(int cvID) {
        this.cvID = cvID;
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

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getProfessionIntro() {
        return professionIntro;
    }

    public void setProfessionIntro(String professionIntro) {
        this.professionIntro = professionIntro;
    }

    public String getAchievementDescription() {
        return achievementDescription;
    }

    public void setAchievementDescription(String achievementDescription) {
        this.achievementDescription = achievementDescription;
    }

    public String getService_description() {
        return service_description;
    }

    public void setService_description(String service_description) {
        this.service_description = service_description;
    }

   

    public List<Skill> getListSkills() {
        return listSkills;
    }

    public void setListSkills(List<Skill> listSkills) {
        this.listSkills = listSkills;
    }

    @Override
    public String toString() {
        return "MentorProfileDTO{" + "cvID=" + cvID + ", gmail=" + gmail + ", fullName=" + fullName + ", sex=" + sex + ", address=" + address + ", phone=" + phone + ", dob=" + dob + ", avatar=" + avatar + ", rate=" + rate + ", profession=" + profession + ", professionIntro=" + professionIntro + ", achievementDescription=" + achievementDescription + ", service_description=" + service_description + ", feedBacks=" + feedBacks + ", listSkills=" + listSkills + ", mentorName=" + mentorName + ", starAVG=" + starAVG + '}';
    }

   
       
}
