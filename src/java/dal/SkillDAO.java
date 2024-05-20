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
public class SkillDAO{
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
    public List<Skill> getSkills(){
        String sql = "select * from Skills";
        List<Skill> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Skill s = new Skill(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getString(4), rs.getInt(4));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Skill> getSkillByUserName(String username) {
        String sql = "SELECT s.[skill_id], s.[skill_name] FROM Mentors m join MentorSkills ms ON m.mentor_name = ms.mentor_name\n" +
                            "JOIN Skills s ON s.skill_id = ms.skill_id where m.mentor_name = ?";
        List<Skill> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while(rs.next()){
                Skill s = new Skill(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getString(4), rs.getInt(4));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }

    public static void main(String[] args) {
        SkillDAO sd = new SkillDAO();
        for(Skill s : sd.getSkills()){
            System.out.println(s.getSkillName());
        }
    }
}
