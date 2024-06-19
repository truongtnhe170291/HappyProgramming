/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;
import java.time.DayOfWeek;

/**
 *
 * @author 2k3so
 */
public class Day {
    private String dateName, dateValue;
    private int cycle;
    private DayOfWeek dateWeek;
    private Date date1;
    
    public Day() {
    }

    public Day(String dateValue) {
        this.dateValue = dateValue;
    }
    
    public Day(String dateName, String dateValue) {
        this.dateName = dateName;
        this.dateValue = dateValue;
    }

    public Day(String dateName, String dateValue, int cycle, DayOfWeek dateWeek) {
        this.dateName = dateName;
        this.dateValue = dateValue;
        this.cycle = cycle;
        this.dateWeek = dateWeek;
    }

    public Day(String dateName, String dateValue, int cycle, DayOfWeek dateWeek, Date date1) {
        this.dateName = dateName;
        this.dateValue = dateValue;
        this.cycle = cycle;
        this.dateWeek = dateWeek;
        this.date1 = date1;
    }
    

    public Day(String dateName, String dateValue, int cycle) {
        this.dateName = dateName;
        this.dateValue = dateValue;
        this.cycle = cycle;
    }

    public DayOfWeek getDateWeek() {
        return dateWeek;
    }

    public Date getDate1() {
        return date1;
    }

    public void setDate1(Date date1) {
        this.date1 = date1;
    }

    public void setDateWeek(DayOfWeek dateWeek) {
        this.dateWeek = dateWeek;
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
        return "Day{" + "dateName=" + dateName + ", dateValue=" + dateValue + ", cycle=" + cycle + ", dateWeek=" + dateWeek + ", date1=" + date1 + '}';
    }

   
    
    
}
