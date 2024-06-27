
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
import models.Day;
import models.SchedulePublic;
import models.SlotData;

public class Testing {

    public static void main(String[] args) {
        
        MentorDAO dao = new MentorDAO();
        
        
    }

    public static SlotData handleKey(String key) {
        String result[] = convertDateString(key);
        String slot = result[0];
        String date = result[1];
        SlotData slotData = new SlotData(slot, LocalDate.parse(date));
        return slotData;
    }

    public static String[] convertDateString(String dateStr) {
        String[] parts = dateStr.split("-");
        String day = parts[2];
        String yearMonthDay = parts[5] + "-" + parts[3] + "-" + parts[4];
        return new String[] { day, yearMonthDay };
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
