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
    private String gMailMentor;
    private Mentor mentor;
    private String gMail, userName, fullName;
    private Date dob;
    private boolean sex;
    private String address,avatar, profession, professionIntro, achievementDescription, serviceDescription;
    private int[] skills;
    
    public CV() {
    }

    public CV(int cvId, String gMailMentor, Mentor mentor, String gMail, String userName, String fullName, Date dob, boolean sex, String address, String avatar, String profession, String professionIntro, String achievementDescription, String serviceDescription, int[] skills) {
        this.cvId = cvId;
        this.gMailMentor = gMailMentor;
        this.mentor = mentor;
        this.gMail = gMail;
        this.userName = userName;
        this.fullName = fullName;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
        this.avatar = avatar;
        this.profession = profession;
        this.professionIntro = professionIntro;
        this.achievementDescription = achievementDescription;
        this.serviceDescription = serviceDescription;
        this.skills = skills;
    }

    public CV(int cvId, String gMailMentor, String gMail, String userName, String fullName, Date dob, boolean sex, String address, String avatar, String profession, String professionIntro, String achievementDescription, String serviceDescription, int[] skills) {
        this.cvId = cvId;
        this.gMailMentor = gMailMentor;
        this.gMail = gMail;
        this.userName = userName;
        this.fullName = fullName;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
        this.avatar = avatar;
        this.profession = profession;
        this.professionIntro = professionIntro;
        this.achievementDescription = achievementDescription;
        this.serviceDescription = serviceDescription;
        this.skills = skills;
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

    public String getgMailMentor() {
        return gMailMentor;
    }

    public void setgMailMentor(String gMailMentor) {
        this.gMailMentor = gMailMentor;
    }

    public Mentor getMentor() {
        return mentor;
    }

    public void setMentor(Mentor mentor) {
        this.mentor = mentor;
    }

    public String getgMail() {
        return gMail;
    }

    public void setgMail(String gMail) {
        this.gMail = gMail;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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
    
    
    
    
}
