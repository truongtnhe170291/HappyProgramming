/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ScheduleDTO{
    private int cycleId;
    private String mentorName;
    private Date deadline;
    private String status;
    private List<SchedulePublic> list;

    public ScheduleDTO() {
    }

    public ScheduleDTO(String mentorName, Date deadline, String status) {
        this.mentorName = mentorName;
        this.deadline = deadline;
        this.status = status;
    }
    
    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<SchedulePublic> getList() {
        return list;
    }

    public void setList(List<SchedulePublic> list) {
        this.list = list;
    }

    public int getCycleId() {
        return cycleId;
    }

    public void setCycleId(int cycleId) {
        this.cycleId = cycleId;
    }

    @Override
    public String toString() {
        return "ScheduleDTO{" + "cycleId=" + cycleId + ", mentorName=" + mentorName + ", deadline=" + deadline + ", status=" + status + ", list=" + list + '}';
    }
    
}
