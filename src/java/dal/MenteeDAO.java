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

    public Mentee getCurrentMentee(String gmail) {
        Mentee mentee = null;
        try {
            String query = "SELECT * FROM Account a JOIN Mentee mentee ON a.GMail = mentee.GMailMentee\n"
                    + "WHERE a.GMail = ?  and a.Role = 'mentee'";
            con = new DBContext().connection;//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, gmail);
            rs = ps.executeQuery();
            while (rs.next()) {
                mentee = new Mentee(
                        rs.getString(12),
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
            }
        } catch (Exception e) {
            System.out.println("getCurrentMentee: " + e.getMessage());
        }
        return mentee;
    }

}
