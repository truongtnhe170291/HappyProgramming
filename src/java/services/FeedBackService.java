/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.FeedBackDAO;
import models.FeedBack;

/**
 *
 * @author Admin
 */
public class FeedBackService {
    private static FeedBackService feedbackService = new FeedBackService();
    private FeedBackDAO fd;
    public static FeedBackService getInstance(){
        return feedbackService;
    }
    private FeedBackService() {
        fd = new FeedBackDAO();
    }
 
}
