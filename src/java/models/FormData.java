/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

public class FormData {
    private String title;
    private String mentorname;
    private String description;
    private String deadlineDate;
    private String deadlineHour;
    private String skill;
    private int totalPrice;
    private String action;
    private String startime;
    private String endtime;
    private List<Slot> selectedSlots;

    

    public static class Slot {
        private int slot;
        private String day;

        public int getSlot() {
            return slot;
        }

        public void setSlot(int slot) {
            this.slot = slot;
        }

        public String getDay() {
            return day;
        }

        public void setDay(String day) {
            this.day = day;
        }

        
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getStartime() {
        return startime;
    }

    public void setStartime(String startime) {
        this.startime = startime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    // Getters and setters
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

    public String getDeadlineDate() {
        return deadlineDate;
    }

    public void setDeadlineDate(String deadlineDate) {
        this.deadlineDate = deadlineDate;
    }

    public String getDeadlineHour() {
        return deadlineHour;
    }

    public void setDeadlineHour(String deadlineHour) {
        this.deadlineHour = deadlineHour;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public List<Slot> getSelectedSlots() {
        return selectedSlots;
    }

    public void setSelectedSlots(List<Slot> selectedSlots) {
        this.selectedSlots = selectedSlots;
    }

    public String getMentorname() {
        return mentorname;
    }

    public void setMentorname(String mentorname) {
        this.mentorname = mentorname;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
    
}
