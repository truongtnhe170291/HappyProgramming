/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.MenteeDAO;
import models.Mentee;

/**
 *
 * @author Admin
 */
public class MenteeService {
    private static final MenteeService menteeService = new MenteeService();
    private final MenteeDAO menteeDAO;
    
    public static MenteeService getInstance(){
        return menteeService;
    }

    private MenteeService() {
        menteeDAO = new MenteeDAO();
    }
    
    public Mentee getCurrentMentee(String userName){
        return menteeDAO.getCurrentMentee(userName);
    }
}
