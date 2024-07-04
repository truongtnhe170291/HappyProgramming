package models;
import java.sql.Date;

public class AttendanceRecord {
    private int attendanceId;
    private int requestId;
    private int selectedId;
    private String fullName;
    private String menteeName;
    private String mentorName;
    private String skillName;
    private Date dayOfSlot;
    private String slotId;
    private String slotName;
    private String attendanceStatus;
    private Date attendanceDate;

    public AttendanceRecord(int attendanceId, int requestId, int selectedId, String fullName, String menteeName, String mentorName, String skillName, Date dayOfSlot, String slotId, String slotName, String attendanceStatus, Date attendanceDate) {
        this.attendanceId = attendanceId;
        this.requestId = requestId;
        this.selectedId = selectedId;
        this.fullName = fullName;
        this.menteeName = menteeName;
        this.mentorName = mentorName;
        this.skillName = skillName;
        this.dayOfSlot = dayOfSlot;
        this.slotId = slotId;
        this.slotName = slotName;
        this.attendanceStatus = attendanceStatus;
        this.attendanceDate = attendanceDate;
    }

    public AttendanceRecord() {
      
    }

    public int getAttendanceId() {
        return attendanceId;
    }

    public void setAttendanceId(int attendanceId) {
        this.attendanceId = attendanceId;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getSelectedId() {
        return selectedId;
    }

    public void setSelectedId(int selectedId) {
        this.selectedId = selectedId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getMenteeName() {
        return menteeName;
    }

    public void setMenteeName(String menteeName) {
        this.menteeName = menteeName;
    }

    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
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

    public void setSlotName(String slotName) {
        this.slotName = slotName;
    }

    public String getAttendanceStatus() {
        return attendanceStatus;
    }

    public void setAttendanceStatus(String attendanceStatus) {
        this.attendanceStatus = attendanceStatus;
    }

    public Date getAttendanceDate() {
        return attendanceDate;
    }

    public void setAttendanceDate(Date attendanceDate) {
        this.attendanceDate = attendanceDate;
    }


    @Override
    public String toString() {
        return "AttendanceRecord{" + "attendanceId=" + attendanceId + ", requestId=" + requestId + ", selectedId=" + selectedId + ", fullName=" + fullName + ", menteeName=" + menteeName + ", mentorName=" + mentorName + ", skillName=" + skillName + ", dayOfSlot=" + dayOfSlot + ", slotId=" + slotId + ", slotName=" + slotName + ", attendanceStatus=" + attendanceStatus + ", attendanceDate=" + attendanceDate + '}';
    }
}
