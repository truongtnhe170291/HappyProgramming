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
import java.util.List;
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

    public List<SchedulePublic> getRequestByMentor() {
        String sql = "SELECT ss.mentor_name, \n"
                + "       STRING_AGG(s.slot_id , ',') as slot_id, \n"
                + "       STRING_AGG(ss.day_of_slot, ',') as day_of_slot,c.cycle_id,\n"
                + "       c.start_time, c.end_time \n"
                + "FROM Selected_Slot ss \n"
                + "JOIN Cycle c ON ss.cycle_id = c.cycle_id \n"
                + "JOIN Slots s ON s.slot_id = ss.slot_id \n"
                + "WHERE ss.status_id = 1\n"
                + "GROUP BY ss.mentor_name, c.start_time, c.end_time,c.cycle_id";
        List<SchedulePublic> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String mentorName = rs.getString("mentor_name");
                String slotId = rs.getString("slot_id");
                String dayOfSlot = rs.getString("day_of_slot");
                Date startTime = rs.getDate("start_time");
                Date endTime = rs.getDate("end_time");
                int cycleID = rs.getInt("cycle_id");
                SchedulePublic request = new SchedulePublic(mentorName, endTime, slotId, startTime, endTime, cycleID);
                list.add(request);
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

    public List<SchedulePublic> getListSchedulePublicByMentorName(String userName, java.sql.Date startTime, java.sql.Date endTime) {
        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "SELECT ss.selected_id, ss.day_of_slot, ss.slot_id, c.start_time, c.end_time, s.slot_name from Selected_Slot ss join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id "
                    + "where ss.mentor_name = ? AND c.start_time >= ? AND c.end_time <= ? AND ss.status_id = 2";

            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setDate(2, startTime);
            ps.setDate(3, endTime);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SchedulePublic(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

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

    public static void main(String[] args) {
        ScheduleDAO aO = new ScheduleDAO();
        List<ScheduleCommon> list = aO.getScheduleCommonByMentorName("son");
        for (ScheduleCommon schedulePublic : list) {
            System.out.println(schedulePublic);
        }
    }

}
