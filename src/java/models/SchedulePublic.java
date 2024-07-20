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
    private String skillName;
    private String slotId;
    private Date startTime;
    private Date endTime;
    private String slot_name;
    private DayOfWeek nameOfDay;
    private String status;
    private int cycleID;
    private String weekName;
    private String rejectMessage;
    private String attendanceStatus;
    private int requestId;

    public SchedulePublic() {
    }

    public SchedulePublic(int selectedId, Date dayOfSlot, String slotId, String slot_name, DayOfWeek nameOfDay, int cycleID) {
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.slot_name = slot_name;
        this.nameOfDay = nameOfDay;
        this.cycleID = cycleID;
    }

    public SchedulePublic(Date dayOfSlot, String slotId, int selectedId, int cycleID) {
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.selectedId = selectedId;
        this.cycleID = cycleID;
    }

    public SchedulePublic(Date dayOfSlot, String slotId, int selectedId, int cycleID, String status) {
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.selectedId = selectedId;
        this.cycleID = cycleID;
        this.status = status;
    }

    public SchedulePublic(String mentorName, int selectedId, Date dayOfSlot, String slotId, Date startTime, Date endTime, String slot_name, DayOfWeek nameOfDay, int cycleID) {
        this.mentorName = mentorName;
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.slot_name = slot_name;
        this.nameOfDay = nameOfDay;
        this.cycleID = cycleID;
    }

    public SchedulePublic(String mentorName, int selectedId, Date dayOfSlot, String slotId, Date startTime, Date endTime, String slot_name, DayOfWeek nameOfDay, int cycleID, String attendanceStatus) {
        this.mentorName = mentorName;
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.slot_name = slot_name;
        this.nameOfDay = nameOfDay;
        this.cycleID = cycleID;
        this.attendanceStatus = attendanceStatus;
    }

    public SchedulePublic(int selectedId, Date dayOfSlot, String slotId, Date startTime, Date endTime, String slot_name) {
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.slot_name = slot_name;
    }

    public SchedulePublic(String mentorName, Date dayOfSlot, String slotId, Date startTime, Date endTime, int cycleID, String status, String rejectMessage) {
        this.mentorName = mentorName;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.cycleID = cycleID;
        this.status = status;
        this.rejectMessage = rejectMessage;
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

    public SchedulePublic(String mentorName, int selectedId, String skillName, Date dayOfSlot, String slotId, Date startTime, Date endTime, String slot_name, DayOfWeek nameOfDay) {
        this.mentorName = mentorName;
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.slot_name = slot_name;
        this.nameOfDay = nameOfDay;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getAttendanceStatus() {
        return attendanceStatus;
    }

    public void setAttendanceStatus(String attendanceStatus) {
        this.attendanceStatus = attendanceStatus;
    }

    public SchedulePublic(String mentorName, int selectedId, Date dayOfSlot, String slotId, Date startTime, Date endTime, String slot_name, String status, String weekName) {
        this.mentorName = mentorName;
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.slot_name = slot_name;
        this.status = status;
        this.weekName = weekName;
    }

    public String getdayOfSlotString() {
        String inputDateString = "" + this.dayOfSlot;

        String[] parts = inputDateString.split("-");
        String day = parts[0];
        String month = parts[1];
        String year = parts[2];

        String outputDateString = day + "/" + month + "/" + year;
        return outputDateString;
    }

    public String getWeekName() {
        return weekName;
    }

    public void setWeekName(String weekName) {
        this.weekName = weekName;
    }

    public String getRejectMessage() {
        return rejectMessage;
    }

    public void setRejectMessage(String rejectMessage) {
        this.rejectMessage = rejectMessage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getCycleID() {
        return cycleID;
    }

    public void setCycleID(int cycleID) {
        this.cycleID = cycleID;
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
        return "SchedulePublic{" + "mentorName=" + mentorName + ", selectedId=" + selectedId + ", dayOfSlot=" + dayOfSlot + ", skillName=" + skillName + ", slotId=" + slotId + ", startTime=" + startTime + ", endTime=" + endTime + ", slot_name=" + slot_name + ", nameOfDay=" + nameOfDay + ", status=" + status + ", cycleID=" + cycleID + ", weekName=" + weekName + ", rejectMessage=" + rejectMessage + ", attendanceStatus=" + attendanceStatus + '}';
    }

}
