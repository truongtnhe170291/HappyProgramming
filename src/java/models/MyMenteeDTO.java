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
public class MyMenteeDTO {
      private String menteeName;
    private String title;
    private float price;
    private List<Skill> skills; 

    public MyMenteeDTO() {
    }

    public MyMenteeDTO(String menteeName, String title, float price, List<Skill> skills) {
        this.menteeName = menteeName;
        this.title = title;
        this.price = price;
        this.skills = skills;
    }

    public String getMenteeName() {
        return menteeName;
    }

    public void setMenteeName(String menteeName) {
        this.menteeName = menteeName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public List<Skill> getSkills() {
        return skills;
    }

    public void setSkills(List<Skill> skills) {
        this.skills = skills;
    }

    @Override
    public String toString() {
        return "MyMentee{" + "menteeName=" + menteeName + ", title=" + title + ", price=" + price + ", skills=" + skills + '}';
    }
    
    
    
}
