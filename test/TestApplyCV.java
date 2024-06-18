
import dal.CVDAO;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import models.CV;
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
//        CVService cv_service = CVService.getInstance();
//        String userName = "son";
//        if (cv_service.updateStatusCV(userName, 1)) {
//            System.out.println("Ok");
//        }else{
//            System.out.println("Not ok");
//        }
//    CVDAO dao = new CVDAO();
//        List<CV> list = dao.getCVByStatus(1);
//        System.out.println(list.size());
//        LocalDate today = LocalDate.now();
//        DayOfWeek nameOfDay = today.getDayOfWeek();
//        LocalDate nextMonday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
//        LocalDate nextNextMonday = nextMonday.plusWeeks(1);
//        System.out.println(nextNextMonday.getDayOfWeek());

        LocalDate givenDate = LocalDate.parse("2024-06-24");

        
        
    }

}
