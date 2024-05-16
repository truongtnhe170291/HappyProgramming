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

    public Skill(int skillID, String skillName) {
        this.skillID = skillID;
        this.skillName = skillName;
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

    @Override
    public String toString() {
        return "Skill{" + "skillID=" + skillID + ", skillName=" + skillName + '}';
    }
    
    
}
