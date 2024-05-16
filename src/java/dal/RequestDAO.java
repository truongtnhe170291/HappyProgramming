/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.Date;

public class RequestDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private String status = "OK";
    
    public RequestDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            e.printStackTrace();
            status = "Error";
        }
    }

    public void insertRequest(String gMailMentor, String gMailMentee, Date deadlineDate, String title, String description, Time deadlineHour) {
        String query = "INSERT INTO Request (GMailMentor, GMailMentee, DeadlineDate, Title, Description, Status, DeadlineHour) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(query);
            ps.setString(1, gMailMentor);
            ps.setString(2, gMailMentee);
            ps.setDate(3, (java.sql.Date) deadlineDate);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setInt(6, 1);
            ps.setTime(7, deadlineHour);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
