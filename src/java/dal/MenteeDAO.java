/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Account;
import models.Mentee;

/**
 *
 * @author 2k3so
 */
public class MenteeDAO {

    private Connection con;
    private String status = "OK";

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public MenteeDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            e.printStackTrace();
            status = "Error";
        }
    }

    public Mentee getCurrentMentee(String userName) {
        Mentee mentee = null;
        try {
            String query = "SELECT * FROM Accounts a JOIN Mentees mentee ON a.user_name = mentee.mentee_name\r\n" + //
                    "WHERE a.user_name = ?  and a.role_id = '1'";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                mentee = new Mentee(
                        rs.getString(12),
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
            }
        } catch (Exception e) {
            System.out.println("getCurrentMentee: " + e.getMessage());
        }
        return mentee;
    }

    public void updateAccountMentee(String username, String fullname, String dob, String sex, String address,
            String gmail) {
        try {
            String query = "UPDATE Accounts \r\n" + //
                    "SET gmail = ?, full_name = ?, dob = ?, sex = ?, address = ?\r\n"
                    + //
                    "Where user_name = ?";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, gmail);
            ps.setString(2, fullname);
            ps.setString(3, dob);
            ps.setString(4, sex);
            ps.setString(5, address);
            ps.setString(6, username);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("updateAccountMentee: " + e.getMessage());
        }
    }

    public void updateMentee(String avatar, String userName) {
        try {
            String query = "UPDATE Mentees\r\n" + //
                    "SET avatar = ?\r\n"
                    + //
                    "Where mentee_name = ?";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, avatar);
            ps.setString(2, userName);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateMentee: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        MenteeDAO dao = new MenteeDAO();
        dao.updateAccountMentee(
                "user1",
                "hoanghai", 
                "2003-12-5", 
                "1", 
                "hanoi",
                "gmail@com.com");
    }

}
