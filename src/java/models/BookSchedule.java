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
public class BookSchedule {
    private LocalDate scheduleName;
    private int scheduleSlot;

    public BookSchedule() {
    }

    public BookSchedule(LocalDate scheduleName, int scheduleSlot) {
        this.scheduleName = scheduleName;
        this.scheduleSlot = scheduleSlot;
    }

    public LocalDate getScheduleName() {
        return scheduleName;
    }

    public void setScheduleName(LocalDate scheduleName) {
        this.scheduleName = scheduleName;
    }

    public int getScheduleSlot() {
        return scheduleSlot;
    }

    public void setScheduleSlot(int scheduleSlot) {
        this.scheduleSlot = scheduleSlot;
    }

    @Override
    public String toString() {
        return "BookSchedule{" + "scheduleName=" + scheduleName + ", scheduleSlot=" + scheduleSlot + '}';
    }

}
