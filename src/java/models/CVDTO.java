/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

/**
 *
 * @author Admin
 */
public class CVDTO extends CV{
    private List<Skill> listSkill;
    private double rate;

    public List<Skill> getListSkill() {
        return listSkill;
    }

    public void setListSkill(List<Skill> listSkill) {
        this.listSkill = listSkill;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
    
}
