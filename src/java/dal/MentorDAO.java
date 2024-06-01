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
import models.Account;
import java.util.Date;
import models.Mentor;

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
    public boolean changeMentorRate(String mentorName, double rate) {
        String sql = "UPDATE [dbo].[Mentors]\n"
                + "SET [rate] = ?\n"
                + "WHERE mentor_name = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setDouble(1, rate);
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

}
