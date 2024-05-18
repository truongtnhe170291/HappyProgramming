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

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public CVDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            System.out.println("Error at connection!!!");
        }
    }

    // update cv đã có
    public boolean updateCV(CV cv) {
        String sql = "UPDATE [dbo].[CV] \n"
                + "   SET [mentor_name] = ?,\n"
                + "       [gmail] = ?,\n"
                + "       [full_name] = ?,\n"
                + "       [dob] = ?,\n"
                + "       [sex] = ?,\n"
                + "       [address] = ?,\n"
                + "       [avatar] = ?,\n"
                + "       [profession] = ?,\n"
                + "       [profession_intro] = ?,\n"
                + "       [achievement_description] = ?,\n"
                + "       [service_description] = ?\n"
                + " WHERE [cv_id] = ?;";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cv.getUserName());
            ps.setString(2, cv.getGmail());
            ps.setString(3, cv.getFullName());
            ps.setDate(4, cv.getDob());
            ps.setBoolean(5, cv.isSex());
            ps.setString(6, cv.getAddress());
            ps.setString(7, cv.getAvatar());
            ps.setString(8, cv.getProfession());
            ps.setString(9, cv.getProfessionIntro());
            ps.setString(10, cv.getAchievementDescription());
            ps.setString(11, cv.getServiceDescription());
            ps.setInt(12, cv.getCvId());
            int result = ps.executeUpdate();
            if (result == 1) {
                if (removeCVSkills(cv.getCvId())) {
                    for (int skilId : cv.getSkills()) { //với mỗi skill intert vào bảng CVSkill
                        AddDataCVSkill(skilId, cv.getCvId());
                    }
                    return true;
                }
                else
                    throw new SQLException("Can't remove CVSkills");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    // Xóa Các skill của CV
    public boolean removeCVSkills(int cv_id) {
        String sql = "DELETE FROM [dbo].[CVSkills]\n"
                + "      WHERE [CVSkills].cv_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cv_id);
            int result = ps.executeUpdate();
            if (result >= 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    // Thêm CV vào database 
    public boolean addCV(CV cv) {
        String sql = "INSERT INTO CV (mentor_name, gmail, full_name, dob, sex, [address], avatar, profession, profession_intro, achievement_description, service_description) VALUES\n"
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cv.getUserName());
            ps.setString(2, cv.getGmail());
            ps.setString(3, cv.getFullName());
            ps.setDate(4, cv.getDob());
            ps.setBoolean(5, cv.isSex());
            ps.setString(6, cv.getAddress());
            ps.setString(7, cv.getAvatar());
            ps.setString(8, cv.getProfession());
            ps.setString(9, cv.getProfessionIntro());
            ps.setString(10, cv.getAchievementDescription());
            ps.setString(11, cv.getServiceDescription());

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
        String sql = "INSERT INTO CVSkills (skill_id, cv_id) VALUES\n"
                + "(?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, skillId);
            ps.setInt(2, cvId);

            int result = ps.executeUpdate();
            if (result == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    //Lấy ra CV mới nhất được insert vào
    public int getCVId() {
        String sql = "select TOP 1 c.cv_id from CV c order by c.cv_id desc";
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

//    public static void main(String[] args) {
//        CVDAO cvdao = new CVDAO();
//        CV c = new CV();
//        c.setAvatar("abc.jpg");
//        c.setAddress("HN");
//        c.setDob(java.sql.Date.valueOf(LocalDate.now()));
//        c.setFullName("abc");
//        c.setAchievementDescription("hgdhdkd");
//        c.setProfession("iroreu");
//        c.setServiceDescription("údfiuu");
//        c.setSex(true);
//        c.setGmail("abc.com");
//        c.setUserName("fge");
//        c.setProfessionIntro("Intro");
//        c.setSkills(new int[]{2, 5});
//        c.setCvId(1);
//        if(cvdao.addCV(c)){
//            System.out.println("OK");
//        }else{
//            System.out.println("Not OK");
//        }
        //cvdao.updateCV(c);
  //  }
}
