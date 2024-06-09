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
public class ScheduleDTO {
    private String userName;
    private Date startDate;
    private Date endDate;
    private List<SchedulePublic> list;

    public ScheduleDTO() {
    }

    
    public ScheduleDTO(String userName, Date startDate, Date endDate, List<SchedulePublic> list) {
        this.userName = userName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.list = list;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public List<SchedulePublic> getList() {
        return list;
    }

    public void setList(List<SchedulePublic> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "ScheduleDTO{" + "userName=" + userName + ", startDate=" + startDate + ", endDate=" + endDate + ", list=" + list + '}';
    }
    
    
    
    
}
