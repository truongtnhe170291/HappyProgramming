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
        String sql = "SELECT DISTINCT c.full_name, a.avatar, a.user_name, f.avg_star "
                + "FROM dbo.CV c "
                + "INNER JOIN dbo.Accounts a ON c.mentor_name = a.user_name "
                + "LEFT JOIN ( "
                + "  SELECT mentor_name, AVG(star) AS avg_star "
                + "  FROM dbo.FeedBacks "
                + "  GROUP BY mentor_name "
                + ") f ON c.mentor_name = f.mentor_name;"; // Semicolon added

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        List<MentorProfile> mentors = new ArrayList<>();
        while (rs.next()) {
            MentorProfile mentor = new MentorProfile();
            mentor.setFull_name(rs.getString("full_name"));
            mentor.setAvatar(rs.getString("avatar"));
            mentor.setMentorName(rs.getString("user_name")); // Assuming user_name represents mentor name
            mentor.setStar(rs.getFloat("avg_star"));
            List<Skill> skills = fetchSkills(rs.getString("user_name"), con);// Cast to float for starAVG
            mentor.setListSkills(skills);

            mentors.add(mentor);
        }

        return mentors;
    }

    public List<MentorProfile> getAllMentorBySkillID(int skillID) throws SQLException {
        List<MentorProfile> allMentors = getAllMentors(); // Assume you have implemented this method

        List<MentorProfile> mentorsWithSkill = new ArrayList<>();
        for (MentorProfile mentor : allMentors) {
            if (mentor.getListSkills().stream().anyMatch(skill -> skill.getSkillID() == skillID)) {
                mentorsWithSkill.add(mentor);
            }
        }

        return mentorsWithSkill;
    }

    public MentorProfileDTO getOneMentor(String mentorName) throws SQLException {
        String sql = "SELECT c.*, a.phone, a.avatar, m.rate FROM CV c JOIN Accounts a ON c.mentor_name = a.user_name\n"
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
            List<Skill> skills = fetchSkills(mentorName, con);
            mentor.setListSkills(skills);

            // Fetch feedbacks for this mentor
            List<FeedBackDTO> feedbacks = fetchFeedbacks(mentorName, con);
            mentor.setFeedBacks(feedbacks);
        }

        return mentor;
    }

    private List<Skill> fetchSkills(String mentorName, Connection con) throws SQLException {
        String sql = "SELECT s.* "
                + "FROM MentorSkills mts, Skills s "
                + "WHERE mts.mentor_name = ? "
                + // Use prepared statement parameter
                "AND s.skill_id = mts.skill_id";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, mentorName); // Set the mentorName parameter

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
                + "WHERE f.mentor_name = ?"; // Use prepared statement parameter

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
        // Establish a connection to your database (replace with your connection logic)
        Connection con = new DBContext().connection; // Assuming DBContext provides connection

        // Create a MentorDAO instance
        MentorProfileDAO dao = new MentorProfileDAO();

        // Retrieve the mentor profile using "user2" as the mentor name
        MentorProfileDTO mentorProfile = dao.getOneMentor("user3");

        if (mentorProfile != null) {
            System.out.println("Mentor Profile:");
            System.out.println("Rate: " +mentorProfile.getRate());
            System.out.println("CV ID: " + mentorProfile.getCvID());
            System.out.println("Gmail: " + mentorProfile.getGmail());
            System.out.println("Full Name: " + mentorProfile.getFullName());
            System.out.println("Sex: " + mentorProfile.isSex());
            System.out.println("Address: " + mentorProfile.getAddress());
            System.out.println("Phone: " + mentorProfile.getPhone());
            System.out.println("Date of Birth: " + mentorProfile.getDob());
            System.out.println("Avatar: " + mentorProfile.getAvatar());
            System.out.println("Profession: " + mentorProfile.getProfession());
            System.out.println("Profession Intro: " + mentorProfile.getProfessionIntro());
            System.out.println("Achievement Description: " + mentorProfile.getAchievementDescription());
            System.out.println("Service Description: " + mentorProfile.getService_description());

            // Print skills
            System.out.println("\nSkills:");
            for (Skill skill : mentorProfile.getListSkills()) {
                System.out.println("Skill ID: " + skill.getSkillID());
                System.out.println("Skill Name: " + skill.getSkillName());
            }

            // Print feedbacks
            System.out.println("\nFeedbacks:");
            for (FeedBackDTO feedback : mentorProfile.getFeedBacks()) {
                System.out.println("Mentee Name: " + feedback.getMenteeName());
                System.out.println("Star: " + feedback.getStar());
                System.out.println("Comment: " + feedback.getComment());
                System.out.println("Time Feedback: " + feedback.getTimeFeedBack());
                System.out.println("Mentee Avatar: " + feedback.getAvatar());
            }
        } else {
            System.out.println("Mentor with name '' not found.");
        }

        // Close the database connection (replace with your closing logic)
        con.close();
    }

}
