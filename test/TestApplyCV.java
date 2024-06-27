
import dal.CVDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Date;
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
        String key = "1-TUE-3-25-06-2024";
        if (key != null) {
            String[] keyParts = key.split("-");
            String slotId = keyParts[2];  // 3
            String date = keyParts[3] + "-" + keyParts[4];
            System.out.println(slotId + " ok " + LocalDate.parse(convertDateFormat(date)));
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
