/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        List<SchedulePublic> list = aO.GetListSchedulePublicByMentorName("son", java.sql.Date.valueOf("2024-06-03"), java.sql.Date.valueOf("2024-06-09"));
    }
}
