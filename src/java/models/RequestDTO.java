/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public class RequestDTO extends Request{
    
    private List<Skill> listSkills;
    private List<SchedulePublic> listSchedule;
    private Status status;
    public RequestDTO() {
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public List<Skill> getListSkills() {
        return listSkills;
    }

    public void setListSkills(List<Skill> listSkills) {
        this.listSkills = listSkills;
    }

    public List<SchedulePublic> getListSchedule() {
        return listSchedule;
    }

    public void setListSchedule(List<SchedulePublic> listSchedule) {
        this.listSchedule = listSchedule;
    }
    
    
    
}
