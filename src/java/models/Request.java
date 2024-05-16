/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package models;

import java.sql.Date;
import java.sql.Time;

public class Request {
    private int requestID;
    private String gMailMentor;
    private String gMailMentee;
    private Date deadlineDate;
    private String title;
    private String description;
    private boolean status;
    private Time deadlineHour;

    // Default constructor
    public Request() {}

    // Parameterized constructor
    public Request(int requestID, String gMailMentor, String gMailMentee, Date deadlineDate, String title, String description, boolean status, Time deadlineHour) {
        this.requestID = requestID;
        this.gMailMentor = gMailMentor;
        this.gMailMentee = gMailMentee;
        this.deadlineDate = deadlineDate;
        this.title = title;
        this.description = description;
        this.status = status;
        this.deadlineHour = deadlineHour;
    }

    // Getters and Setters
    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }

    public String getGMailMentor() {
        return gMailMentor;
    }

    public void setGMailMentor(String gMailMentor) {
        this.gMailMentor = gMailMentor;
    }

    public String getGMailMentee() {
        return gMailMentee;
    }

    public void setGMailMentee(String gMailMentee) {
        this.gMailMentee = gMailMentee;
    }

    public Date getDeadlineDate() {
        return deadlineDate;
    }

    public void setDeadlineDate(Date deadlineDate) {
        this.deadlineDate = deadlineDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Time getDeadlineHour() {
        return deadlineHour;
    }

    public void setDeadlineHour(Time deadlineHour) {
        this.deadlineHour = deadlineHour;
    }

    @Override
    public String toString() {
        return "Request{" +
                "requestID=" + requestID +
                ", gMailMentor='" + gMailMentor + '\'' +
                ", gMailMentee='" + gMailMentee + '\'' +
                ", deadlineDate=" + deadlineDate +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", deadlineHour=" + deadlineHour +
                '}';
    }
}
