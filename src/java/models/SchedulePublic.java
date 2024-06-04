/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;
import java.sql.Date;
import java.time.DayOfWeek;
/**
 *
 * @author Admin
 */
public class SchedulePublic {
    private String mentorName;
    private int selectedId;
    private Date dayOfSlot;
    private String slotId;
    private Date startTime;
    private Date endTime;
    private String slot_name;
    private DayOfWeek nameOfDay;

    public SchedulePublic() {
    }

    public SchedulePublic(int selectedId, Date dayOfSlot, String slotId, Date startTime, Date endTime, String slot_name) {
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.slot_name = slot_name;
    }

    public SchedulePublic(int selectedId, Date dayOfSlot, String slotId, Date startTime, Date endTime, String slot_name, DayOfWeek nameOfDay) {
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.slot_name = slot_name;
        this.nameOfDay = nameOfDay;
    }

    public SchedulePublic(String mentorName, int selectedId, Date dayOfSlot, String slotId, Date startTime, Date endTime, String slot_name, DayOfWeek nameOfDay) {
        this.mentorName = mentorName;
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.slot_name = slot_name;
        this.nameOfDay = nameOfDay;
    }

    public DayOfWeek getNameOfDay() {
        return nameOfDay;
    }

    public void setNameOfDay(DayOfWeek nameOfDay) {
        this.nameOfDay = nameOfDay;
    }

    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }

    public int getSelectedId() {
        return selectedId;
    }

    public void setSelectedId(int selectedId) {
        this.selectedId = selectedId;
    }

    public Date getDayOfSlot() {
        return dayOfSlot;
    }

    public void setDayOfSlot(Date dayOfSlot) {
        this.dayOfSlot = dayOfSlot;
    }

    public String getSlotId() {
        return slotId;
    }

    public void setSlotId(String slotId) {
        this.slotId = slotId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getSlot_name() {
        return slot_name;
    }

    public void setSlot_name(String slot_name) {
        this.slot_name = slot_name;
    }

    @Override
    public String toString() {
        return "SchedulePublic{" + "mentorName=" + mentorName + ", selectedId=" + selectedId + ", dayOfSlot=" + dayOfSlot + ", slotId=" + slotId + ", startTime=" + startTime + ", endTime=" + endTime + ", slot_name=" + slot_name + ", nameOfDay=" + nameOfDay + '}';
    }
    
    


}
