/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;
import java.sql.Date;
/**
 *
 * @author Admin
 */
public class CV {
    private int cvId;
    private String userName;
    private Mentor mentor;
    private String gmail, fullName;
    private Date dob;
    private boolean sex;
    private String address, profession, professionIntro, achievementDescription, serviceDescription;
    private int[] skills;
    private String imgcv;
    private int stattusId;
    private Status status;
    private String note;
    
    public CV() {
    }

    public CV(int cvId, String userName, String gmail, String fullName, Date dob, boolean sex, String address, String profession, String professionIntro, String achievementDescription, String serviceDescription, int[] skills, String imgcv, int stattusId, Status status) {
        this.cvId = cvId;
        this.userName = userName;
        this.gmail = gmail;
        this.fullName = fullName;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
        this.profession = profession;
        this.professionIntro = professionIntro;
        this.achievementDescription = achievementDescription;
        this.serviceDescription = serviceDescription;
        this.skills = skills;
        this.imgcv = imgcv;
        this.stattusId = stattusId;
        this.status = status;
    }

    public CV(int cvId, String userName, String gmail, String fullName, Date dob, boolean sex, String address, String profession, String professionIntro, String achievementDescription, String serviceDescription, int[] skills, String imgcv, int stattusId) {
        this.cvId = cvId;
        this.userName = userName;
        this.gmail = gmail;
        this.fullName = fullName;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
        this.profession = profession;
        this.professionIntro = professionIntro;
        this.achievementDescription = achievementDescription;
        this.serviceDescription = serviceDescription;
        this.skills = skills;
        this.imgcv = imgcv;
        this.stattusId = stattusId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public int getStattusId() {
        return stattusId;
    }

    public void setStattusId(int stattusId) {
        this.stattusId = stattusId;
    }

    public String getImgcv() {
        return imgcv;
    }

    public void setImgcv(String imgcv) {
        this.imgcv = imgcv;
    }
    
    

    public int[] getSkills() {
        return skills;
    }

    public void setSkills(int[] skills) {
        this.skills = skills;
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public Mentor getMentor() {
        return mentor;
    }

    public void setMentor(Mentor mentor) {
        this.mentor = mentor;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
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

    public String getServiceDescription() {
        return serviceDescription;
    }

    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
    }

    @Override
    public String toString() {
        return "CV{" + "cvId=" + cvId + ", userName=" + userName + ", mentor=" + mentor + ", gmail=" + gmail + ", fullName=" + fullName + ", dob=" + dob + ", sex=" + sex + ", address=" + address + ", profession=" + profession + ", professionIntro=" + professionIntro + ", achievementDescription=" + achievementDescription + ", serviceDescription=" + serviceDescription + ", skills=" + skills + ", imgcv=" + imgcv + ", stattusId=" + stattusId + ", status=" + status + ", note=" + note + '}';
    }

 
    
    
    
    
}