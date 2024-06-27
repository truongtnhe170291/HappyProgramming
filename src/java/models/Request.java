/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package models;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

public class Request {
    private int requestId;
    private String mentorName;
    private String menteeName;
    private LocalDate deadlineDate;
    private String title;
    private String description;
    private int statusId;
    private java.time.LocalTime deadlineHour;
    private int price;
    private String note;
    // Default constructor
    public Request() {}

    public Request(String mentorName, LocalDate deadlineDate, String title, LocalTime deadlineHour) {
        this.mentorName = mentorName;
        this.deadlineDate = deadlineDate;
        this.title = title;
        this.deadlineHour = deadlineHour;
    }
    

    public Request(int requestId, String mentorName, String menteeName, LocalDate deadlineDate, String title, String description, int statusId, LocalTime deadlineHour) {
        this.requestId = requestId;
        this.mentorName = mentorName;
        this.menteeName = menteeName;
        this.deadlineDate = deadlineDate;
        this.title = title;
        this.description = description;
        this.statusId = statusId;
        this.deadlineHour = deadlineHour;
    }

    public Request(String mentorName, String menteeName, LocalDate deadlineDate, String title, String description, int statusId, LocalTime deadlineHour) {
        this.mentorName = mentorName;
        this.menteeName = menteeName;
        this.deadlineDate = deadlineDate;
        this.title = title;
        this.description = description;
        this.statusId = statusId;
        this.deadlineHour = deadlineHour;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }

    public String getMenteeName() {
        return menteeName;
    }

    public void setMenteeName(String menteeName) {
        this.menteeName = menteeName;
    }

    public LocalDate getDeadlineDate() {
        return deadlineDate;
    }

    public void setDeadlineDate(LocalDate deadlineDate) {
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

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public LocalTime getDeadlineHour() {
        return deadlineHour;
    }

    public void setDeadlineHour(LocalTime deadlineHour) {
        this.deadlineHour = deadlineHour;
    }

    @Override
    public String toString() {
        return "Request{" + "requestId=" + requestId + ", mentorName=" + mentorName + ", menteeName=" + menteeName + ", deadlineDate=" + deadlineDate + ", title=" + title + ", description=" + description + ", statusId=" + statusId + ", deadlineHour=" + deadlineHour + '}';
    }

    

   

}
