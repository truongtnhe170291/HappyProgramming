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
    private int star;
    private String menteeGmail, mentorGmail, comment;
    private Date  timeFeedBack;

    public FeedBack() {
    }

    public FeedBack( String mentorGmail, String menteeGmail ,int star, String comment, Date timeFeedBack) {
        this.star = star;
        this.menteeGmail = menteeGmail;
        this.mentorGmail = mentorGmail;
        this.comment = comment;
        this.timeFeedBack = timeFeedBack;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getMenteeGmail() {
        return menteeGmail;
    }

    public void setMenteeGmail(String menteeGmail) {
        this.menteeGmail = menteeGmail;
    }

    public String getMentorGmail() {
        return mentorGmail;
    }

    public void setMentorGmail(String mentorGmail) {
        this.mentorGmail = mentorGmail;
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
        return "FeedBack{" + "star=" + star + ", menteeGmail=" + menteeGmail + ", mentorGmail=" + mentorGmail + ", comment=" + comment + ", timeFeedBack=" + timeFeedBack + '}';
    }
}
    
    