
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

    private int totalMentor;

    public StaticMentee() {
    }

    public StaticMentee(int totalRequest, int totalMentor) {
        this.totalRequest = totalRequest;
        this.totalMentor = totalMentor;
    }
    


        
   
    public int getTotalRequest() {
        return totalRequest;
    }

    public void setTotalRequest(int totalRequest) {
        this.totalRequest = totalRequest;
    }

    

    public int getTotalMentor() {
        return totalMentor;
    }

    public void setTotalMentor(int totalMentor) {
        this.totalMentor = totalMentor;
    }

    @Override
    public String toString() {
        return "StaticMentee{" + "totalRequest=" + totalRequest + ", totalMentor=" + totalMentor + '}';
    }

   
    
}