/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
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
        String query = "SELECT * FROM [FeedBacks]";
        con = new DBContext().connection; // Mở kết nối đến SQL
        ps = con.prepareStatement(query);
        rs = ps.executeQuery();
          while(rs.next()){
                FeedBack f = new FeedBack(rs.getString(1), rs.getString(2),
                                          rs.getInt(3), rs.getString(4), rs.getDate(5));
                list.add(f);
            }
    } catch (Exception e) {
        System.out.println("Lỗi khi truy xuất phản hồi: " + e.getMessage());
    }
    return list;
}


public String addFeedBack(String mentorName, String menteeName, int star, String comment) {
    String status = "OK";
    try {
        String query = "INSERT INTO FeedBacks (mentor_name, mentee_name, star, comment, time_feedback) VALUES (?, ?, ?, ?, ?)";
        con = new DBContext().connection; // Mở kết nối đến SQL
        ps = con.prepareStatement(query);
        ps.setString(1, mentorName);
        ps.setString(2, menteeName);
        ps.setInt(3, star);
        ps.setString(4, comment);
        ps.setDate(5, new java.sql.Date(System.currentTimeMillis())); // Ngày và giờ hiện tại
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("Lỗi khi thêm phản hồi: " + e.getMessage());
        status = "Error";
    }
    return status;
}


public String updateFeedBack(int feedbackID, int star, String comment) {
    String status = "OK";
    try {
        String query = "UPDATE FeedBacks SET Star = ?, Comment = ?, TimeFeedBack = ? WHERE feedback_ID = ?";
        con = new DBContext().connection; // Mở kết nối đến SQL
        ps = con.prepareStatement(query);
        ps.setInt(1, star);
        ps.setString(2, comment);
        ps.setDate(3, new java.sql.Date(System.currentTimeMillis())); // Ngày và giờ hiện tại
        ps.setInt(4, feedbackID);
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("Lỗi khi cập nhật phản hồi: " + e.getMessage());
        status = "Error";
    }
    return status;
}

public String deleteFeedBack(int feedbackID) {
    String status = "OK";
    try {
        String query = "DELETE FROM FeedBacks WHERE feedback_ID = ?";
        con = new DBContext().connection; // Mở kết nối đến SQL
        ps = con.prepareStatement(query);
        ps.setInt(1, feedbackID);
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("Lỗi khi xóa phản hồi: " + e.getMessage());
        status = "Error";
    }
    return status;
}

 public static void main(String[] args) {
        FeedBackDAO sd = new FeedBackDAO();
        for(FeedBack s : sd.listFeedBacks()){
            System.out.println(s.toString());
        }
    }
 

}
