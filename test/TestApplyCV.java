
import services.CVService;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
public class TestApplyCV {
    public static void main(String[] args) {
        CVService cv_service = CVService.getInstance();
        String userName = "son";
        if (cv_service.updateStatusCV(userName, 1)) {
            System.out.println("Ok");
        }else{
            System.out.println("Not ok");
        }
    }
}
