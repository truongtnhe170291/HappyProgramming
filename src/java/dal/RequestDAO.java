/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Request;
import models.RequestDTO;
import models.RequestSkill;
import models.Skill;

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


    public List<RequestSkill> getAllRequests(String menteeName) throws SQLException {
        // Tạo câu truy vấn SQL để lấy thông tin từ bảng RequestsFormMentee
        String sql = "  SELECT rfm.*, STRING_AGG(s.skill_name, ', ') AS skills FROM RequestsFormMentee rfm JOIN RequestSkills rs ON rfm.request_id = rs.request_id JOIN Skills s ON rs.skill_id = s.skill_id WHERE mentee_name = ? and rfm.status_id=1 GROUP BY rfm.request_id, rfm.mentor_name, rfm.mentee_name, rfm.deadline_date, rfm.deadline_hour, rfm.title, rfm.description, rfm.status_id;";

        // Chuẩn bị câu truy vấn SQL
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, menteeName); // Đặt giá trị cho tham số trong câu truy vấn SQL

        // Thực hiện câu truy vấn và lấy kết quả
        ResultSet rs = ps.executeQuery();

        // Tạo danh sách để lưu trữ thông tin của các request
        List<RequestSkill> requests = new ArrayList<>();
        while (rs.next()) {
            // Tạo một đối tượng RequestSkill mới và đặt các thuộc tính cho nó
            RequestSkill request = new RequestSkill();
            request.setRequestId(rs.getInt("request_id"));
            request.setMentorName(rs.getString("mentor_name"));
            request.setMenteeName(rs.getString("mentee_name"));
            request.setDeadlineDate(rs.getDate("deadline_date").toLocalDate());
            request.setDeadlineHour(rs.getTime("deadline_hour").toLocalTime());
            request.setTitle(rs.getString("title"));
            request.setDescription(rs.getString("description"));
            request.setStatusId(rs.getInt("status_id"));
            List<Skill> skills = fetchRequestSkills(rs.getInt("request_id"), con);
            request.setListSkills(skills);
            // Thêm request vào danh sách
            requests.add(request);
        }

        // Trả về danh sách request
        return requests;
    }

    public List<RequestDTO> getRequestDetails(int requestId) throws SQLException {
        // Tạo câu truy vấn SQL để lấy thông tin từ bảng RequestsFormMentee
        String sql = "SELECT rfm.request_id, rfm.mentor_name,rfm.mentee_name ,rfm.title,rfm.status_id ,rfm.description, rfm.deadline_date, rfm.deadline_hour, ss.day_of_slot, ss.slot_id, s.slot_name, c.start_time, c.end_time, STRING_AGG(sk.skill_name, ', ') AS skills\n"
                + "	FROM RequestsFormMentee rfm \n"
                + "	JOIN RquestSelectedSlot rss ON rfm.request_id = rss.request_id \n"
                + "	JOIN Selected_Slot ss ON rss.selected_id = ss.selected_id\n"
                + "	JOIN Status_Selected s_s ON s_s.status_id = ss.status_id\n"
                + "	JOIN Cycle c ON c.cycle_id = ss.cycle_id\n"
                + "	JOIN Slots s ON s.slot_id = ss.slot_id\n"
                + "	JOIN RequestSkills rs ON rfm.request_id = rs.request_id \n"
                + "	JOIN Skills sk ON rs.skill_id = sk.skill_id\n"
                + "	WHERE rfm.request_id = ?\n"
                + "	GROUP BY rfm.request_id, rfm.mentor_name, rfm.mentee_name, rfm.deadline_date, rfm.deadline_hour, rfm.title, rfm.description, rfm.status_id, ss.day_of_slot, ss.slot_id, s.slot_name, c.start_time, c.end_time";
        // Chuẩn bị câu truy vấn SQL
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, requestId); // Đặt giá trị cho tham số trong câu truy vấn SQL

        // Thực hiện câu truy vấn và lấy kết quả
        ResultSet rs = ps.executeQuery();

        // Tạo danh sách để lưu trữ thông tin của các request
        List<RequestDTO> requests = new ArrayList<>();
        while (rs.next()) {
            // Tạo một đối tượng RequestDTO mới và đặt các thuộc tính cho nó
            List<Skill> skills = fetchRequestSkills(requestId, con);
            RequestDTO request = new RequestDTO();
            request.setDayOfSlot(rs.getDate("day_of_slot").toLocalDate());
            request.setDeadlineDate(rs.getDate("deadline_date").toLocalDate());
            request.setDeadlineHour(rs.getTime("deadline_hour").toLocalTime());
            request.setDescription(rs.getString("description"));
            request.setEndTime(rs.getDate("end_time").toLocalDate());
            request.setListSkills(skills);
            request.setSlotID(rs.getString("slot_id"));
            request.setSlotName(rs.getString("slot_name"));
            request.setStartTime(rs.getDate("start_time").toLocalDate());
            request.setMentorName(rs.getString("mentor_name"));
            request.setMenteeName(rs.getString("mentee_name"));
            request.setRequestId(requestId);
            request.setRequestId(rs.getInt("request_id"));
            request.setTitle(rs.getString("title"));

            // Thêm request vào danh sách
            requests.add(request);
        }

        // Trả về danh sách request
        return requests;
    }
    public int getRequestId() {
        String sql = "select TOP 1 r.request_id from RequestsFormMentee r order by r.request_id desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int req = rs.getInt(1);
                return req;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;

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

        try (PreparedStatement ps = con.prepareStatement(query)) {
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
                int requestId = getRequestId();
                for (Integer skill : skills) {
                    insertRequestSkills(requestId, skill);
                }

                for (Integer selectedId : listSelectSlot) {
                    insertRquestSelectedSlot(requestId, selectedId);
                }
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return false;
    }

    private List<Skill> fetchRequestSkills(int requestId, Connection con) throws SQLException {
        // Tạo câu truy vấn SQL để lấy thông tin từ bảng RequestSkills và Skills
        String sql = "SELECT s.* FROM RequestSkills rs JOIN Skills s ON rs.skill_id = s.skill_id WHERE request_id = ?";

        // Chuẩn bị câu truy vấn SQL
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, requestId); // Đặt giá trị cho tham số trong câu truy vấn SQL

        // Thực hiện câu truy vấn và lấy kết quả
        ResultSet rs = ps.executeQuery();

        // Tạo danh sách để lưu trữ thông tin của các kỹ năng
        List<Skill> skills = new ArrayList<>();
        while (rs.next()) {
            // Tạo một đối tượng Skill mới và đặt các thuộc tính cho nó
            Skill skill = new Skill(rs.getInt("skill_id"), rs.getString("skill_name"));
            skills.add(skill);
        }

        // Trả về danh sách kỹ năng
        return skills;
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
    public void deleteRequest(int requestId) {
    try {
       
        String sql = "DELETE FROM [RequestSkills] WHERE [request_id] = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, requestId);
        ps.executeUpdate();

        
        sql = "DELETE FROM [RquestSelectedSlot] WHERE [request_id] = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, requestId);
        ps.executeUpdate();

   
        sql = "DELETE FROM [dbo].[RequestsFormMentee] WHERE request_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, requestId);
        ps.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
}


    public static void main(String[] args) throws SQLException {
        RequestDAO rdao = new RequestDAO();
        List<RequestDTO> rList = rdao.getRequestDetails(1);
        System.out.println(rList);
    }

}
