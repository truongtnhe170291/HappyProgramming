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
    private String slotName;

    public SchedulePublic() {
    }

    public SchedulePublic(int selectedId, Date dayOfSlot, String slotId, Date startTime, Date endTime, String slotName) {
        this.selectedId = selectedId;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.slotName = slotName;
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

    public String getSlotName() {
        return slotName;
    }

    public void setSlotName(String slotName) {
        this.slotName = slotName;
    }
    
    
}
