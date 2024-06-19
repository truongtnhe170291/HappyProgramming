
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

public class Testing {

    public static void main(String[] args) {

        MentorDAO mentorDao = new MentorDAO();
        ScheduleDAO scheduleDAO = new ScheduleDAO();
//        mentorDao.insertCycle("2024-06-24", "2024-07-21", "2024-06-24", "son", "");
//        
//        System.out.println("OKE");
//        System.out.println(getStartDate());
        LocalDate today = LocalDate.now();
        LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
        LocalDate begin = nextMonday.plusWeeks(1);

        System.out.println(begin.minusWeeks(1).minusDays(1).toString());
        ArrayList<Day> listCurrentDays = mentorDao.listCurrentDays();
        System.out.println(mentorDao.checkContainCycle("son", "2024-07-01", "2024-07-28"));
        LocalDate startDate = LocalDate.parse(listCurrentDays.get(0).getDateValue());
        LocalDate endDate = startDate.plusDays(27);
        LocalDate deadLineDate = LocalDate.now().plusDays(5);
        List<SchedulePublic> listSchedule = scheduleDAO.getListSchedulePublic("son", java.sql.Date.valueOf(startDate), java.sql.Date.valueOf(endDate));
   
        for (SchedulePublic schedulePublic : listSchedule) {
            System.out.println(schedulePublic);
        }
        
        mentorDao.deleteSchedulePublic(3);
        System.out.println("oke");
        
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
