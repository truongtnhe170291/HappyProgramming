/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class Skill {
    private int skillID;
    private String skillName;
    private String img;
    private String description;
    private boolean status;

    public Skill(int skillID, String skillName, String img, String description, boolean status) {
        this.skillID = skillID;
        this.skillName = skillName;
        this.img = img;
        this.description = description;
        this.status = status;
    }

    public Skill(int skillID, String skillName) {
        this.skillID = skillID;
        this.skillName = skillName;
    }
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Skill() {
    }

    public int getSkillID() {
        return skillID;
    }

    public void setSkillID(int skillID) {
        this.skillID = skillID;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Skill{" + "skillID=" + skillID + ", skillName=" + skillName + ", img=" + img + ", description=" + description + ", status=" + status + '}';
    }

    

   
    
}
