/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.Date;

/**
 *
 * @author 2k3so
 */
public class SelectedSlot {
    // slotName là khoảng thời gian của slot học
    // dayOfSlot ngày của slot đó
    //dayOfSlotName là tên của thứ ứng với ngày đó
    
    private String mentorName, note, slotName, dayOfSlotName, statusName;
    private Date dayOfSlot, startTime, endTime;
    private int cycleId, statusId, slotId;

    public SelectedSlot() {
    }

    public SelectedSlot(String mentorName, String note, String slotName, String dayOfSlotName, String statusName, Date dayOfSlot, Date startTime, Date endTime, int cycleId, int statusId, int slotId) {
        this.mentorName = mentorName;
        this.note = note;
        this.slotName = slotName;
        this.dayOfSlotName = dayOfSlotName;
        this.statusName = statusName;
        this.dayOfSlot = dayOfSlot;
        this.startTime = startTime;
        this.endTime = endTime;
        this.cycleId = cycleId;
        this.statusId = statusId;
        this.slotId = slotId;
    }

    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getSlotName() {
        return slotName;
    }

    public void setSlotName(String slotName) {
        this.slotName = slotName;
    }

    public String getDayOfSlotName() {
        return dayOfSlotName;
    }

    public void setDayOfSlotName(String dayOfSlotName) {
        this.dayOfSlotName = dayOfSlotName;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public Date getDayOfSlot() {
        return dayOfSlot;
    }

    public void setDayOfSlot(Date dayOfSlot) {
        this.dayOfSlot = dayOfSlot;
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

    public int getCycleId() {
        return cycleId;
    }

    public void setCycleId(int cycleId) {
        this.cycleId = cycleId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getSlotId() {
        return slotId;
    }

    public void setSlotId(int slotId) {
        this.slotId = slotId;
    }

    @Override
    public String toString() {
        return "SelectedSlot{" + "mentorName=" + mentorName + ", note=" + note + ", slotName=" + slotName + ", dayOfSlotName=" + dayOfSlotName + ", statusName=" + statusName + ", dayOfSlot=" + dayOfSlot + ", startTime=" + startTime + ", endTime=" + endTime + ", cycleId=" + cycleId + ", statusId=" + statusId + ", slotId=" + slotId + '}';
    }

}
