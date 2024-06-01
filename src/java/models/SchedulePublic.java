/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;
import java.sql.Date;
/**
 *
 * @author Admin
 */
public class SchedulePublic {
    private int selectedId;
    private Date dayOfSlot;
    private String slotId;
    private Date startTime;
    private Date endTime;
    private String start_slot;
    private String end_slot;

    public SchedulePublic() {
    }

    public SchedulePublic(int selectedId, Date dayOfSlot, String slotId, Date startTime, Date endTime, String start_slot, String end_slot) {
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.start_slot = start_slot;
        this.end_slot = end_slot;
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

    public String getStart_slot() {
        return start_slot;
    }

    public void setStart_slot(String start_slot) {
        this.start_slot = start_slot;
    }

    public String getEnd_slot() {
        return end_slot;
    }

    public void setEnd_slot(String end_slot) {
        this.end_slot = end_slot;
    }

}
