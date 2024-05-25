/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.CV;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
    public boolean updateCV(CV cv, int cvId) {
        String sql = "UPDATE [dbo].[CV] \n"
                + "   SET [mentor_name] = ?,\n"
                + "       [gmail] = ?,\n"
                + "       [full_name] = ?,\n"
                + "       [dob] = ?,\n"
                + "       [sex] = ?,\n"
                + "       [address] = ?,\n"
                + "       [profession] = ?,\n"
                + "       [profession_intro] = ?,\n"
                + "       [achievement_description] = ?,\n"
                + "       [service_description] = ?,\n"
                + "       [avatar] = ?\n"
                + " WHERE [cv_id] = ?;";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cv.getUserName());
            ps.setString(2, cv.getGmail());
            ps.setString(3, cv.getFullName());
            ps.setDate(4, cv.getDob());
            ps.setBoolean(5, cv.isSex());
            ps.setString(6, cv.getAddress());
            ps.setString(7, cv.getProfession());
            ps.setString(8, cv.getProfessionIntro());
            ps.setString(9, cv.getAchievementDescription());
            ps.setString(10, cv.getServiceDescription());
            ps.setString(11, cv.getImgcv());
            ps.setInt(12, cvId);
            int result = ps.executeUpdate();
            if (result == 1) {
                if (removeCVSkills(cvId)) {
                    for (int skilId : cv.getSkills()) { //với mỗi skill intert vào bảng CVSkill
                        AddDataCVSkill(skilId, cvId);
                    }
                    return true;
                } else {
                    throw new SQLException("Can't remove CVSkills");
                }
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
        String sql = "INSERT INTO CV (mentor_name, gmail, full_name, dob, sex, [address], profession, profession_intro, achievement_description, service_description, avatar) VALUES"
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cv.getUserName());
            ps.setString(2, cv.getGmail());
            ps.setString(3, cv.getFullName());
            ps.setDate(4, cv.getDob());
            ps.setBoolean(5, cv.isSex());
            ps.setString(6, cv.getAddress());
            ps.setString(7, cv.getProfession());
            ps.setString(8, cv.getProfessionIntro());
            ps.setString(9, cv.getAchievementDescription());
            ps.setString(10, cv.getServiceDescription());
            ps.setString(11, cv.getImgcv());

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

    public static void main(String[] args) {
        CVDAO cvdao = new CVDAO();
        CV c = new CV();
//        c.setAddress("HN");
//        //c.setDob(java.sql.Date.valueOf(LocalDate.now()));
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
        c = cvdao.getCVByUserName("user2");
        System.out.println(c.getSkills()[0] +" "+c.getImgcv());
    }
    public CV getCVByUserName(String userName) {
        String sql = "select * from CV c where c.mentor_name = ?";
        CV cv = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                int cvId = rs.getInt(1);
                String username = rs.getString(2);
                String gmail = rs.getString(3);
                String fullname = rs.getString(4);
                Date dob = rs.getDate(5);
                boolean sex = rs.getBoolean(6);
                String address = rs.getString(7);
                String profession = rs.getString(8);
                String professionIntro = rs.getString(9);
                String achievementDescription = rs.getString(10);
                String serviceDescription = rs.getString(11);
                String avatar = rs.getString(12);
                int[] skills = getSkillsByCvId(cvId);
                cv = new CV(cvId, username, gmail, fullname, dob, sex, address, profession, professionIntro, achievementDescription, serviceDescription, skills, avatar);
                return cv;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cv;
    }

    public int[] getSkillsByCvId(int cvId) {
        String sql = "SELECT skill_id FROM CVSkills WHERE cv_id = ?";
        List<Integer> skillsList = new ArrayList<>();

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cvId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int skillId = rs.getInt("skill_id");
                skillsList.add(skillId);
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }

        // Convert the List to an array
        int[] skillsArray = new int[skillsList.size()];
        for (int i = 0; i < skillsList.size(); i++) {
            skillsArray[i] = skillsList.get(i);
        }

        return skillsArray;
    }

}
