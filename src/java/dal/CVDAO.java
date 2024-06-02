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
import models.Mentor;
import models.Skill;

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
        String sql = "UPDATE [dbo].[CV]\n"
                + "   SET [mentor_name] = ?\n"
                + "      ,[gmail] = ?\n"
                + "      ,[full_name] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[sex] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[profession] = ?\n"
                + "      ,[profession_intro] = ?\n"
                + "      ,[achievement_description] = ?\n"
                + "      ,[service_description] = ?\n"
                + "      ,[avatar] = ?\n"
                + "      ,[status_id] = ?"
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
            ps.setInt(12, cv.getStattusId());
            ps.setInt(13, cvId);
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
        String sql = "INSERT INTO CV (mentor_name,gmail, full_name, dob, sex, [address], profession, profession_intro, achievement_description, service_description, avatar, status_id) \n"
                + "VALUES"
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
            ps.setNull(12, cv.getStattusId());
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

    public boolean updateStatusCV(String username, int statusid) {
        String sql = "UPDATE [dbo].[CV] SET [status_id] = ? WHERE [mentor_name] = ?;";
        try {
            ps.setInt(1, statusid);
            ps.setString(2, username);
            int result = ps.executeUpdate();
            if (result == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
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
        c = cvdao.getCVByCVId(2);
        System.out.println(c.getAddress());
    }

    public CV getCVByCVId(int cvId) {
        try {
            String sql = "select * from CV c WHERE cv_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, cvId);
            rs = ps.executeQuery();
            while (rs.next()) {
                CV cv = new CV();
                cv.setCvId(cvId);
                cv.setUserName(rs.getString("mentor_name"));
                cv.setAddress(rs.getString("address"));
                cv.setGmail(rs.getString("gmail"));
                cv.setFullName(rs.getString("full_name"));
                cv.setDob(rs.getDate("dob"));
                cv.setSex(rs.getBoolean("sex"));
                cv.setProfession(rs.getString("profession"));
                cv.setProfessionIntro(rs.getString("profession_intro"));
                cv.setAchievementDescription(rs.getString("achievement_description"));
                cv.setServiceDescription(rs.getString("service_description"));
                cv.setImgcv(rs.getString("avatar"));
                cv.setStattusId(rs.getInt("status_id"));
                cv.setSkills(getSkillsByCvId(cvId));
                return cv;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return null;
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
                int statusId = rs.getInt(13);
                int[] skills = getSkillsByCvId(cvId);
                cv = new CV(cvId, username, gmail, fullname, dob, sex, address, profession, professionIntro, achievementDescription, serviceDescription, skills, avatar, statusId);
                return cv;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
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

    public List<CV> getCVByStatus(int status) {
        String sql = "SELECT [cv_id]\n"
                + "      ,[mentor_name]\n"
                + "      ,[status_id]\n"
                + "  FROM [HappyProgrammingDB].[dbo].[CV]\n"
                + "  WHERE status_id = ?";
        List<CV> cvList = new ArrayList<>();
        CV cv = new CV();

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, status);

            rs = ps.executeQuery();
            while (rs.next()) {
                cv = new CV();
                cv.setCvId(rs.getInt("cv_id"));
                cv.setFullName(rs.getString("mentor_name"));
                cv.setUserName(rs.getString("mentor_name"));
                cv.setStattusId(rs.getInt("status_id"));
                cvList.add(cv);
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return cvList;
    }

    public boolean changeCVStatus(int cvId, int status) {
        String sql = "UPDATE [dbo].[CV]\n"
                + "   SET \n"
                + "      [status_id] = ?\n"
                + " WHERE [cv_id] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, cvId);

            int row = ps.executeUpdate();
            if (row != 1) {
                return false;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return true;

    }

    public CV getCVById(int cv_Id) {
        String sql = "SELECT [cv_id]\n"
                + "      ,[mentor_name]\n"
                + "      ,[gmail]\n"
                + "      ,[full_name]\n"
                + "      ,[dob]\n"
                + "      ,[sex]\n"
                + "      ,[address]\n"
                + "      ,[profession]\n"
                + "      ,[profession_intro]\n"
                + "      ,[achievement_description]\n"
                + "      ,[service_description]\n"
                + "      ,[avatar]\n"
                + "      ,[status_id]\n"
                + "  FROM [dbo].[CV]\n"
                + "  WHERE [cv_id] = ?";
        CV cv = new CV();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cv_Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                cv.setCvId(rs.getInt("cv_id"));
                cv.setUserName(rs.getString("mentor_name"));
                cv.setGmail(rs.getString("gmail"));
                cv.setFullName(rs.getString("full_name"));
                cv.setDob(rs.getDate("dob"));
                cv.setSex(rs.getBoolean("sex"));
                cv.setAddress(rs.getString("address"));
                cv.setProfession(rs.getString("profession"));
                cv.setProfessionIntro(rs.getString("profession_intro"));
                cv.setAchievementDescription(rs.getString("achievement_description"));
                cv.setServiceDescription(rs.getString("service_description"));
                cv.setImgcv(rs.getString("avatar"));
                cv.setStattusId(rs.getInt("status_id"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cv;
    }

    public List<Skill> getSkillsByCVId(int cvId) {
        String sql = "SELECT s.[skill_id], s.[skill_name], s.[description] FROM CVSkills cs JOIN Skills s ON cs.skill_id = s.skill_id\n"
                + "Where cs.cv_id = ?";
        List<Skill> skills = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cvId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Skill s = new Skill();
                s.setSkillID(rs.getInt("skill_id"));
                s.setSkillName(rs.getString("skill_name"));
                s.setDescription(rs.getString("description"));
                skills.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return skills;
    }

}
