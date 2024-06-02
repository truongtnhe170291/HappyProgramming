
import dal.AccountDAO;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
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
//        AccountDAO dao = new AccountDAO();
//        ArrayList<Account> list = dao.listAccount();
//        for (Account a : list) {
//            System.out.println(a.toString());
//        }

//        MenteeDAO dao = new MenteeDAO();
//        System.out.println(dao.getCurrentMentee("2k3sonpham@gmail.com"));
        
        LocalDate today = LocalDate.now();
        
        // In ra ngày hiện tại và thứ của ngày đó
        System.out.println("Hôm nay là: " + today + ", Thứ: " + today.getDayOfWeek());

        // Tìm ngày tiếp theo có thể là thứ 2
        LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
        System.out.println("Thứ hai tiếp theo là: " + nextMonday + ", Thứ: " + nextMonday.getDayOfWeek());

        // Tìm ngày Chủ Nhật của tuần tiếp theo
        LocalDate nextSunday = nextMonday.with(DayOfWeek.SUNDAY);
        System.out.println("Chủ nhật của tuần tiếp theo là: " + nextSunday + ", Thứ: " + nextSunday.getDayOfWeek());
    }
}
