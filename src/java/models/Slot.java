/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author 2k3so
 */
public class Slot {
    String slot_id, slot_name;

    public Slot() {
    }

    public Slot(String slot_id, String slot_name) {
        this.slot_id = slot_id;
        this.slot_name = slot_name;
    }

    public String getSlot_id() {
        return slot_id;
    }

    public void setSlot_id(String slot_id) {
        this.slot_id = slot_id;
    }

    public String getSlot_name() {
        return slot_name;
    }

    public void setSlot_name(String slot_name) {
        this.slot_name = slot_name;
    }

    @Override
    public String toString() {
        return "Slot{" + "slot_id=" + slot_id + ", slot_name=" + slot_name + '}';
    }
    
}