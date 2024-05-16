/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import models.FeedBack;

/**
 *
 * @author Admin
 */
public class FeedBackDAO {

    private Connection con;
    private String status = "OK";

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public FeedBackDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            e.printStackTrace();
            status = "Error";
        }
    }

    public ArrayList<FeedBack> listFeedBacks() {
        ArrayList<FeedBack> list = new ArrayList<>();
        try {
            String query = "select * from [FeedBack]";
            con = new DBContext().connection; // Open connection to SQL
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FeedBack(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5)));
            }
        } catch (Exception e) {
            System.out.println("listSkill: " + e.getMessage());
        }
        return list;
    }

public String doFeedBack(String mentorGmail, String menteeGmail, int star, String comment) {
    String status = "OK";
    try {
        String query = "INSERT INTO FeedBack(GMailMentor, GMailMentee, Star, Comment, TimeFeedBack) VALUES (?, ?, ?, ?, ?)";
        con = new DBContext().connection; // Open connection to SQL
        ps = con.prepareStatement(query);
        ps.setString(1, mentorGmail);
        ps.setString(2, menteeGmail);
        ps.setInt(3, star);
        ps.setString(4, comment);
        ps.setDate(5, new java.sql.Date(System.currentTimeMillis())); // Current date and time
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("doFeedBack: " + e.getMessage());
        status = "Error";
    }
    return status;
}

public String updateFeedBack(String mentorGmail, String menteeGmail, int star, String comment) {
    String status = "OK";
    try {
        String query = "UPDATE FeedBack SET Star = ?, Comment = ?, TimeFeedBack = ? WHERE GMailMentor = ? AND GMailMentee = ?";
        con = new DBContext().connection; // Open connection to SQL
        ps = con.prepareStatement(query);
        ps.setInt(1, star);
        ps.setString(2, comment);
        ps.setDate(3, new java.sql.Date(System.currentTimeMillis())); // Current date and time
        ps.setString(4, mentorGmail);
        ps.setString(5, menteeGmail);
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("updateFeedBack: " + e.getMessage());
        status = "Error";
    }
    return status;
}

public String deleteFeedBack(String mentorGmail, String menteeGmail) {
    String status = "OK";
    try {
        String query = "DELETE FROM FeedBack WHERE GMailMentor = ? AND GMailMentee = ?";
        con = new DBContext().connection; // Open connection to SQL
        ps = con.prepareStatement(query);
        ps.setString(1, mentorGmail);
        ps.setString(2, menteeGmail);
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("deleteFeedBack: " + e.getMessage());
        status = "Error";
    }
    return status;
}


}
