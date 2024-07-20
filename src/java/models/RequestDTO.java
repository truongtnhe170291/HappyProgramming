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
    private String note;
    private int cvId;
    private int absent, attended;
    private boolean isEnoughPay;
    
    public RequestDTO() {
    }
    
    public RequestDTO(List<Skill> listSkills, List<SchedulePublic> listSchedule, Status status, String note, int requestId, String mentorName, String menteeName, LocalDate deadlineDate, String title, String description, int statusId, LocalTime deadlineHour, boolean isEnoughPay) {
        super(requestId, mentorName, menteeName, deadlineDate, title, description, statusId, deadlineHour);
        this.listSkills = listSkills;
        this.listSchedule = listSchedule;
        this.status = status;
        this.note = note;
        this.isEnoughPay = isEnoughPay;
    }

    public RequestDTO(List<Skill> listSkills, List<SchedulePublic> listSchedule, Status status, String note, int requestId, String mentorName, String menteeName, LocalDate deadlineDate, String title, String description, int statusId, LocalTime deadlineHour) {
        super(requestId, mentorName, menteeName, deadlineDate, title, description, statusId, deadlineHour);
        this.listSkills = listSkills;
        this.listSchedule = listSchedule;
        this.status = status;
        this.note = note;
    }

   
    public RequestDTO(List<Skill> listSkill, String mentorName, LocalDate deadlineDate, String title, LocalTime deadlineHour) {
        super(mentorName, deadlineDate, title, deadlineHour);
        this.listSkills = listSkills;
        
    }

    public boolean isIsEnoughPay() {
        return isEnoughPay;
    }

    public void setIsEnoughPay(boolean isEnoughPay) {
        this.isEnoughPay = isEnoughPay;
    }
    
    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    
    public String getNote() {
        return note;
    }

    public int getAbsent() {
        return absent;
    }

    public void setAbsent(int absent) {
        this.absent = absent;
    }

    public int getAttended() {
        return attended;
    }

    public void setAttended(int attended) {
        this.attended = attended;
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

    @Override
    public String toString() {
        return "RequestDTO{" + "listSkills=" + listSkills + ", listSchedule=" + listSchedule + ", status=" + status + ", note=" + note + ", cvId=" + cvId + ", absent=" + absent + ", attended=" + attended + ", isEnoughPay=" + isEnoughPay + '}';
    }

}