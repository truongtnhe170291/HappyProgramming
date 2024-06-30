
import dal.MentorDAO;
import dal.RequestDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import models.Request;
import models.RequestDTO;
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
        RequestDAO dao = new RequestDAO();

        System.out.println("Request List");
        List<RequestDTO> requests = dao.getRequestOfMenteeByStatusNotPagingMentor("son", "1");
        for (RequestDTO request : requests) {
            System.out.println(request);
        }

        System.out.println("--------------------------------------------------------");

//        System.out.println("SchedulePublic List");
//        ArrayList<SchedulePublic> listSchedulePublic = mentorDao.listSlotsCycleByMentor("son", "2024-07-08", "2024-08-04");
//        for (SchedulePublic schedulePublic : listSchedulePublic) {
//            System.out.println(schedulePublic);
//        }

        Request requ = dao.getRequestByStatusSaved("hieu", "son");
        for (RequestDTO request : requests) {
            System.out.println(request);
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
