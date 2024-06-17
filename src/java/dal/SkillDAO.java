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
import java.util.List;
import models.Skill;

/**
 *
 * @author Admin
 */
public class SkillDAO {

    private Connection con;
    private String status = "OK";

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public SkillDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            status = "Error";
        }
    }

    //Lấy ra danh sách skill của hệ thống
    public List<Skill> getSkills() {
        String sql = "select * from Skills order by skill_name";
        List<Skill> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Skill s = new Skill(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(4));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Skill> searchSkills(String searchTerm) {
        String sql = "SELECT * FROM Skills WHERE skill_name LIKE ?";
        List<Skill> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%"); // Adding wildcards to search term
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Skill s = new Skill(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        SkillDAO sd = new SkillDAO();
        for (Skill s : sd.getSkillByCVId(1)) {
            System.out.println(s.getSkillName());
        }
    }

    public List<Skill> getSkillByCVId(int cvId) {
        String sql = "SELECT cs.skill_id, s.skill_name from CVSkills cs join Skills s on cs.skill_id = s.skill_id WHERE cs.cv_id = ?";
        List<Skill> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cvId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Skill s = new Skill();
                s.setSkillID(rs.getInt(1));
                s.setSkillName(rs.getString(2));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get all skills
    public List<Skill> getAllSkills() {
        String sql = "select * from Skills";
        List<Skill> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Skill s = new Skill(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //method to update skill
    public void updateSkill(int skill_id, String skill_name, String img, String description, boolean status) {
        try {
            String sql = "UPDATE [dbo].[Skills]\n"
                    + "   SET [skill_name] = ?\n"
                    + "      ,[img] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE [skill_id] = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, skill_name);
            ps.setString(2, img);
            ps.setString(3, description);
            ps.setBoolean(4, status);
            ps.setInt(5, skill_id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void saveSkill(Skill skill) {
        try {
            String sql = "INSERT INTO [dbo].[Skills]\n"
                    + "           ([skill_name]\n"
                    + "           ,[img]\n"
                    + "           ,[description]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, skill.getSkillName());
            ps.setString(2, skill.getImg());
            ps.setString(3, skill.getDescription());
            ps.setBoolean(4, skill.isStatus());
            ps.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
