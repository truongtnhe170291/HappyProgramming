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
            String query = "SELECT * FROM Account a join Mentee mentee ON a.UserName = mentee.UserNameMentee\n"
                    + "  Where mentee.UserNameMentee = ? and a.Role = 'Mentee'";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                mentee = new Mentee(
                        rs.getString(12),
                        rs.getString(2),
                        rs.getString(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getDate(5));
            }
        } catch (Exception e) {
            System.out.println("getCurrentMentee: " + e.getMessage());
        }
        return mentee;
    }

    public void updateAccountMentee(String username, String fullname, String dob, String sex, String address, String gmail) {
        try {
            String query = " UPDATE Account \n"
                    + "  SET GMail = ?, FullName = ?, Dob = ?, Sex = ?, Address = ?\n"
                    + "  Where UserName = ?";
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
            String query = "UPDATE Mentee \n"
                    + "  SET avatar = ?\n"
                    + "  Where UserNameMentee = ?";
            con = new DBContext().connection;//mo ket noi voi sql
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
        dao.updateAccountMentee("user1", "Pham Son", "2003-12-2", "1", "Thanh Hoa", "2k3sonpham@gmail.com");
        dao.updateMentee("https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/369382034_1366399914257958_6844376332586854711_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_ohc=HcNZC29HJH8Q7kNvgE0qLnH&_nc_ht=scontent.fhan5-2.fna&oh=00_AYD7lKkzEPlcVNF6TeC8GtCPxyGI0M2ALXHvLSvOocqVSA&oe=664D3776", "user1");
    }

}
