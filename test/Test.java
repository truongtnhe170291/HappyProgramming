
import dal.MentorDAO;
import dal.ScheduleDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import models.Request;
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
        List<Request> list = new ArrayList<>();
        for (int i = 1; i < 10; i++) {
            Request r = new Request();
            r.setRequestId(i);
            list.add(r);
        }
        Request r = new Request();
        r.setRequestId(3);
        list.add(r);
        for (Request ru : list) {
            System.out.println(ru.getRequestId());
        }
        System.out.println("beak");
        Set<Request> li = new HashSet<>(list);
        for (Request rur : li) {
            System.out.println(rur.getRequestId());
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
