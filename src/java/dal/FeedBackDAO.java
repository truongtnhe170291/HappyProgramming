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
            while (rs.next()) {
                FeedBack f = new FeedBack(rs.getString(1), rs.getString(2),
                        rs.getInt(3), rs.getString(4), rs.getDate(5));
                list.add(f);
            }
        } catch (Exception e) {
            System.out.println("Lỗi khi truy xuất phản hồi: " + e.getMessage());
        }
        return list;
    }

    public String addFeedBack(FeedBack feedback) {
        String status = "OK";
        Connection con = null;
        PreparedStatement ps = null;

        try {
            String query = "INSERT INTO FeedBacks (mentor_name, mentee_name, star, request_id, comment, time_feedback) VALUES (?, ?, ?, ?, ?, ?)";
            con = new DBContext().connection; // Mở kết nối đến SQL
            ps = con.prepareStatement(query);
            ps.setString(1, feedback.getMentorName());
            ps.setString(2, feedback.getMenteeName());
            ps.setInt(3, feedback.getStar());
            ps.setInt(4, feedback.getRequestId());
            ps.setString(5, feedback.getComment());
            ps.setDate(6, feedback.getTimeFeedBack());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Lỗi thêm phản hồi: " + e.getMessage());
            e.printStackTrace(); // In stack trace để debug
            status = "Lỗi: " + e.getMessage(); // Ghi lại thông báo lỗi chi tiết
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                System.out.println("Lỗi đóng tài nguyên: " + e.getMessage());
                e.printStackTrace(); // In stack trace để debug
            }
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

    public boolean isContainFeedback(int requetsID) {
        try {
            String query = "SELECT * FROM [FeedBacks] where [request_id] = ?";
            con = new DBContext().connection; // Mở kết nối đến SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, requetsID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("isContainFeedback: " + e.getMessage());
            status = "Error";
        }
        return false;
    }

    public FeedBack getFeedBackByRequestId(int requetsID) {
        FeedBack fb = new FeedBack();
        try {
            String query = "SELECT * FROM [FeedBacks] where [request_id] = ?";
            con = new DBContext().connection; // Mở kết nối đến SQL
            ps = con.prepareStatement(query);
            ps.setInt(1, requetsID);
            rs = ps.executeQuery();
            while (rs.next()) {
                fb = new FeedBack(
                        rs.getString("mentor_name"),
                        rs.getString("mentee_name"),
                        rs.getInt("star"),
                        rs.getInt("request_id"),
                        rs.getString("comment"),
                        rs.getDate("time_feedback"));
            }
        } catch (Exception e) {
            System.out.println("getFeedBackByRequestId: " + e.getMessage());
            status = "Error";
        }
        return fb;
    }

    public static void main(String[] args) {
        FeedBackDAO sd = new FeedBackDAO();
        System.out.println(sd.getFeedBackByRequestId(1));
    }

        public String updateFeedBack(FeedBack feedback) {
        String status = "OK";
        Connection con = null;
        PreparedStatement ps = null;

        try {
            String query = "UPDATE [FeedBacks]\n"
                    + "SET [mentor_name] = ?, [mentee_name] = ?, [star] = ?, [comment] = ?, [time_feedback] = ?\n"
                    + "WHERE [request_id] = ?";
            con = new DBContext().connection; // Mở kết nối đến SQL
            ps = con.prepareStatement(query);
            ps.setString(1, feedback.getMentorName());
            ps.setString(2, feedback.getMenteeName());
            ps.setInt(3, feedback.getStar());
            ps.setString(4, feedback.getComment());
            ps.setDate(5, feedback.getTimeFeedBack());
            ps.setInt(6, feedback.getRequestId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi thêm phản hồi: " + e.getMessage());
            e.printStackTrace(); // In stack trace để debug
            status = "Lỗi: " + e.getMessage(); // Ghi lại thông báo lỗi chi tiết
        } 
        return status;
    }

}
