package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.MentorProfileRate;
import models.Skill;

public class MentorProfileRateDAO {

    private Connection con;
    private String status = "OK";

    PreparedStatement ps;
    ResultSet rs;

    public MentorProfileRateDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            e.printStackTrace();
            status = "Error";
        }
    }

    private List<Skill> fetchSkills(int cvID, Connection con) throws SQLException {
        String sql = "SELECT s.* FROM CVSkills cvs "
                + "JOIN Skills s ON cvs.skill_id = s.skill_id "
                + "JOIN cv c ON c.cv_id = cvs.cv_id "
                + "WHERE c.status_id = 2 AND cvs.cv_id = ?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, cvID);

        rs = ps.executeQuery();

        List<Skill> skills = new ArrayList<>();
        while (rs.next()) {
            Skill skill = new Skill(rs.getInt("skill_id"), rs.getString("skill_name"));
            skills.add(skill);
        }

        return skills;
    }

    public List<MentorProfileRate> getAllMentorsrate() throws SQLException {
        String sql = "SELECT DISTINCT c.full_name, c.avatar, a.user_name, f.avg_star, c.cv_id, m.rate "
                + "FROM CV c "
                + "INNER JOIN Accounts a ON c.mentor_name = a.user_name "
                + "LEFT JOIN ("
                + "    SELECT mentor_name, AVG(CAST(star AS DECIMAL(10,2))) AS avg_star "
                + "    FROM FeedBacks "
                + "    GROUP BY mentor_name "
                + ") f ON c.mentor_name = f.mentor_name "
                + "INNER JOIN Mentors m ON c.mentor_name = m.mentor_name "
                + "WHERE c.status_id = 2 "
                + "ORDER BY f.avg_star DESC";

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        List<MentorProfileRate> mentors = new ArrayList<>();
        while (rs.next()) {
            MentorProfileRate mentor = new MentorProfileRate();
            mentor.setFull_name(rs.getString("full_name"));
            mentor.setAvatar(rs.getString("avatar"));
            mentor.setMentorName(rs.getString("user_name"));
            mentor.setStarAVG(rs.getFloat("avg_star"));
            mentor.setCv_id(rs.getInt("cv_id"));
            mentor.setRate(rs.getFloat("rate"));

            List<Skill> skills = fetchSkills(rs.getInt("cv_id"), con);
            mentor.setListSkills(skills);

            mentors.add(mentor);
        }

        return mentors;
    }

    public List<MentorProfileRate> getAllFavMentorsRate(String menteeUserName) throws SQLException {
        String sql = "SELECT DISTINCT c.full_name, c.avatar, a.user_name, f.avg_star, c.cv_id, m.rate "
                + "FROM CV c "
                + "INNER JOIN Accounts a ON c.mentor_name = a.user_name "
                + "LEFT JOIN ("
                + "    SELECT mentor_name, AVG(CAST(star AS DECIMAL(10,2))) AS avg_star "
                + "    FROM FeedBacks "
                + "    GROUP BY mentor_name "
                + ") f ON c.mentor_name = f.mentor_name "
                + "INNER JOIN Mentors m ON c.mentor_name = m.mentor_name "
                + "INNER JOIN FavoriteMentors fm ON c.mentor_name = fm.mentorUserName "
                + "WHERE c.status_id = 2 "
                + "  AND fm.menteeUserName = ? "
                + "ORDER BY f.avg_star DESC;";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            // Set the mentee's username as the parameter value
            ps.setString(1, menteeUserName);

            try (ResultSet rs = ps.executeQuery()) {
                List<MentorProfileRate> mentors = new ArrayList<>();
                while (rs.next()) {
                    MentorProfileRate mentor = new MentorProfileRate();
                    mentor.setFull_name(rs.getString("full_name"));
                    mentor.setAvatar(rs.getString("avatar"));
                    mentor.setMentorName(rs.getString("user_name"));
                    mentor.setStarAVG(rs.getFloat("avg_star"));
                    mentor.setCv_id(rs.getInt("cv_id"));
                    mentor.setRate(rs.getFloat("rate"));

                    // Assuming fetchSkills is another method to retrieve skills based on cv_id
                    List<Skill> skills = fetchSkills(rs.getInt("cv_id"), con);
                    mentor.setListSkills(skills);

                    mentors.add(mentor);
                }

                return mentors;
            }
        }
    }

    public List<MentorProfileRate> getAllListMentor() throws SQLException {
        // Lấy danh sách tất cả mentor từ cơ sở dữ liệu
        List<MentorProfileRate> allmentor = getAllMentorsrate();
        // Tạo danh sách mới để lưu trữ các mentor
        List<MentorProfileRate> listmentor = new ArrayList<>();
        // Thêm tất cả mentor từ allmentor vào listmentor
        listmentor.addAll(allmentor);
        // Trả về danh sách mentor
        return listmentor;
    }

    public List<MentorProfileRate> getAllListFavMentor(String menteeUserName) throws SQLException {
        // Lấy danh sách tất cả mentor từ cơ sở dữ liệu
        List<MentorProfileRate> allmentor = getAllFavMentorsRate(menteeUserName);
        // Tạo danh sách mới để lưu trữ các mentor
        List<MentorProfileRate> listmentor = new ArrayList<>();
        // Thêm tất cả mentor từ allmentor vào listmentor
        listmentor.addAll(allmentor);
        // Trả về danh sách mentor
        return listmentor;
    }

    public List<MentorProfileRate> searchMentorsBySkillandName(String searchTermName, String searchTerm) {
        // Loại bỏ khoảng trắng đầu và cuối của chuỗi tìm kiếm
        if (searchTerm != null) {
            searchTerm = searchTerm.trim();
        }
        if (searchTermName != null) {
            searchTermName = searchTermName.trim();
        }
        // Câu truy vấn SQL để tìm kiếm mentor dựa trên kỹ năng và tên
        String sql = "SELECT DISTINCT m.full_name, m.avatar, a.user_name, f.avg_star, m.cv_id, mr.rate "
                + "FROM CV m "
                + "INNER JOIN Accounts a ON m.mentor_name = a.user_name "
                + "LEFT JOIN ( "
                + "    SELECT mentor_name, AVG(CAST(star AS DECIMAL(10,2))) AS avg_star "
                + "    FROM FeedBacks "
                + "    GROUP BY mentor_name "
                + ") f ON m.mentor_name = f.mentor_name "
                + "INNER JOIN CVSkills cs ON m.cv_id = cs.cv_id "
                + "INNER JOIN Skills s ON cs.skill_id = s.skill_id "
                + "INNER JOIN Mentors mr ON m.mentor_name = mr.mentor_name "
                + "WHERE m.full_name LIKE ? AND s.skill_name LIKE ? "
                + "ORDER BY f.avg_star DESC";

        List<MentorProfileRate> list = new ArrayList<>();
        try {
            // Chuẩn bị câu lệnh SQL
            PreparedStatement ps = con.prepareStatement(sql);

// Thêm wildcard (%) vào chuỗi tìm kiếm để thực hiện tìm kiếm với LIKE
            ps.setString(1, "%" + searchTermName + "%");
            ps.setString(2, "%" + searchTerm + "%");
            // Thực hiện truy vấn và lấy kết quả
            ResultSet rs = ps.executeQuery();
// Lặp qua kết quả để xây dựng danh sách các mentor
            while (rs.next()) {
                // Lấy thông tin cơ bản của mentor
                MentorProfileRate mentor = new MentorProfileRate();
                mentor.setFull_name(rs.getString("full_name"));
                mentor.setAvatar(rs.getString("avatar"));
                mentor.setMentorName(rs.getString("user_name"));
                mentor.setStarAVG(rs.getFloat("avg_star"));
                mentor.setCv_id(rs.getInt("cv_id"));
                mentor.setRate(rs.getFloat("rate"));
                // Lấy danh sách kỹ năng của mentor từ phương thức fetchSkills
                List<Skill> skills = fetchSkills(rs.getInt("cv_id"), con);
                mentor.setListSkills(skills);

                // Thêm mentor vào danh sách kết quả
                list.add(mentor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Trả về danh sách các mentor phù hợp với kỹ năng và tên tìm kiếm
        return list;
    }

    public List<MentorProfileRate> searchMentorsBySkill(String searchTerm) {
        // Loại bỏ khoảng trắng đầu và cuối của chuỗi tìm kiếm  
        if (searchTerm != null) {
            searchTerm = searchTerm.trim();
        }
        // Câu truy vấn SQL để tìm kiếm mentor dựa trên tên kỹ năng
        String sql = "SELECT DISTINCT m.full_name, m.avatar, a.user_name, f.avg_star, m.cv_id, mr.rate "
                + "FROM CV m "
                + "INNER JOIN Accounts a ON m.mentor_name = a.user_name "
                + "LEFT JOIN ( "
                + "    SELECT mentor_name, AVG(CAST(star AS DECIMAL(10,2))) AS avg_star "
                + "    FROM FeedBacks "
                + "    GROUP BY mentor_name "
                + ") f ON m.mentor_name = f.mentor_name "
                + "INNER JOIN CVSkills cs ON m.cv_id = cs.cv_id "
                + "INNER JOIN Skills s ON cs.skill_id = s.skill_id "
                + "INNER JOIN Mentors mr ON m.mentor_name = mr.mentor_name "
                + "WHERE s.skill_name LIKE ? "// Tìm kiếm kỹ năng bằng cách sử dụng LIKE
                + "ORDER BY f.avg_star DESC";// Sắp xếp theo điểm trung bình phản hồi

        List<MentorProfileRate> list = new ArrayList<>();
        try {
            // Chuẩn bị câu lệnh SQL
            PreparedStatement ps = con.prepareStatement(sql);
            // Thêm wildcard (%) vào chuỗi tìm kiếm để thực hiện tìm kiếm với LIKE
            ps.setString(1, "%" + searchTerm + "%");
            // Thực hiện truy vấn và lấy kết quả
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                MentorProfileRate mentor = new MentorProfileRate();
                mentor.setFull_name(rs.getString("full_name"));
                mentor.setAvatar(rs.getString("avatar"));
                mentor.setMentorName(rs.getString("user_name"));
                mentor.setStarAVG(rs.getFloat("avg_star"));
                mentor.setCv_id(rs.getInt("cv_id"));
                mentor.setRate(rs.getFloat("rate"));

                List<Skill> skills = fetchSkills(rs.getInt("cv_id"), con);
                mentor.setListSkills(skills);

                list.add(mentor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<MentorProfileRate> searchMentorsByName(String searchTerm) {
        if (searchTerm != null) {
            searchTerm = searchTerm.trim();
        }

        String sql = "SELECT DISTINCT m.full_name, m.avatar, a.user_name, f.avg_star, m.cv_id, mr.rate "
                + "FROM CV m "
                + "INNER JOIN Accounts a ON m.mentor_name = a.user_name "
                + "LEFT JOIN ( "
                + "    SELECT mentor_name, AVG(CAST(star AS DECIMAL(10,2))) AS avg_star "
                + "    FROM FeedBacks "
                + "    GROUP BY mentor_name "
                + ") f ON m.mentor_name = f.mentor_name "
                + "INNER JOIN Mentors mr ON m.mentor_name = mr.mentor_name "
                + "WHERE m.full_name LIKE ? "
                + "ORDER BY f.avg_star DESC";

        List<MentorProfileRate> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                MentorProfileRate mentor = new MentorProfileRate();
                mentor.setFull_name(rs.getString("full_name"));
                mentor.setAvatar(rs.getString("avatar"));
                mentor.setMentorName(rs.getString("user_name"));
                mentor.setStarAVG(rs.getFloat("avg_star"));
                mentor.setCv_id(rs.getInt("cv_id"));
                mentor.setRate(rs.getFloat("rate"));

                List<Skill> skills = fetchSkills(rs.getInt("cv_id"), con);
                mentor.setListSkills(skills);

                list.add(mentor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
