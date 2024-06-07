
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class StaticMentee {
    private int totalRequest;
    private int totalHour;
    private int totalMentor;

    public StaticMentee() {
    }

    public StaticMentee(int totalRequest, int totalHour, int totalMentor) {
        this.totalRequest = totalRequest;
        this.totalHour = totalHour;
        this.totalMentor = totalMentor;
    }

        
   
    public int getTotalRequest() {
        return totalRequest;
    }

    public void setTotalRequest(int totalRequest) {
        this.totalRequest = totalRequest;
    }

    public int getTotalHour() {
        return totalHour;
    }

    public void setTotalHour(int totalHour) {
        this.totalHour = totalHour;
    }

    public int getTotalMentor() {
        return totalMentor;
    }

    public void setTotalMentor(int totalMentor) {
        this.totalMentor = totalMentor;
    }

    @Override
    public String toString() {
        return "StaticMentee{" + "totalRequest=" + totalRequest + ", totalHour=" + totalHour + ", totalMentor=" + totalMentor + '}';
    }
    
    
    
}