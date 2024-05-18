/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.CVDAO;
import models.CV;

/**
 *
 * @author Admin
 */
public class CVService {
    private static final CVService cvService = new CVService();
    private final CVDAO cvDao;
    
    public static CVService getInstance(){
        return cvService;
    }

    private CVService() {
        cvDao = new CVDAO();
    }
    
    public boolean createCV(CV cv){
        return cvDao.addCV(cv);
    }
    
    public boolean updateCV(CV cv){
        return cvDao.updateCV(cv);
    }
}
