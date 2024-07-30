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
   public List<MentorProfile> getAllListMentor() throws SQLException {
    // Lấy danh sách tất cả mentor từ cơ sở dữ liệu
    List<MentorProfile> allmentor = getAllMentors();
    // Tạo danh sách mới để lưu trữ các mentor
    List<MentorProfile> listmentor = new ArrayList<>();
    // Thêm tất cả mentor từ allmentor vào listmentor
    listmentor.addAll(allmentor);
    // Trả về danh sách mentor
    return listmentor;
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
    String sql = "SELECT TOP 3 " +
                 "    A.[user_name], " +
                 "    A.[gmail], " +
                 "    C.cv_id, " +
                 "    A.[full_name], " +
                 "    A.[pass_word], " +
                 "    A.[dob], " +
                 "    A.[sex], " +
                 "    A.[address], " +
                 "    A.[phone], " +
                 "    A.[avatar], " +
                 "    A.[role_id], " +
                 "    A.[status_id], " +
                 "    M.rate, " +
                 "    C.profession, " +
                 "    C.profession_intro, " +
                 "    C.achievement_description, " +
                 "    C.service_description, " +
                 "    ISNULL(AVG(F.star), 0) AS avg_star, " +
                 "    COUNT(RFM.request_id) AS request_count " +
                 "FROM Accounts A " +
                 "JOIN Mentors M ON A.[user_name] = M.mentor_name " +
                 "JOIN CV C ON M.mentor_name = C.mentor_name " +
                 "LEFT JOIN FeedBacks F ON M.mentor_name = F.mentor_name " +
                 "LEFT JOIN RequestsFormMentee RFM ON M.mentor_name = RFM.mentor_name " +
                 "WHERE A.[role_id] = 2 " +
                 "GROUP BY " +
                 "    A.[user_name], A.[gmail], C.cv_id, A.[full_name], A.[pass_word], " +
                 "    A.[dob], A.[sex], A.[address], A.[phone], A.[avatar], " +
                 "    A.[role_id], A.[status_id], M.rate, C.profession, " +
                 "    C.profession_intro, C.achievement_description, C.service_description " +
                 "ORDER BY request_count DESC, avg_star DESC;";

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
    
    public List<MentorProfile> searchMentorsBySkill(String searchTerm) {
    // Loại bỏ khoảng trắng đầu và cuối của chuỗi tìm kiếm
    if (searchTerm != null) {
        searchTerm = searchTerm.trim();
    }

    // Câu truy vấn SQL để tìm kiếm mentor dựa trên tên kỹ năng
    String sql = "SELECT DISTINCT m.full_name, m.avatar, a.user_name, f.avg_star, m.cv_id " +
                 "FROM CV m " +
                 "INNER JOIN Accounts a ON m.mentor_name = a.user_name " +
                 "LEFT JOIN ( " +
                 "  SELECT mentor_name, AVG(CAST(star AS DECIMAL(10,2))) AS avg_star " +
                 "  FROM FeedBacks " +
                 "  GROUP BY mentor_name) f ON m.mentor_name = f.mentor_name " +
                 "INNER JOIN CVSkills cs ON m.cv_id = cs.cv_id " +
                 "INNER JOIN Skills s ON cs.skill_id = s.skill_id " +
                 "WHERE s.skill_name LIKE ? " + // Tìm kiếm kỹ năng bằng cách sử dụng LIKE
                 "ORDER BY f.avg_star DESC"; // Sắp xếp theo điểm trung bình phản hồi

    List<MentorProfile> list = new ArrayList<>();
    try {
        // Chuẩn bị câu lệnh SQL
        PreparedStatement ps = con.prepareStatement(sql);
        
        // Thêm wildcard (%) vào chuỗi tìm kiếm để thực hiện tìm kiếm với LIKE
        ps.setString(1, "%" + searchTerm + "%");
        
        // Thực hiện truy vấn và lấy kết quả
        ResultSet rs = ps.executeQuery();
        
        // Lặp qua kết quả để xây dựng danh sách các mentor
        while (rs.next()) {
            MentorProfile mentor = new MentorProfile();
            
            // Lấy thông tin cơ bản của mentor
            mentor.setFull_name(rs.getString("full_name"));
            mentor.setAvatar(rs.getString("avatar"));
            mentor.setMentorName(rs.getString("user_name"));
            mentor.setStar(rs.getFloat("avg_star"));
            mentor.setCv_id(rs.getInt("cv_id"));

            // Lấy danh sách kỹ năng của mentor từ phương thức fetchSkills
            List<Skill> skills = fetchSkills(rs.getInt("cv_id"), con);
            mentor.setListSkills(skills);

            // Thêm mentor vào danh sách kết quả
            list.add(mentor);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu có lỗi xảy ra trong quá trình thực hiện truy vấn
        e.printStackTrace();
    }
    // Trả về danh sách các mentor phù hợp với kỹ năng tìm kiếm
    return list;
}
    
    public List<MentorProfile> searchMentorsByName(String searchTerm) {
    // Loại bỏ khoảng trắng đầu và cuối của chuỗi tìm kiếm
    if (searchTerm != null) {
        searchTerm = searchTerm.trim();
    }

    // Câu truy vấn SQL để tìm kiếm mentor dựa trên tên mentor
    String sql = "SELECT DISTINCT m.full_name, m.avatar, a.user_name, f.avg_star, m.cv_id " +
                 "FROM CV m " +
                 "INNER JOIN Accounts a ON m.mentor_name = a.user_name " +
                 "LEFT JOIN ( " +
                 "  SELECT mentor_name, AVG(CAST(star AS DECIMAL(10,2))) AS avg_star " +
                 "  FROM FeedBacks " +
                 "  GROUP BY mentor_name) f ON m.mentor_name = f.mentor_name " +
                 "WHERE m.full_name LIKE ? " + // Tìm kiếm mentor bằng cách sử dụng LIKE
                 "ORDER BY f.avg_star DESC"; // Sắp xếp theo điểm trung bình phản hồi

    List<MentorProfile> list = new ArrayList<>();
    try {
        // Chuẩn bị câu lệnh SQL
        PreparedStatement ps = con.prepareStatement(sql);
        
        // Thêm wildcard (%) vào chuỗi tìm kiếm để thực hiện tìm kiếm với LIKE
        ps.setString(1, "%" + searchTerm + "%");
        
        // Thực hiện truy vấn và lấy kết quả
        ResultSet rs = ps.executeQuery();
        
        // Lặp qua kết quả để xây dựng danh sách các mentor
        while (rs.next()) {
            MentorProfile mentor = new MentorProfile();
            
            // Lấy thông tin cơ bản của mentor
            mentor.setFull_name(rs.getString("full_name"));
            mentor.setAvatar(rs.getString("avatar"));
            mentor.setMentorName(rs.getString("user_name"));
            mentor.setStar(rs.getFloat("avg_star"));
            mentor.setCv_id(rs.getInt("cv_id"));

            // Lấy danh sách kỹ năng của mentor từ phương thức fetchSkills
            List<Skill> skills = fetchSkills(rs.getInt("cv_id"), con);
            mentor.setListSkills(skills);

            // Thêm mentor vào danh sách kết quả
            list.add(mentor);
        }
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu có lỗi xảy ra trong quá trình thực hiện truy vấn
        e.printStackTrace();
    }
    // Trả về danh sách các mentor phù hợp với tên tìm kiếm
    return list;
}

    
}
