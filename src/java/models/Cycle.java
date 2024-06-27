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
    private String start;
    private String end;
    private String name;

    public Cycle() {
    }

    public Cycle(String start, String end, String name) {
        this.start = start;
        this.end = end;
        this.name = name;
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

    @Override
    public String toString() {
        return "Cycle{" + "start=" + start + ", end=" + end + ", name=" + name + '}';
    }
    
}
