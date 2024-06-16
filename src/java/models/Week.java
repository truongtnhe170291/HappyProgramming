/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author 2k3so
 */
public class Week {
    private String cycleWeek;
    private int cycle;

    public Week() {
    }

    public Week(String cycleWeek, int cycle) {
        this.cycleWeek = cycleWeek;
        this.cycle = cycle;
    }

    public int getCycle() {
        return cycle;
    }

    public void setCycle(int cycle) {
        this.cycle = cycle;
    }
    
    public String getCycleWeek() {
        return cycleWeek;
    }

    public void setCycleWeek(String cycleWeek) {
        this.cycleWeek = cycleWeek;
    }

    @Override
    public String toString() {
        return "Week{" + "cycleWeek=" + cycleWeek + ", cycle=" + cycle + '}';
    }

}
