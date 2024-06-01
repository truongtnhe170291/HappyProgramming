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

    public RequestDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean insertRequest(Request request, List<Integer> skills, List<Integer> listSelectSlot) {
        String query = "INSERT INTO [dbo].[RequestsFormMentee]"
                + "           ([mentor_name]"
                + "           ,[mentee_name]"
                + "           ,[deadline_date]"
                + "           ,[title]"
                + "           ,[description]"
                + "           ,[status_id]"
                + "           ,[deadline_hour])"
                + "     VALUES"
                + "           (?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
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

            if (result == 1) {
                // Lấy ra request mới nhất
                rs = ps.getGeneratedKeys();
                int requestId = rs.getInt(1);

                for (Integer skill : skills) {
                    insertRequestSkills(requestId, skill);
                }
                
                for(Integer selectedId: listSelectSlot){
                    insertRquestSelectedSlot(requestId, selectedId);
                }
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return false;
    }

    public void insertRquestSelectedSlot(int requestId, int selectedId) {
        try {
            String sql = "INSERT INTO RquestSelectedSlot(request_id, selected_id)"
                    + "VALUES"
                    + "(?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestId);
            ps.setInt(2, selectedId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void insertRequestSkills(int requestId, int skillId) {
        try {
            String query = "INSERT INTO [dbo].[RequestSkills]"
                    + "           ([skill_id]"
                    + "           ,[request_id])"
                    + "     VALUES"
                    + "           (?"
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
