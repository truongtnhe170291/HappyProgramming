
import dal.AccountDAO;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Locale;
import models.Account;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author 2k3so
 */
public class Testing {

    public static void main(String[] args) {

        LocalDate today = LocalDate.now();
        // Tìm ngày tiếp theo có thể là thứ 2
        LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
        // Tìm ngày Chủ Nhật của tuần tiếp theo
        LocalDate nextSunday = nextMonday.with(DayOfWeek.SUNDAY);

        // Mảng để lưu trữ tên các thứ trong tuần
        String[] periodName = new String[7];
        LocalDate currentDay = nextMonday;

        for (int i = 0; i < 7; i++) {
            periodName[i] = "" + currentDay.getDayOfWeek();
            currentDay = currentDay.plusDays(1);
        }
        
        for (String string : periodName) {
            System.out.println(string);
        }
        
        System.out.println(today.getDayOfWeek());
        
    }
}
