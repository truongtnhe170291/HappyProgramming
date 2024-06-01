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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Request;
import models.RequestSkill;
import models.Skill;

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
    public List<RequestSkill> getAllRequests(String menteeName) throws SQLException {
    // Tạo câu truy vấn SQL để lấy thông tin từ bảng RequestsFormMentee
    String sql = "SELECT rfm.*, STRING_AGG(s.skill_name, ', ') AS skills FROM RequestsFormMentee rfm JOIN RequestSkills rs ON rfm.request_id = rs.request_id JOIN Skills s ON rs.skill_id = s.skill_id WHERE mentee_name = ? GROUP BY rfm.request_id, rfm.mentor_name, rfm.mentee_name, rfm.deadline_date, rfm.deadline_hour, rfm.title, rfm.description, rfm.status_id;";

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
    public static void main(String[] args) throws SQLException {
        RequestDAO rdao = new RequestDAO();
        List <RequestSkill> rList = rdao.getAllRequests("son");
        System.out.println(rList);
    }

}
