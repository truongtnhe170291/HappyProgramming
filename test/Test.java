
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

        System.out.println(formatStringMoney(1000000));
        

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
