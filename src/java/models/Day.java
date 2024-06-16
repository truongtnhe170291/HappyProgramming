/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author 2k3so
 */
public class Day {
    private String dateName, dateValue;
    private int cycle;

    public Day() {
    }

    public Day(String dateName, String dateValue) {
        this.dateName = dateName;
        this.dateValue = dateValue;
    }

    public Day(String dateName, String dateValue, int cycle) {
        this.dateName = dateName;
        this.dateValue = dateValue;
        this.cycle = cycle;
    }

    public int getCycle() {
        return cycle;
    }

    public void setCycle(int cycle) {
        this.cycle = cycle;
    }
    
    public String getDateName() {
        return dateName;
    }

    public void setDateName(String dateName) {
        this.dateName = dateName;
    }

    public String getDateValue() {
        return dateValue;
    }

    public void setDateValue(String dateValue) {
        this.dateValue = dateValue;
    }

    @Override
    public String toString() {
        return "Day{" + "dateName=" + dateName + ", dateValue=" + dateValue + ", cycle=" + cycle + '}';
    }
    
    
    
}
