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
import models.CVDTO;
import models.Mentor;
import models.Skill;
import models.Status;

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
        String sql = "INSERT INTO CV (mentor_name,gmail, full_name, dob, sex, [address], profession, profession_intro, achievement_description, service_description, avatar, status_id) "
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

    public boolean updateStatusCV(int cvId, int statusid) {
        String sql = "UPDATE [dbo].[CV] SET [status_id] = ? WHERE [cv_id] = ?;";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, statusid);
            ps.setInt(2, cvId);
            int result = ps.executeUpdate();
            if (result == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Update status" + e.getMessage());
        }
        return false;
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
                int statusId = rs.getInt("status_id");
                cv.setStattusId(statusId);
                cv.setSkills(getSkillsByCvId(cvId));
                Status status = getStatusById(statusId);
                cv.setStatus(status);
                return cv;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return null;
    }
    
    public List<CVDTO> searchCVByMentorNameAndStatus(String mentorName, int statusId, int page, int pageSize) throws SQLException {
    int offset = (page - 1) * pageSize;
    String sql = "SELECT c.*, m.rate FROM CV c JOIN Mentors m ON c.mentor_name = m.mentor_name "
               + "WHERE m.mentor_name LIKE ? AND c.status_id = ? ORDER BY c.cv_id DESC OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
    List<CVDTO> cvList = new ArrayList<>();
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, "%" + mentorName + "%");
        ps.setInt(2, statusId);
        ps.setInt(3, offset);
        ps.setInt(4, pageSize);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                CVDTO cv = new CVDTO();
                cv.setCvId(rs.getInt("cv_id"));
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
                cv.setRate(rs.getInt("rate"));
                cv.setStattusId(rs.getInt("status_id"));
                cv.setNote(rs.getString("note"));
                cvList.add(cv);
            }
        } if (cvList.isEmpty()) {
                return cvList;
            }
            for (CVDTO cv : cvList) {
                cv.setStatus(getStatusById(cv.getStattusId()));
                cv.setListSkill(getSkillsByCVId(cv.getCvId()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cvList;
}

public int getTotalCVCountByMentorNameAndStatus(String mentorName, int statusId) throws SQLException {
    String sql = "SELECT COUNT(*) FROM CV WHERE mentor_name LIKE ? AND status_id = ?";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, "%" + mentorName + "%");
        ps.setInt(2, statusId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
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
                String note = rs.getString("note");
                int[] skills = getSkillsByCvId(cvId);
                Status status = getStatusById(statusId);
                cv = new CV(cvId, username, gmail, fullname, dob, sex, address, profession, professionIntro, achievementDescription, serviceDescription, skills, avatar, statusId, status);
                cv.setNote(note);
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

    public int getTotalCVCount() {
        String sql = "SELECT COUNT(*) FROM CV";
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int getTotalCVCountByMentorName(String mentorName) {
    String sql = "SELECT COUNT(*) FROM CV WHERE mentor_name = ?";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, mentorName);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}


    public int getTotalCVCountByStatus(int statusId) {
        String sql = "SELECT COUNT(*) FROM CV WHERE status_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, statusId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        CVDAO cvDao = new CVDAO();

        int totalCVs = cvDao.getTotalCVCountByStatus(1);
        System.out.println(totalCVs);
    }

    public List<CVDTO> getCVByStatus(int statusId, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT c.*, m.rate FROM CV c JOIN Mentors m ON c.mentor_name = m.mentor_name "
                + "WHERE c.status_id = ? ORDER BY c.cv_id DESC OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
        List<CVDTO> cvList = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, statusId);
            ps.setInt(2, offset);
            ps.setInt(3, pageSize);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CVDTO cv = new CVDTO();
                    cv.setCvId(rs.getInt("cv_id")); // Ensure the column names match your database schema
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
                    cv.setRate(rs.getInt("rate"));
                    cv.setStattusId(rs.getInt("status_id"));
                    cv.setNote(rs.getString("note"));
                    cvList.add(cv);
                }
            }
            if (cvList.isEmpty()) {
                return cvList;
            }
            for (CVDTO cv : cvList) {
                cv.setStatus(getStatusById(cv.getStattusId()));
                cv.setListSkill(getSkillsByCVId(cv.getCvId()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cvList;
    }
    
    public List<CVDTO> searchCVByMentorName(String mentorName, int page, int pageSize) throws SQLException {
    int offset = (page - 1) * pageSize;
    String sql = "SELECT c.*, m.rate FROM CV c JOIN Mentors m ON c.mentor_name = m.mentor_name "
               + "WHERE m.mentor_name LIKE ? ORDER BY c.cv_id DESC OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
    List<CVDTO> cvList = new ArrayList<>();
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, "%" + mentorName + "%");
        ps.setInt(2, offset);
        ps.setInt(3, pageSize);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                CVDTO cv = new CVDTO();
                cv.setCvId(rs.getInt("cv_id"));
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
                cv.setRate(rs.getInt("rate"));
                cv.setStattusId(rs.getInt("status_id"));
                cv.setNote(rs.getString("note"));
                cvList.add(cv);
            }
        } if (cvList.isEmpty()) {
                return cvList;
            }
            for (CVDTO cv : cvList) {
                cv.setStatus(getStatusById(cv.getStattusId()));
                cv.setListSkill(getSkillsByCVId(cv.getCvId()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cvList;
}


    public List<Status> getAllStatuses() {
        String sql = "select * from CVStatus";
        List<Status> statusList = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Status status = new Status();
                status.setStatusId(rs.getInt("status_id"));
                status.setStatusName(rs.getString("status_name"));
                statusList.add(status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return statusList;
    }

    public List<CVDTO> getAllCV(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT c.*, m.rate FROM CV c JOIN Mentors m ON c.mentor_name = m.mentor_name \n" +
"                ORDER BY c.cv_id DESC  OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
        List<CVDTO> cvList = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CVDTO cv = new CVDTO();
                    cv.setCvId(rs.getInt("cv_id")); // Ensure the column names match your database schema
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
                    cv.setRate(rs.getInt("rate"));
                    cv.setStattusId(rs.getInt("status_id"));
                    cv.setNote(rs.getString("note"));
                    cvList.add(cv);
                }
            }
            if (cvList.isEmpty()) {
                return cvList;
            }
            for (CVDTO cv : cvList) {
                cv.setStatus(getStatusById(cv.getStattusId()));
                cv.setListSkill(getSkillsByCVId(cv.getCvId()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return cvList;
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

    private Status getStatusById(int statusId) {
        String sql = "select * from CVStatus c where c.status_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, statusId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Status(statusId, rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean updateNoteCV(int cvId, String note) {
        try {
            String sql = "UPDATE [dbo].[CV]\n"
                    + "   SET \n"
                    + "      [note] = ?\n"
                    + " WHERE [cv_id] = ?";
            ps = con.prepareStatement(sql);
//            if (note != null) {
//                ps.setString(1, note);
//            }
//            else{
//                ps.setN
//            }
            ps.setString(1, note);
            ps.setInt(2, cvId);

            int row = ps.executeUpdate();
            if (row != 1) {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("setNoteCV: " + e.getMessage());
        }
        return true;
    }
}
