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
public class ScheduleCommon {
    private String userName;
     private String menteeName;
     private int request_id;
     private int selected_id;
    private String fullName;
    private String skillName;
    private String description;
    private Date dayOfSlot;
    private String slotId;
    private String slotName;
    private String attendanceStatus;

    public ScheduleCommon(String userName,String menteeName,int request_id,int selected_id, String fullName, String skillName, String description, Date dayOfSlot, String slotId, String slotName,String attendanceStatus) {
        this.userName = userName;
        this.request_id = request_id;
        this.selected_id = selected_id;
        this.menteeName = menteeName;
        this.fullName = fullName;
        this.skillName = skillName;
        this.description = description;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.slotName = slotName;
        this.attendanceStatus = attendanceStatus;
    }

    public int getSelected_id() {
        return selected_id;
    }

    public void setSelected_id(int selected_id) {
        this.selected_id = selected_id;
    }

    public int getRequest_id() {
        return request_id;
    }

    public void setRequest_id(int request_id) {
        this.request_id = request_id;
    }
 public ScheduleCommon(String userName, String fullName, String skillName, String description, Date dayOfSlot, String slotId, String slotName,String attendanceStatus) {
        this.userName = userName;
        this.fullName = fullName;
        this.skillName = skillName;
        this.description = description;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.slotName = slotName;
        this.attendanceStatus = attendanceStatus;
    }
    public String getMenteeName() {
        return menteeName;
    }

    public void setMenteeName(String menteeName) {
        this.menteeName = menteeName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getSlotName() {
        return slotName;
    }

    public String getAttendanceStatus() {
        return attendanceStatus;
    }

    public void setAttendanceStatus(String attendanceStatus) {
        this.attendanceStatus = attendanceStatus;
    }

    public void setSlotName(String slotName) {
        this.slotName = slotName;
    }
    
    @Override
public String toString() {
    return "ScheduleCommon{" +
            "userName='" + userName + '\'' +
            "menteeName='" + menteeName + '\'' +
             "selected_id='" + selected_id + '\'' +
            "request_id='" + request_id + '\'' +
            ", fullName='" + fullName + '\'' +
            ", skillName='" + skillName + '\'' +
            ", dayOfSlot=" + dayOfSlot +
            ", slotId='" + slotId + '\'' +
            ", slotName='" + slotName + '\'' +
            "attendanceStatus='" +attendanceStatus+
            '}';
}

}
