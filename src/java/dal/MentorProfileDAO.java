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
import java.util.List;
import models.FeedBack;
import models.FeedBackDTO;
import models.Mentor;
import models.MentorProfile;
import models.MentorProfileDTO;
import models.Skill;

/**
 *
 * @author Admin
 */
public class MentorProfileDAO {

    private Connection con;
    private String status = "OK";

    PreparedStatement ps;
    ResultSet rs;

    public MentorProfileDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            e.printStackTrace();
            status = "Error";
        }
    }

    public List<MentorProfile> getAllMentors() throws SQLException {
        // Tạo câu truy vấn SQL để lấy thông tin từ các bảng CV, Accounts và FeedBacks
        String sql = "SELECT DISTINCT c.full_name, c.avatar, a.user_name, f.avg_star, c.cv_id\n"
                + "                FROM dbo.CV c\n"
                + "                INNER JOIN dbo.Accounts a ON c.mentor_name = a.user_name\n"
                + "                LEFT JOIN (\n"
                + "              SELECT mentor_name, AVG(CAST(star AS DECIMAL(10,2))) AS avg_star\n"
                + "              FROM dbo.FeedBacks\n"
                + "                 GROUP BY mentor_name)\n"
                + "               f ON c.mentor_name = f.mentor_name\n"
                + "			   where c.status_id =2\n"
                + "                ORDER BY f.avg_star DESC;";

        // Chuẩn bị câu truy vấn SQL
        PreparedStatement ps = con.prepareStatement(sql);
        // Thực hiện câu truy vấn và lấy kết quả
        ResultSet rs = ps.executeQuery();

        // Tạo danh sách để lưu trữ thông tin của các mentor
        List<MentorProfile> mentors = new ArrayList<>();
        while (rs.next()) {
            // Tạo một đối tượng MentorProfile mới và đặt các thuộc tính cho nó
            MentorProfile mentor = new MentorProfile();
            mentor.setFull_name(rs.getString("full_name"));
            mentor.setAvatar(rs.getString("avatar"));
            mentor.setMentorName(rs.getString("user_name")); // Giả sử user_name đại diện cho tên mentor
            mentor.setStar(rs.getFloat("avg_star")); // Ép kiểu số sao trung bình thành float
            mentor.setCv_id(rs.getInt("cv_id"));
            // Lấy danh sách kỹ năng của mentor
            List<Skill> skills = fetchSkills(rs.getInt("cv_id"), con);
            mentor.setListSkills(skills);

            // Thêm mentor vào danh sách
            mentors.add(mentor);
        }

        // Trả về danh sách mentor
        return mentors;
    }

    public List<MentorProfile> getAllMentorBySkillID(int skillID) throws SQLException {
        // Lấy danh sách tất cả các mentor
        List<MentorProfile> allMentors = getAllMentors();

        // Tạo danh sách để lưu trữ các mentor có kỹ năng cần tìm
        List<MentorProfile> mentorsWithSkill = new ArrayList<>();
        for (MentorProfile mentor : allMentors) {
            // Kiểm tra xem mentor có kỹ năng cần tìm không
            if (mentor.getListSkills().stream().anyMatch(skill -> skill.getSkillID() == skillID)) {
                // Nếu có, thêm mentor vào danh sách
                mentorsWithSkill.add(mentor);
            }
        }

        // Trả về danh sách mentor có kỹ năng cần tìm
        return mentorsWithSkill;
    }

    public List<MentorProfileDTO> getTop3Mentors() throws SQLException {
      String sql = "WITH RankedMentors AS (" +
             "    SELECT " +
             "        A.[user_name], " +
             "        A.[gmail], " +
             "        c.cv_id, " +
             "        A.[full_name], " +
             "        A.[pass_word], " +
             "        A.[dob], " +
             "        A.[sex], " +
             "        A.[address], " +
             "        A.[phone], " +
             "        A.[avatar], " +
             "        A.[role_id], " +
             "        A.[status_id], " +
             "        m.rate, " +
             "        c.profession, " +
             "        c.profession_intro, " +
             "        c.achievement_description, " +
             "        c.service_description, " +
             "        ISNULL(f.avg_star, 0) AS avg_star, " +
             "        ROW_NUMBER() OVER(PARTITION BY A.[user_name] ORDER BY m.rate DESC) AS RowNum " +
             "    FROM " +
             "        [HappyProgrammingDB].[dbo].[Accounts] A " +
             "    JOIN " +
             "        [HappyProgrammingDB].[dbo].[RequestsFormMentee] RFM ON A.[user_name] = RFM.[mentor_name] " +
             "    JOIN " +
             "        [HappyProgrammingDB].[dbo].[CV] c ON c.mentor_name = A.[user_name] " +
             "    JOIN " +
             "        [HappyProgrammingDB].[dbo].[Mentors] m ON m.mentor_name = A.[user_name] " +
             "    LEFT JOIN " +
             "        (SELECT mentor_name, AVG(CAST(star AS DECIMAL(10,2))) AS avg_star " +
             "         FROM [HappyProgrammingDB].[dbo].[FeedBacks] " +
             "         GROUP BY mentor_name " +
             "        ) f ON A.[user_name] = f.mentor_name " +
             "    WHERE " +
             "        A.[role_id] = 2 " +
             "        AND RFM.[status_id] = 1 " +
             ") " +
             "SELECT * " +
             "FROM RankedMentors " +
             "WHERE RowNum = 1 " +
             "ORDER BY rate DESC " +
             "OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;";


        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        List<MentorProfileDTO> mentors = new ArrayList<>();
        while (rs.next()) {
            MentorProfileDTO mentor = new MentorProfileDTO();
            mentor.setRate(rs.getFloat("rate"));
            mentor.setCvID(rs.getInt("cv_id"));
            mentor.setGmail(rs.getString("gmail"));
            mentor.setFullName(rs.getString("full_name"));
            mentor.setSex(rs.getBoolean("sex"));
            mentor.setAddress(rs.getString("address"));
            mentor.setPhone(rs.getString("phone"));
            mentor.setDob(rs.getDate("dob"));
            mentor.setAvatar(rs.getString("avatar"));
            mentor.setProfession(rs.getString("profession"));
            mentor.setProfessionIntro(rs.getString("profession_intro"));
            mentor.setAchievementDescription(rs.getString("achievement_description"));
            mentor.setService_description(rs.getString("service_description"));
            mentor.setMentorName(rs.getString("user_name"));
            mentor.setStarAVG(rs.getFloat("avg_star"));

            // Fetch skills for this mentor
            List<Skill> skills = fetchSkills(rs.getInt("cv_id"), con);
            mentor.setListSkills(skills);

            // Fetch feedbacks for this mentor
            List<FeedBackDTO> feedbacks = fetchFeedbacks(rs.getString("user_name"), con);
            mentor.setFeedBacks(feedbacks);

            mentors.add(mentor);
        }

        return mentors;
    }
    
    public MentorProfileDTO getOneMentor(String mentorName) throws SQLException {
        String sql = "SELECT c.*, a.phone, m.rate FROM CV c JOIN Accounts a ON c.mentor_name = a.user_name\n"
                + "JOIN Mentors m on m.mentor_name = c.mentor_name\n"
                + "                 WHERE c.mentor_name = ?";

        ps = con.prepareStatement(sql);
        ps.setString(1, mentorName); // Set the mentorName parameter

        rs = ps.executeQuery();

        MentorProfileDTO mentor = null;
        if (rs.next()) {
            mentor = new MentorProfileDTO();
            mentor.setRate(rs.getFloat("rate"));
            mentor.setCvID(rs.getInt("cv_id"));
            mentor.setGmail(rs.getString("gmail"));
            mentor.setFullName(rs.getString("full_name"));
            mentor.setSex(rs.getBoolean("sex"));
            mentor.setAddress(rs.getString("address"));
            mentor.setPhone(rs.getString("phone"));
            mentor.setDob(rs.getDate("dob"));
            mentor.setAvatar(rs.getString("avatar"));
            mentor.setProfession(rs.getString("profession"));
            mentor.setProfessionIntro(rs.getString("profession_intro"));
            mentor.setAchievementDescription(rs.getString("achievement_description"));
            mentor.setService_description(rs.getString("service_description"));

            // Fetch skills for this mentor
            List<Skill> skills = fetchSkills(rs.getInt("cv_id"), con);
            mentor.setListSkills(skills);

            // Fetch feedbacks for this mentor
            List<FeedBackDTO> feedbacks = fetchFeedbacks(mentorName, con);
            mentor.setFeedBacks(feedbacks);
        }

        return mentor;
    }



    private List<Skill> fetchSkills(int cvID, Connection con) throws SQLException {
        String sql = "select s.* from CVSkills cvs Join Skills s on cvs.skill_id = s.skill_id\n"
                + "join cv c on c.cv_id = cvs.cv_id\n"
                + "where c.status_id = 2 and cvs.cv_id = ?";

         ps = con.prepareStatement(sql);
        ps.setInt(1, cvID); // Set the mentorName parameter

        ResultSet rs = ps.executeQuery();

        List<Skill> skills = new ArrayList<>();
        while (rs.next()) {
            Skill skill = new Skill(rs.getInt("skill_id"), rs.getString("skill_name"));
            skills.add(skill);
        }

        return skills;
    }

    private List<FeedBackDTO> fetchFeedbacks(String mentorName, Connection con) throws SQLException {
        String sql = "SELECT f.mentee_name, f.star, f.comment, f.time_feedback, a.avatar "
                + "FROM dbo.FeedBacks f "
                + "INNER JOIN dbo.Mentees m ON f.mentee_name = m.mentee_name "
                + "INNER JOIN dbo.Accounts a ON m.mentee_name = a.user_name "
                + "WHERE f.mentor_name = ?";

         ps = con.prepareStatement(sql);
        ps.setString(1, mentorName); // Set the mentorName parameter

        ResultSet rs = ps.executeQuery();

        List<FeedBackDTO> feedbacks = new ArrayList<>();
        while (rs.next()) {
            FeedBackDTO feedback = new FeedBackDTO();
            feedback.setMenteeName(rs.getString("mentee_name"));
            feedback.setStar(rs.getInt("star"));
            feedback.setComment(rs.getString("comment"));
            feedback.setTimeFeedBack(rs.getDate("time_feedback"));
            feedback.setAvatar(rs.getString("avatar")); // Set the avatar property
            feedbacks.add(feedback);
        }

        return feedbacks;
    }
    
    public List<FeedBackDTO> get5Feedback(String mentorName) throws SQLException {
    String sql = "SELECT TOP 5 f.mentee_name, f.star, f.comment, f.time_feedback, a.avatar "
                + "FROM dbo.FeedBacks f "
                + "INNER JOIN dbo.Mentees m ON f.mentee_name = m.mentee_name "
                + "INNER JOIN dbo.Accounts a ON m.mentee_name = a.user_name "
                + "WHERE f.mentor_name = ? "
                + "ORDER BY f.time_feedback DESC";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, mentorName); // Set the mentorName parameter

    ResultSet rs = ps.executeQuery();

    List<FeedBackDTO> feedbacks = new ArrayList<>();
    while (rs.next()) {
        FeedBackDTO feedback = new FeedBackDTO();
        feedback.setMenteeName(rs.getString("mentee_name"));
        feedback.setStar(rs.getInt("star"));
        feedback.setComment(rs.getString("comment"));
        feedback.setTimeFeedBack(rs.getDate("time_feedback"));
        feedback.setAvatar(rs.getString("avatar")); // Set the avatar property
        feedbacks.add(feedback);
    }

    return feedbacks;
}


    public static void main(String[] args) throws SQLException {

        MentorProfileDAO dao = new MentorProfileDAO();

        MentorProfileDTO mentorProfile = dao.getOneMentor("son");
        System.out.println(mentorProfile.getAvatar());

    }
}
