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
    
    public CV getCVByUserName(String username){
        return cvDao.getCVByUserName(username);
    }
    public CV createOrUpdateCV(CV cv){
        CV c = cvDao.getCVByUserName(cv.getUserName());
        if( c != null){
            if(cvDao.updateCV(cv, c.getCvId())){
                return cvDao.getCVByUserName(cv.getUserName());
            }
        }else{
            if(cvDao.addCV(cv)){
                return cvDao.getCVByUserName(cv.getUserName());
            }
        }
        return null;
    }

    public boolean updateStatusCV(int cvId, int status) {
        return cvDao.updateStatusCV(cvId, status);
    }
}
