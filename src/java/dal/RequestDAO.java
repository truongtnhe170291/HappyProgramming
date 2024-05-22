/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Request;

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

    public boolean insertRequest(Request request, List<Integer> skills) {
        String query = "INSERT INTO [dbo].[RequestsFormMentee]\n"
                + "           ([mentor_name]\n"
                + "           ,[mentee_name]\n"
                + "           ,[deadline_date]\n"
                + "           ,[title]\n"
                + "           ,[description]\n"
                + "           ,[status_id]\n"
                + "           ,[deadline_hour])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, request.getMentorName());
            ps.setString(2, request.getMenteeName());
            ps.setDate(3, Date.valueOf(request.getDeadlineDate()));
            ps.setString(4, request.getTitle());
            ps.setString(5, request.getDescription());
            ps.setInt(6, request.getStatusId());
            ps.setTime(7, Time.valueOf(request.getDeadlineHour()));
            int result = ps.executeUpdate();

            if (true) {
                // Lấy ra CV mới nhất
                rs = ps.getGeneratedKeys();
                int requestId = rs.getInt(1);

                for (Integer skill : skills) {
                    insertRequestSkills(requestId, skill);
                }
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public void insertRequestSkills(int requestId, int skillId) {
        try {
            String query = "INSERT INTO [dbo].[RequestSkills]\n"
                    + "           ([skill_id]\n"
                    + "           ,[request_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            ps = con.prepareStatement(query);

            ps.setInt(1, skillId);
            ps.setInt(2, requestId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
