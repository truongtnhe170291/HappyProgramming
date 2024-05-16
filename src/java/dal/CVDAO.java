/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import models.CV;

/**
 *
 * @author Admin
 */
public class CVDAO {

    private Connection con;
    private String status = "OK";

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public CVDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            status = "Error";
        }
    }

    public boolean addCV(CV cv) {
        String sql = "INSERT INTO CV (GMailMentor, GMail, UserName, FullName, Dob, Sex, [Address], Avatar, Profession, ProfessionIntro, AchievementDescription, ServiceDescription) VALUES\n"
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cv.getgMailMentor());
            ps.setString(2, cv.getgMail());
            ps.setString(3, cv.getUserName());
            ps.setString(4, cv.getFullName());
            ps.setDate(5, cv.getDob());
            ps.setBoolean(6, cv.isSex());
            ps.setString(7, cv.getAddress());
            ps.setString(8, cv.getAvatar());
            ps.setString(9, cv.getProfession());
            ps.setString(10, cv.getProfessionIntro());
            ps.setString(11, cv.getAchievementDescription());
            ps.setString(12, cv.getServiceDescription());

            int result = ps.executeUpdate();
            if (result == 1) {
                // Lấy ra CV mới nhất
                int cvId = getCVId();
                for (int skilId : cv.getSkills()) { //với mỗi skill intert vào bảng CVSkill
                    AddDataCVSkill(skilId, cvId);
                }
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    // Thêm data vào bảng CVSkill
    public boolean AddDataCVSkill(int skillId, int cvId) {
        String sql = "INSERT INTO CVSkill (SkillId, CVId) VALUES\n"
                + "(?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, skillId);
            ps.setInt(2, cvId);
            
            int result = ps.executeUpdate();
            if(result == 1){
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    //Lấy ra CV mới nhất được insert vào
    public int getCVId() {
        String sql = "select TOP 1 c.CVId from CV c order by c.CVId desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int cvId = rs.getInt(1);
                return cvId;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }
    
    public static void main(String[] args) {
        CVDAO cvdao = new CVDAO();
        CV c = new CV();
        c.setAvatar("abc.jpg");
        c.setAddress("HN");
        c.setDob(java.sql.Date.valueOf(LocalDate.now()));
        c.setFullName("abc");
        c.setAchievementDescription("hgdhdkd");
        c.setProfession("iroreu");
        c.setServiceDescription("údfiuu");
        c.setSex(true);
        c.setgMail("abc.com");
        c.setgMailMentor("michael.brown@gmail.com");
        c.setUserName("hihi");
        c.setProfessionIntro("Intro");
        c.setSkills(new int[]{2, 5});
        cvdao.addCV(c);
    }
}
