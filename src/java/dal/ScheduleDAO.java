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
import java.util.ArrayList;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import models.ScheduleDTO;
import models.ScheduleCommon;
import models.SchedulePublic;

/**
 *
 * @author Admin
 */
public class ScheduleDAO {

    private Connection con;

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public ScheduleDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            System.out.println("Error at connection!!!");
        }
    }

    public List<ScheduleDTO> getAllRequestByMentorByStatus(int status) {
        String sql = "SELECT DISTINCT c.cycle_id, c.mentor_name, c.deadline_date, sta.status_name from"
                + "  Selected_Slot ss join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id join Status_Selected sta on sta.status_id = ss.status_id "
                + "  where ss.status_id = ? and CAST(c.deadline_date AS DATE) > CAST(CURRENT_TIMESTAMP AS DATE)";
        List<ScheduleDTO> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ScheduleDTO(
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4)));
            }
            for (ScheduleDTO s : list) {
                List<SchedulePublic> lists = getSlotDetail(s.getMentorName(), 1);
                s.setList(lists);
            }
        } catch (SQLException e) {
            System.out.println("getAllRequestByMentorByStatus: " + e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        ScheduleDAO dao = new ScheduleDAO();
        List<ScheduleDTO> list = dao.getAllRequestByMentorByStatus(1);
        for (ScheduleDTO s : list) {
            System.out.println(s);
        }
    }

    public List<SchedulePublic> getSlotDetail(String mentorName, int statusId) {
        String sql = "SELECT * from "
                + "Selected_Slot ss join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id "
                + "  where c.mentor_name = ? and ss.status_id = ? and CAST(c.deadline_date AS DATE) > CAST(CURRENT_TIMESTAMP AS DATE) order by day_of_slot";
        List<SchedulePublic> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, mentorName);
            ps.setInt(2, statusId);
            rs = ps.executeQuery();
            while (rs.next()) {
                LocalDate dateLocal = LocalDate.parse(rs.getDate(4).toString());
                SchedulePublic schedule = new SchedulePublic(
                        rs.getString(10),
                        rs.getInt(1),
                        rs.getDate(4),
                        rs.getString(12),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getString(13),
                        rs.getString(4),
                        dateLocal.getDayOfWeek().toString());
                list.add(schedule);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean approveRequest(String mentorName, int cycleId) {
        String sql = "UPDATE [dbo].[Selected_Slot] SET [status_id] = 2 WHERE cycle_id = ? and mentor_name = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cycleId);
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

    public boolean rejectRequest(String mentorName, int cycleId) {
        String sql = "UPDATE [dbo].[Selected_Slot] SET [status_id] = 3 WHERE cycle_id = ? and mentor_name = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cycleId);
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

    public List<SchedulePublic> getListSchedulePublicByMentorNameAndStatus(String userName, int statusId) {

        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "SELECT ss.selected_id, ss.day_of_slot, ss.slot_id, c.start_time, c.end_time, s.slot_name from Selected_Slot ss join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id "
                    + "where c.mentor_name = ? AND ss.status_id = ? order by day_of_slot";

            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setInt(2, statusId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SchedulePublic(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getDate(4), rs.getDate(5),
                        rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<SchedulePublic> getListSchedulePublic(String userName, Date startTime, Date endTime) {
        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "SELECT * from Selected_Slot ss join Cycle c on ss.cycle_id = c.cycle_id\n"
                    + "Where c.mentor_name = ? and c.start_time = ? and c.end_time = ?";

            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setDate(2, startTime);
            ps.setDate(3, endTime);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SchedulePublic(
                        rs.getString(10),
                        rs.getDate(4),
                        rs.getString(2),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(3),
                        rs.getString(5)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public String getSelectedSlotStatus(String userName, Date startTime, Date endTime) {
        String status = "";
        try {
            String sql = "SELECT * from Selected_Slot ss join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id JOIN Status_Selected stas ON stas.status_id = ss.status_id\r\n"
                    + //
                    "where ss.mentor_name = ? AND c.start_time >= ? AND c.end_time <= ?";

            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setDate(2, startTime);
            ps.setDate(3, endTime);
            rs = ps.executeQuery();
            while (rs.next()) {
                status = rs.getString(13);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

//    public static void main(String[] args) {
//        ScheduleDAO aO = new ScheduleDAO();
////        LocalDate today = LocalDate.now();
////        // Tìm ngày tiếp theo có thể là thứ 2
////        LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
////        // Tìm ngày Chủ Nhật của tuần tiếp theo
////        LocalDate nextSunday = nextMonday.with(DayOfWeek.SUNDAY);
//        List<ScheduleDTO> list = aO.getAllRequestByMentorByStatus(1);
//        for (ScheduleDTO schedulePublic : list) {
//            System.out.println(schedulePublic);
//        }
////        List<SchedulePublic> list = aO.getSlotDetail("son");
////        System.out.println(list);
//    }
    public List<SchedulePublic> getScheduleByRequestId(int requestId) {
        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "select * from Selected_Slot ss join RquestSelectedSlot rs on rs.selected_id = ss.selected_id join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id where rs.request_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestId);
            rs = ps.executeQuery();
            while (rs.next()) {
                SchedulePublic schedule = new SchedulePublic();
                schedule.setSelectedId(rs.getInt("selected_id"));
                schedule.setMentorName(rs.getString("mentor_name"));
                schedule.setSlotId(rs.getString("slot_id"));
                schedule.setDayOfSlot(rs.getDate("day_of_slot"));
                schedule.setStartTime(rs.getDate("start_time"));
                schedule.setEndTime(rs.getDate("end_time"));
                schedule.setSlot_name(rs.getString("slot_name"));
                DayOfWeek nameOfDay = schedule.getDayOfSlot().toLocalDate().getDayOfWeek();
                schedule.setNameOfDay(nameOfDay);
                list.add(schedule);
            }
        } catch (SQLException e) {
            System.out.println("getScheduleByRequestId" + e.getMessage());
        }
        return list;
    }

    public List<SchedulePublic> getScheduleByMenteeName(String menteeName) {
        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "select * from Selected_Slot ss "
                    + "join RquestSelectedSlot rs on rs.selected_id = ss.selected_id "
                    + "join Cycle c on ss.cycle_id = c.cycle_id "
                    + "join Slots s on s.slot_id = ss.slot_id "
                    + "join RequestsFormMentee rfm on rs.request_id = rfm.request_id "
                    + "where rfm.mentee_name = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, menteeName);
            rs = ps.executeQuery();
            while (rs.next()) {
                SchedulePublic schedule = new SchedulePublic();
                schedule.setSelectedId(rs.getInt("selected_id"));
                schedule.setMentorName(rs.getString("mentor_name"));
                schedule.setSlotId(rs.getString("slot_id"));
                schedule.setDayOfSlot(rs.getDate("day_of_slot"));
                schedule.setStartTime(rs.getDate("start_time"));
                schedule.setEndTime(rs.getDate("end_time"));
                schedule.setSlot_name(rs.getString("slot_name"));
                DayOfWeek nameOfDay = schedule.getDayOfSlot().toLocalDate().getDayOfWeek();
                schedule.setNameOfDay(nameOfDay);
                list.add(schedule);
            }
        } catch (SQLException e) {
            System.out.println("getScheduleByMenteeName: " + e.getMessage());
        }
        return list;
    }

    public List<ScheduleCommon> getScheduleCommonByMentorName(String userName) {
        List<ScheduleCommon> list = new ArrayList<>();
        try {
            String sql = "SELECT ss.mentor_name, a.full_name, s.skill_name, s.description, ss.day_of_slot, sl.slot_id, sl.slot_name \n"
                    + "FROM RequestsFormMentee r \n"
                    + "join Accounts a on a.user_name = r.mentee_name\n"
                    + "join RequestSkills rs on r.request_id = rs.request_id \n"
                    + "join Skills s on s.skill_id = rs.skill_id \n"
                    + "join RquestSelectedSlot rss on rss.request_id = rs.request_id\n"
                    + "join Selected_Slot ss on rss.selected_id = ss.selected_id\n"
                    + "join Slots sl on sl.slot_id = ss.slot_id\n"
                    + "where r.status_id = 1 and ss.mentor_name = ?";

            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                ScheduleCommon sc = new ScheduleCommon(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7));
                list.add(sc);
            }
        } catch (SQLException e) {
            System.out.println("getScheduleCommonByMentorName: " + e.getMessage());
        }
        return list;
    }

    public int getCycleIdInTime(String mentorName, String startTime, String endTime) {
        try {
            String sql = "select c.cycle_id from Cycle c where c.mentor_name = ? and c.start_time = ? and c.end_time = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, mentorName);
            ps.setString(2, startTime);
            ps.setString(3, endTime);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getCycleIdInTime: " + e.getMessage());
        }
        return -1;
    }

    public List<SchedulePublic> getListSheduleByCycleAndStatus(int cycleId, int statusId) {
        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "select * from Selected_Slot ss where ss.cycle_id = ? and ss.status_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, cycleId);
            ps.setInt(2, statusId);
            rs = ps.executeQuery();
            while (rs.next()) {
                SchedulePublic schedule = new SchedulePublic();
                schedule.setSelectedId(rs.getInt("selected_id"));
                schedule.setSlotId(rs.getString("slot_id"));
                schedule.setCycleID(cycleId);
                schedule.setDayOfSlot(rs.getDate("day_of_slot"));
                DayOfWeek nameOfDay = schedule.getDayOfSlot().toLocalDate().getDayOfWeek();
                schedule.setNameOfDay(nameOfDay);
                list.add(schedule);
            }
        } catch (SQLException e) {
            System.out.println("getListSheduleByCycleAndStatus: " + e.getMessage());
        }
        return list;
    }
}
