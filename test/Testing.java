
import dal.AccountDAO;
import dal.MentorDAO;
import dal.ScheduleDAO;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import models.Account;
import models.BookSchedule;
import models.SchedulePublic;

public class Testing {

    public static void main(String[] args) {
        
//        String d1 = "2024-06-24";
//        int slot1 = 1;
//        String d2 = "2024-06-25";
//        int slot2 = 2;
//
//        LocalDate d1_date = LocalDate.parse(d1);
//        LocalDate d2_date = LocalDate.parse(d2);
//
//        dates.add(new BookSchedule(d1_date, slot1));
//        dates.add(new BookSchedule(d2_date, slot2));
//
//        List<BookSchedule> newDates = new ArrayList<>(); // Tạo một danh sách mới để lưu trữ các đối tượng mới
//        for (BookSchedule date : dates) {
//            newDates.add(date);
//            for (int i = 1; i < 4; i++) {
//                newDates.add(new BookSchedule(date.getScheduleName().plusWeeks(i), date.getScheduleSlot()));
//            }
//        }
//
//        dates = newDates; // Cập nhật danh sách dates bằng danh sách newDates
//
//        for (BookSchedule date : dates) {
//            System.out.println(date);
//        }
        
//        MentorDAO mentorDao = new MentorDAO();
//        mentorDao.insertCycle("2024-06-24", "2024-07-21", "2024-06-24", "son", "");
//        
//        System.out.println("OKE");

        System.out.println(getStartDate());
    }

    public static List<BookSchedule> dates = new ArrayList<>();

    public static String getSlotName(int value) {
        String slotName = "";
        switch (value) {
            case 1:
                slotName = "SLOT01";
                break;
            case 2:
                slotName = "SLOT02";
                break;
            case 3:
                slotName = "SLOT03";
                break;
            case 4:
                slotName = "SLOT04";
                break;
        }
        return slotName;
    }

    public static LocalDate getStartDate() {
        LocalDate nextNextMonday;
        // get thu 2 của tuan sau nua
        LocalDate today = LocalDate.now();
        LocalDate nextMonday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
        nextNextMonday = nextMonday.plusWeeks(1);

        return nextNextMonday;
    }

    public static LocalDate getEndDatePerMonth() {
        LocalDate endSunday;
        // get thu 2 của tuan sau nua
        LocalDate today = LocalDate.now();
        LocalDate nextMonday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
        LocalDate Monday1 = nextMonday.plusWeeks(1);
        LocalDate Monday2 = Monday1.plusWeeks(1);
        LocalDate Monday3 = Monday2.plusWeeks(1);
        LocalDate Monday4 = Monday3.plusWeeks(1);
        endSunday = Monday4.plusDays(6);

        return endSunday;
    }
}
