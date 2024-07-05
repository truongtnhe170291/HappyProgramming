/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDate;

/**
 *
 * @author 2k3so
 */
public class Cycle {
    private int cycleId;
    private String start;
    private String end;
    private String name;
    private String note;
    private LocalDate deadline;

    public Cycle() {
    }

    public Cycle(String start, String end, String name) {
        this.start = start;
        this.end = end;
        this.name = name;
    }

    public Cycle(int cycleId, String start, String end, String name, String note, LocalDate deadline) {
        this.cycleId = cycleId;
        this.start = start;
        this.end = end;
        this.name = name;
        this.note = note;
        this.deadline = deadline;
    }

    public int getCycleId() {
        return cycleId;
    }

    public void setCycleId(int cycleId) {
        this.cycleId = cycleId;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public LocalDate getDeadline() {
        return deadline;
    }

    public void setDeadline(LocalDate deadline) {
        this.deadline = deadline;
    }

   
    
}
