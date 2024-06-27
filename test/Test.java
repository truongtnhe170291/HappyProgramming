
import dal.MentorDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import models.SchedulePublic;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
public class Test {
    public static void main(String[] args) {
        MentorDAO mentorDao = new MentorDAO();
        
        List<SchedulePublic> listsp = mentorDao.listSlotsCycleByMentor("son", "", "");
        for (SchedulePublic schedulePublic : listsp) {
            System.out.println(schedulePublic);
        }
    }

    private static String convertDateFormat(String date) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = "";
        try {
            Date parsedDate = inputFormat.parse(date);
            formattedDate = outputFormat.format(parsedDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return formattedDate;
    }
}
