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
public class FeedBack {

    private String mentorName, menteeName;
    private int star, requestId;
    private String comment;
    private Date timeFeedBack;

    public FeedBack() {
    }

    public FeedBack(String mentorName, String menteeName, int star, int requestId, String comment, Date timeFeedBack) {
        this.mentorName = mentorName;
        this.menteeName = menteeName;
        this.star = star;
        this.requestId = requestId;
        this.comment = comment;
        this.timeFeedBack = timeFeedBack;
    }
    
    public FeedBack(String mentorName, String menteeName, int star, String comment, Date timeFeedBack) {
        this.mentorName = mentorName;
        this.menteeName = menteeName;
        this.star = star;
        this.comment = comment;
        this.timeFeedBack = timeFeedBack;
    }

    public FeedBack(String menteeName, int star, String comment, Date timeFeedBack) {
        this.menteeName = menteeName;
        this.star = star;
        this.comment = comment;
        this.timeFeedBack = timeFeedBack;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getTimeFeedBack() {
        return timeFeedBack;
    }

    public void setTimeFeedBack(Date timeFeedBack) {
        this.timeFeedBack = timeFeedBack;
    }

    @Override
    public String toString() {
        return "FeedBack{" + "mentorName=" + mentorName + ", menteeName=" + menteeName + ", star=" + star + ", requestId=" + requestId + ", comment=" + comment + ", timeFeedBack=" + timeFeedBack + '}';
    }

}
