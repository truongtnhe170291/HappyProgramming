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
    String sql = "SELECT ss.selected_id, ss.mentor_name, s.slot_id, s.slot_name, ss.day_of_slot,"
               + " (DATEPART(weekday, ss.day_of_slot) + 5) % 7 + 1 as DayOfWeek,"
               + " c.start_time, c.end_time "
               + "FROM Selected_Slot ss "
               + "JOIN Cycle c ON ss.cycle_id = c.cycle_id "
               + "JOIN Slots s ON s.slot_id = ss.slot_id "
               + "WHERE ss.status_id = 1";
    List<SchedulePublic> list = new ArrayList<>();
    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            int selectedId = rs.getInt("selected_id");
            String mentorName = rs.getString("mentor_name");
            String slotId = rs.getString("slot_id");
            String slotName = rs.getString("slot_name");
            Date dayOfSlot = rs.getDate("day_of_slot");
            int dayOfWeekValue = rs.getInt("DayOfWeek");
            DayOfWeek nameOfDay = DayOfWeek.of(dayOfWeekValue);
            Date startTime = rs.getDate("start_time");
            Date endTime = rs.getDate("end_time");
            
            SchedulePublic request = new SchedulePublic(mentorName, selectedId, dayOfSlot, slotId, startTime, endTime, slotName, nameOfDay);
            list.add(request);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return list;
}
    public boolean approveRequest(int selectedId) {
    String sql = "UPDATE [dbo].[Selected_Slot] SET [status_id] = 2 WHERE selected_id = ?";

    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, selectedId);

        int row = ps.executeUpdate();
        if (row != 1) {
            return false;
        }

    } catch (SQLException e) {
        System.out.println(e);
    }
    return true;
}

public boolean rejectRequest(int selectedId) {
    String sql = "UPDATE [dbo].[Selected_Slot] SET [status_id] = 3 WHERE selected_id = ?";

    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, selectedId);

        int row = ps.executeUpdate();
        if (row != 1) {
            return false;
        }

    } catch (SQLException e) {
        System.out.println(e);
    }
    return true;
}



    public List<SchedulePublic> GetListSchedulePublicByMentorName(String userName, java.sql.Date startTime, java.sql.Date endTime) {
        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "SELECT ss.selected_id, ss.day_of_slot, ss.slot_id, c.start_time, c.end_time, s.slot_name from Selected_Slot ss join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id "
                    + "where ss.mentor_name = ? AND c.start_time >= ? AND c.end_time <= ? AND ss.status_id = 2";
            
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setDate(2, startTime);
            ps.setDate(3, endTime);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new SchedulePublic(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public static void main(String[] args) {
        ScheduleDAO aO = new ScheduleDAO();
        List<SchedulePublic> list = aO.getRequestByMentor();
        for (SchedulePublic schedulePublic : list) {
            System.out.println(schedulePublic);
        }
    }
}
