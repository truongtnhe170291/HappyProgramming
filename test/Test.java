
import dal.MentorDAO;
import dal.RequestDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import models.Request;
import models.RequestDTO;

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

        LocalDate today = LocalDate.now();

        String startTimeStr = "2024-07-08";
        String endTimeStr = "2024-07-14";

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(startTimeStr, formatter);
        LocalDate endDate = LocalDate.parse(endTimeStr, formatter);

        long daysBetween = java.time.temporal.ChronoUnit.DAYS.between(startDate, endDate);
        LocalDate middleDate = startDate.plusDays(daysBetween / 2);

        System.out.println(middleDate.format(formatter));
        System.out.println(today.toString());
        
        
    }

    public static String formatStringMoney(long amount) {
        String formattedAmount;
        if (amount < 0) {
            formattedAmount = "-" + formatStringMoney(-amount);
        } else {
            String amountStr = String.valueOf(amount);
            int length = amountStr.length();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < length; i++) {
                if (i > 0 && (length - i) % 3 == 0) {
                    sb.append(".");
                }
                sb.append(amountStr.charAt(i));
            }
            formattedAmount = sb.toString() + " vnđ";
        }
        return formattedAmount;
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
