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
import models.Slot;

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
            con = new DBContext().connection;//mo ket noi voi sql
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
//    public List<Mentor> getMentors() {
//        String sql = "select * from mentors m join Accounts a on m.mentor_name = a.user_name";
//        List<Mentor> list = new ArrayList<>();
//        try {
//            ps = con.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Mentor m = new Mentor(rs.getString("avatar"), rs.getString("user_name"),
//                        rs.getString("gmail"), rs.getString("full_name"),
//                        rs.getString("pass_word"), rs.getDate("dob"),
//                        rs.getBoolean("sex"), rs.getString("address"),
//                        rs.getString("phone"), rs.getInt("role_id"),
//                        rs.getInt("status_id"));
//                list.add(m);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//    public static void main(String[] args) {
//        MentorDAO md = new MentorDAO();
//        for (Mentor m : md.getMentors()) {
//            System.out.println(m.getUserName());
//        }
//    }

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
            while(rs.next()){
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

    public void insertSchedulePublic(String mentor_name, String slot_id, int cycle_id, String day_of_slot, int status_id) {
        try {
            String query = "INSERT INTO Selected_Slot(mentor_name, slot_id, cycle_id, day_of_slot, status_id) VALUES (?, ?, ?, ?, ?)";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, mentor_name);
            ps.setString(2, slot_id);
            ps.setInt(3, cycle_id);
            ps.setString(4, day_of_slot);
            ps.setInt(5, status_id);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("insertSchedulePublic: " + e.getMessage());
        }
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

//    public static void main(String[] args) {
//        MentorDAO dao = new MentorDAO();
//        System.out.println(dao.getNextMonSunByUserName("son"));
//    }

}
