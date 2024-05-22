/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.SkillDAO;
import java.util.List;
import models.Skill;

/**
 *
 * @author Admin
 */
public class SkillService {
    private static final SkillService skillService = new SkillService();
    private final SkillDAO skillDAO;
    
    public static SkillService getInstance(){
        return skillService;
    }

    private SkillService() {
        skillDAO = new SkillDAO();
    }
    
    public List<Skill> getSkills(){
        return skillDAO.getSkills();
    }
}
