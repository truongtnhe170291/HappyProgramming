/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RequestSkill extends  Request{
     private List<Skill> listSkills;

    public RequestSkill() {
    }

    public RequestSkill(List<Skill> listSkills, int requestId, String mentorName, String menteeName, LocalDate deadlineDate, String title, String description, int statusId, LocalTime deadlineHour) {
        super(requestId, mentorName, menteeName, deadlineDate, title, description, statusId, deadlineHour);
        this.listSkills = listSkills;
    }

    public List<Skill> getListSkills() {
        return listSkills;
    }

    public void setListSkills(List<Skill> listSkills) {
        this.listSkills = listSkills;
    }

    
}
