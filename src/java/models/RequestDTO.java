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

public class RequestDTO extends RequestSkill{
    
    private LocalDate dayOfSlot;
    private LocalDate startTime;
    private LocalDate endTime;
    private String slotName;
    private String slotID;

    public RequestDTO() {
    }
    
    
    public RequestDTO(LocalDate dayOfSlot, LocalDate startTime, LocalDate endTime, String slotName, String slotID, List<Skill> listSkills, int requestId, String mentorName, String menteeName, LocalDate deadlineDate, String title, String description, int statusId, LocalTime deadlineHour) {
        super(listSkills, requestId, mentorName, menteeName, deadlineDate, title, description, statusId, deadlineHour);
        this.dayOfSlot = dayOfSlot;
        this.startTime = startTime;
        this.endTime = endTime;
        this.slotName = slotName;
        this.slotID = slotID;
    }

    public LocalDate getDayOfSlot() {
        return dayOfSlot;
    }

    public void setDayOfSlot(LocalDate dayOfSlot) {
        this.dayOfSlot = dayOfSlot;
    }

    public LocalDate getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDate startTime) {
        this.startTime = startTime;
    }

    public LocalDate getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDate endTime) {
        this.endTime = endTime;
    }

    public String getSlotName() {
        return slotName;
    }

    public void setSlotName(String slotName) {
        this.slotName = slotName;
    }

    public String getSlotID() {
        return slotID;
    }

    public void setSlotID(String slotID) {
        this.slotID = slotID;
    }

    @Override
    public String toString() {
        return "RequestDTO{" + super.toString() +"dayOfSlot=" + dayOfSlot + ", startTime=" + startTime + ", endTime=" + endTime + ", slotName=" + slotName + ", slotID=" + slotID + '}';
    }
    
    
    
    
    
}
