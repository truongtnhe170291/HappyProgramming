/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.sql.Date;
import java.util.Locale;
import models.Account;
import models.BookSchedule;
import models.Cycle;
import models.Day;
import models.SchedulePublic;
import models.SelectedSlot;
import models.Slot;
import models.Week;

/**
 *
 * @author Admin
 */
public class MentorDAO {

    private Connection con;
    private String status = "OK";

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public MentorDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            e.printStackTrace();
            status = "Error";
        }
    }

    public ArrayList<Slot> listSlots() {
        ArrayList<Slot> list = new ArrayList<>();
        try {
            String query = "select * from [Slots]";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Slot(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println("listSlots: " + e.getMessage());
        }
        return list;
    }

//    public ArrayList<SchedulePublic> listSlotsCycleByMentor(String mentorName, int status) {
//        ArrayList<SchedulePublic> list = new ArrayList<>();
//        try {
//            String query = "select * from Cycle c join Selected_Slot ss on c.cycle_id = ss.cycle_id where ss.status_id = ? and c.mentor_name = ?";
//            con = new DBContext().connection;// mo ket noi voi sql
//            ps = con.prepareStatement(query);
//            ps.setInt(1, status);
//            ps.setString(2, mentorName);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new SchedulePublic(
//                        rs.getDate(10),
//                        rs.getString(8),
//                        rs.getInt(7),
//                        rs.getInt(1)));
//            }
//        } catch (SQLException e) {
//            System.out.println("listSlots: " + e.getMessage());
//        }
//        return list;
//    }
    // public List<Mentor> getMentors() {
    // String sql = "select * from mentors m join Accounts a on m.mentor_name =
    // a.user_name";
    // List<Mentor> list = new ArrayList<>();
    // try {
    // ps = con.prepareStatement(sql);
    // rs = ps.executeQuery();
    // while (rs.next()) {
    // Mentor m = new Mentor(rs.getString("avatar"), rs.getString("user_name"),
    // rs.getString("gmail"), rs.getString("full_name"),
    // rs.getString("pass_word"), rs.getDate("dob"),
    // rs.getBoolean("sex"), rs.getString("address"),
    // rs.getString("phone"), rs.getInt("role_id"),
    // rs.getInt("status_id"));
    // list.add(m);
    // }
    // } catch (SQLException e) {
    // System.out.println(e);
    // }
    // return list;
    // }
    // public static void main(String[] args) {
    // MentorDAO md = new MentorDAO();
    // for (Mentor m : md.getMentors()) {
    // System.out.println(m.getUserName());
    // }
    // }
    public boolean changeMentorRate(String mentorName, int rate) {
        String sql = "UPDATE [dbo].[Mentors]\n"
                + "SET [rate] = ?\n"
                + "WHERE mentor_name = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, rate);
            ps.setString(2, mentorName);

            int row = ps.executeUpdate();
            if (row != 1) {
                return false;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;

    }

    public int getRateOfMentor(String mentorName) {
        String sql = "SELECT * FROM [dbo].[Mentors]"
                + "WHERE mentor_name = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, mentorName);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("rate");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;

    }

    public int getCycleIdByStart_End(String start, String end) {
        int cycleId = 0;
        try {
            String query = "SELECT * FROM Cycle Where start_time = ? and end_time = ?";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, start);
            ps.setString(2, end);
            rs = ps.executeQuery();
            while (rs.next()) {
                cycleId = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getCycleIdByStart_End: " + e.getMessage());
        }
        return cycleId;
    }

    public void insertSchedulePublic(String slot_id, int cycle_id, String day_of_slot,
            int status_id) {
        try {
            String query = "INSERT INTO Selected_Slot(slot_id, cycle_id, day_of_slot, status_id) VALUES (?, ?, ?, ?)";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, slot_id);
            ps.setInt(2, cycle_id);
            ps.setString(3, day_of_slot);
            ps.setInt(4, status_id);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("insertSchedulePublic: " + e.getMessage());
        }
    }

    public void insertCycle(String start_time, String end_time, String note, String mentor_name, String deadline_date) {
        try {
            String query = "insert into Cycle(start_time, end_time, note, mentor_name, deadline_date) values (?, ?, ?, ?, ?)";
            con = new DBContext().connection;//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, start_time);
            ps.setString(2, end_time);
            ps.setString(3, note);
            ps.setString(4, mentor_name);
            ps.setString(5, deadline_date);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insertCycle: " + e.getMessage());
        }
    }

    public int getCycleIdByMentor(String userName, String startTime, String endTime) {
        int cycleId = 0;
        try {
            String query = "SELECT * FROM Cycle where mentor_name = ? and start_time = ? and end_time = ?";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, startTime);
            ps.setString(3, endTime);
            rs = ps.executeQuery();
            while (rs.next()) {
                cycleId = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getCycleIdByStart_End: " + e.getMessage());
        }
        return cycleId;
    }

    public boolean checkContainCycle(String userName, String start_time, String end_time) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM [Cycle] WHERE start_time = ? and end_time = ? and mentor_name = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            if (count == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("insertCycle " + e.getMessage());
        }
        return false;
    }

    public String getNextMonSunByUserName(String userName) {
        String monSun = "";
        try {
            String query = "SELECT TOP(1) * \n"
                    + "FROM [Selected_Slot] \n"
                    + "JOIN [Cycle] ON [Selected_Slot].cycle_id = [Cycle].cycle_id\n"
                    + "WHERE [Selected_Slot].mentor_name = ? \n"
                    + "ORDER BY [Selected_Slot].cycle_id DESC";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                monSun += "" + rs.getString(8) + " - " + rs.getString(9);
            }
        } catch (Exception e) {
            System.out.println("getNextMonSunByUserName: " + e.getMessage());
        }
        return monSun;
    }

    public ArrayList<Day> listDays() {
        ArrayList<Day> list = new ArrayList<>();
        try {
            LocalDate today = LocalDate.now();
            LocalDate mondayWeek1 = today.plusDays(7).with(DayOfWeek.MONDAY);
            LocalDate currentDay = mondayWeek1;
            int cycle = 1;

            for (int i = 0; i < 28; i++) {
                String inputDateString = "" + currentDay;

                String[] parts = inputDateString.split("-");
                String month = parts[1];
                String day = parts[2];

                String outputDateString = day + "/" + month;
                Date date1 = Date.valueOf(currentDay); // Tạo đối tượng Date từ LocalDate

                if (i == 7 || i == 14 || i == 21) {
                    cycle++;
                }

                list.add(new Day(currentDay.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH),
                        outputDateString, cycle, currentDay.getDayOfWeek(), date1));
                currentDay = currentDay.plusDays(1);
            }

        } catch (Exception e) {
            System.out.println("listDays: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<Week> listCycleWeek() {
        ArrayList<Week> list = new ArrayList<>();

        ArrayList<Day> listDay = listDays();

        list.add(new Week(listDay.get(0).getDateValue() + " to " + listDay.get(6).getDateValue(), 1));
        list.add(new Week(listDay.get(7).getDateValue() + " to " + listDay.get(13).getDateValue(), 2));
        list.add(new Week(listDay.get(14).getDateValue() + " to " + listDay.get(20).getDateValue(), 3));
        list.add(new Week(listDay.get(21).getDateValue() + " to " + listDay.get(27).getDateValue(), 4));

        return list;
    }

    public void deleteSchedulePublic(String userName, int cycleID) {
        try {
            String query = "DELETE FROM Selected_Slot\n"
                    + //
                    "WHERE mentor_name = ? AND cycle_id = ? AND status_id = 1";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            ps.setInt(2, cycleID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("deleteSchedulePublic: " + e.getMessage());
        }
    }

    public ArrayList<SelectedSlot> listSelectedSlotByCycle(int cycleID) {
        ArrayList<SelectedSlot> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM [Selected_Slot] ss \n"
                    + "JOIN Cycle c ON ss.cycle_id = c.cycle_id \n"
                    + "JOIN Slots s ON ss.slot_id = s.slot_id \n"
                    + "JOIN Status_Selected statusS ON statusS.status_id = ss.status_id\n"
                    + "WHERE c.cycle_id = ?";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, cycleID);
            rs = ps.executeQuery();
            while (rs.next()) {
                String inputDate = "" + rs.getDate(4);
                list.add(new SelectedSlot(
                        rs.getString(10),
                        rs.getString(9),
                        rs.getString(13),
                        getStringByDate(inputDate).toUpperCase(),
                        rs.getString(15),
                        rs.getDate(4),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(6),
                        rs.getInt(5),
                        getSlotValue(rs.getString(2))));
            }
        } catch (SQLException e) {
            System.out.println("listSlots: " + e.getMessage());
        }
        return list;
    }

    public String getStringByDate(String input) {
        LocalDate date = LocalDate.parse(input);
        DayOfWeek dayOfWeek = date.getDayOfWeek();
        return dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.ENGLISH);
    }

    public int getSlotValue(String slotId) {
        int slotValue = 0;
        switch (slotId) {
            case "SLOT01": {
                slotValue = 1;
                break;
            }
            case "SLOT02": {
                slotValue = 2;
                break;
            }
            case "SLOT03": {
                slotValue = 3;
                break;
            }
            case "SLOT04": {
                slotValue = 4;
                break;
            }
        }
        return slotValue;
    }

    public ArrayList<Day> listCurrentDays() {
        ArrayList<Day> list = new ArrayList<>();
        LocalDate today = LocalDate.now();
        LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
        LocalDate begin = nextMonday.plusWeeks(1);
        try {
            for (int i = 0; i < 7; i++) {
                list.add(new Day(begin.plusDays(i).getDayOfWeek().toString(), begin.plusDays(i).toString()));
            }
        } catch (Exception e) {
            System.out.println("listDays: " + e.getMessage());
        }
        return list;
    }

    public void deleteSchedulePublic(int cycleID) {
        try {
            String query = "DELETE FROM Selected_Slot\n"
                    + "WHERE cycle_id = ?";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, cycleID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("deleteSchedulePublic: " + e.getMessage());
        }
    }

    public ArrayList<SchedulePublic> listSlotsCycleByMentor(String mentorName, String start, String end) {

        ArrayList<SchedulePublic> list = new ArrayList<>();

        try {

            String query = "select * from Cycle c join Selected_Slot ss on c.cycle_id = ss.cycle_id \n"
                    + "join Status_Selected st on st.status_id = ss.status_id \n"
                    + "where c.mentor_name = ? and c.start_time = ? and c.end_time = ?";
            con = new DBContext().connection;// mo ket noi voi sql

            ps = con.prepareStatement(query);

            ps.setString(1, mentorName);

            ps.setString(2, start);

            ps.setString(3, end);

            rs = ps.executeQuery();

            while (rs.next()) {

                list.add(new SchedulePublic(
                        rs.getDate("day_of_slot"),
                        rs.getString("slot_id"),
                        rs.getInt("selected_id"),
                        rs.getInt("cycle_id"),
                        rs.getString("status_name")));

            }

        } catch (SQLException e) {

            System.out.println("listSlots: " + e.getMessage());

        }

        return list;

    }

    public Cycle getNewCycleByUser(String userName) {
        try {
            String query = "SELECT TOP 1 * FROM Cycle c\n"
                    + "WHERE c.mentor_name = ?\n"
                    + "ORDER BY c.cycle_id DESC";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cycle c = new Cycle(
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(5));
                c.setCycleId(rs.getInt("cycle_id"));
                return c;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Cycle getCycleByCycleID(int cycleId) {
        Cycle c = new Cycle();
        try {
            String query = "select * from Cycle c where c.cycle_id = ?";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, cycleId);
            rs = ps.executeQuery();

            while (rs.next()) {
                c.setCycleId(cycleId);
                c.setStart(rs.getString("start_time"));
                c.setEnd(rs.getString("end_time"));
                c.setNote(rs.getString("note"));
                c.setName(rs.getString("mentor_name"));
                c.setName(rs.getString("deadline_date"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteCycle(int cycleId) {
        try {
            String query = "DELETE FROM Cycle WHERE cycle_id = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, cycleId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("deleteSchedulePublic: " + e.getMessage());
        }
    }

    public ArrayList<Day> listDayByCycle(String startTime) {
        ArrayList<Day> list = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
//            list.add(new Day(LocalDate.parse(startTime).plusDays(i).toString()));
            String dateName = LocalDate.parse(startTime).plusDays(i).getDayOfWeek().toString();
            String dateValue = LocalDate.parse(startTime).plusDays(i).toString();
            list.add(new Day(dateName, dateValue));
        }
        return list;
    }

    public boolean checkContainSelectSlotSave(String userName, int statusId) {
        String sql = "select * from Cycle c join Selected_Slot ss on c.cycle_id = ss.cycle_id where ss.status_id = ? and c.mentor_name = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, statusId);
            ps.setString(2, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkContainSelectSlotSave: " + e.getMessage());
        }
        return false;
    }

}
