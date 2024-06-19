/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Mentor;
import models.Request;
import models.RequestDTO;
import models.SchedulePublic;
import models.Skill;
import models.StaticMentee;
import models.Status;

public class RequestDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public RequestDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            System.out.println(e);
        }
    }

//    public List<RequestDTO> getAllRequests(String menteeName) throws SQLException {
//        // Tạo câu truy vấn SQL mới
//        String sql = "SELECT rfm.request_id, rfm.mentor_name,rfm.mentee_name ,rfm.title,rfm.status_id ,rfm.description, rfm.deadline_date, rfm.deadline_hour, ss.day_of_slot, ss.slot_id, s.slot_name, c.start_time, c.end_time, STRING_AGG(sk.skill_name, ', ') AS skills FROM RequestsFormMentee rfm JOIN RquestSelectedSlot rss ON rfm.request_id = rss.request_id JOIN Selected_Slot ss ON rss.selected_id = ss.selected_id JOIN Status_Selected s_s ON s_s.status_id = ss.status_id JOIN Cycle c ON c.cycle_id = ss.cycle_id JOIN Slots s ON s.slot_id = ss.slot_id JOIN RequestSkills rs ON rfm.request_id = rs.request_id JOIN Skills sk ON rs.skill_id = sk.skill_id where rfm.status_id = 1 and rfm.mentee_name = ? GROUP BY rfm.request_id, rfm.mentor_name, rfm.mentee_name, rfm.deadline_date, rfm.deadline_hour, rfm.title, rfm.description, rfm.status_id, ss.day_of_slot, ss.slot_id, s.slot_name, c.start_time, c.end_time";
//
//        // Chuẩn bị câu truy vấn SQL
//        PreparedStatement ps = con.prepareStatement(sql);
//        ps.setString(1, menteeName); // Đặt giá trị cho tham số trong câu truy vấn SQL
//
//        // Thực hiện câu truy vấn và lấy kết quả
//        ResultSet rs = ps.executeQuery();
//
//        // Tạo danh sách để lưu trữ thông tin của các request
//        List<RequestDTO> requests = new ArrayList<>();
//        while (rs.next()) {
//            // Tạo một đối tượng RequestDTO mới và đặt các thuộc tính cho nó
//            LocalDate dayOfSlot = rs.getDate("day_of_slot").toLocalDate();
//            LocalDate startTime = rs.getDate("start_time").toLocalDate();
//            LocalDate endTime = rs.getDate("end_time").toLocalDate();
//            String slotName = rs.getString("slot_name");
//            String slotID = rs.getString("slot_id");
//            int requestId = rs.getInt("request_id");
//            String mentorName = rs.getString("mentor_name");
//            String menteeName1 = rs.getString("mentee_name");
//            LocalDate deadlineDate = rs.getDate("deadline_date").toLocalDate();
//            String title = rs.getString("title");
//            String description = rs.getString("description");
//            int statusId = rs.getInt("status_id");
//            LocalTime deadlineHour = rs.getTime("deadline_hour").toLocalTime();
//            List<Skill> skills = fetchRequestSkills(requestId, con);
//
//            RequestDTO request = new RequestDTO(dayOfSlot, startTime, endTime, slotName, slotID, skills, requestId, mentorName, menteeName1, deadlineDate, title, description, statusId, deadlineHour);
//
//            // Thêm request vào danh sách
//            requests.add(request);
//        }
//
//        // Trả về danh sách request
//        return requests;
//    }
    public List<RequestDTO> getRequestOfMenteeInDeadlineByStatus(String menteeName) throws SQLException {
        List<RequestDTO> requests = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = " SELECT *\n"
                    + "                    FROM RequestsFormMentee r\n"
                    + "                    WHERE r.mentee_name = ?\n"
                    + "		     order by [deadline_date] DESC";
            ps = con.prepareStatement(sql);
            ps.setString(1, menteeName);
            rs = ps.executeQuery();

            while (rs.next()) {
                RequestDTO request = new RequestDTO();
                request.setRequestId(rs.getInt("request_id"));
                request.setMentorName(rs.getString("mentor_name"));
                request.setMenteeName(rs.getString("mentee_name"));
                request.setDeadlineDate(rs.getDate("deadline_date").toLocalDate());
                request.setDeadlineHour(rs.getTime("deadline_hour").toLocalTime());
                request.setDescription(rs.getString("description"));
                request.setTitle(rs.getString("title"));
                request.setPrice(rs.getInt("price"));
                request.setNote(rs.getString("note"));

                // Fetch status using fetchStatusById method
                int statusId = rs.getInt("status_id");
                Status status = fetchStatusById(statusId, con);
                request.setStatus(status);

                requests.add(request);
            }

            for (RequestDTO requ : requests) {
                List<Skill> skills = fetchRequestSkills(requ.getRequestId(), con);
                requ.setListSkills(skills);
                ScheduleDAO scheduleDAO = new ScheduleDAO();
                List<SchedulePublic> listSchedule = scheduleDAO.getScheduleByRequestId(requ.getRequestId());
                requ.setListSchedule(listSchedule);
            }
        } catch (SQLException e) {
            System.out.println("getRequestOfMenteeInDeadlineByStatus: " + e.getMessage());
        }

        return requests;
    }

    public List<SchedulePublic> getScheduleByMenteeName(String menteeName) {
        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "select * from Selected_Slot ss "
                    + "join RquestSelectedSlot rs on rs.selected_id = ss.selected_id "
                    + "join Cycle c on ss.cycle_id = c.cycle_id "
                    + "join Slots s on s.slot_id = ss.slot_id "
                    + "join RequestsFormMentee rfm on rs.request_id = rfm.request_id "
                    + "where rfm.mentee_name = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, menteeName);
            rs = ps.executeQuery();
            while (rs.next()) {
                SchedulePublic schedule = new SchedulePublic();
                schedule.setSelectedId(rs.getInt("selected_id"));
                schedule.setMentorName(rs.getString("mentor_name"));
                schedule.setSlotId(rs.getString("slot_id"));
                schedule.setDayOfSlot(rs.getDate("day_of_slot"));
                schedule.setStartTime(rs.getDate("start_time"));
                schedule.setEndTime(rs.getDate("end_time"));
                schedule.setSlot_name(rs.getString("slot_name"));
                DayOfWeek nameOfDay = schedule.getDayOfSlot().toLocalDate().getDayOfWeek();
                schedule.setNameOfDay(nameOfDay);
                list.add(schedule);
            }
        } catch (SQLException e) {
            System.out.println("getScheduleByMenteeName: " + e.getMessage());
        }
        return list;
    }

    public List<RequestDTO> getRequestsByMenteeStatusMentorTime(String menteeName, Integer statusId, String mentorName, LocalDate startTime, LocalDate endTime) throws SQLException {
        List<RequestDTO> requests = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM [RequestsFormMentee] WHERE mentee_name = ?");
            if (statusId != null && statusId != -1) {
                sqlBuilder.append(" AND status_id = ?");
            }
            if (mentorName != null && !mentorName.isEmpty()) {
                sqlBuilder.append(" AND mentor_name = ?");
            }
            if (startTime != null) {
                sqlBuilder.append(" AND deadline_date >= ?");
            }
            if (endTime != null) {
                sqlBuilder.append(" AND deadline_date <= ?");
            }

            ps = con.prepareStatement(sqlBuilder.toString());
            int paramIndex = 1;
            ps.setString(paramIndex++, menteeName);

            if (statusId != null && statusId != -1) {
                ps.setInt(paramIndex++, statusId);
            }
            if (mentorName != null && !mentorName.isEmpty()) {
                ps.setString(paramIndex++, mentorName);
            }
            if (startTime != null) {
                ps.setDate(paramIndex++, java.sql.Date.valueOf(startTime));
            }
            if (endTime != null) {
                ps.setDate(paramIndex++, java.sql.Date.valueOf(endTime));
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                RequestDTO request = new RequestDTO();
                request.setRequestId(rs.getInt("request_id"));
                request.setMentorName(rs.getString("mentor_name"));
                request.setMenteeName(rs.getString("mentee_name"));
                request.setDeadlineDate(rs.getDate("deadline_date").toLocalDate());
                request.setDeadlineHour(rs.getTime("deadline_hour").toLocalTime());
                request.setDescription(rs.getString("description"));
                request.setTitle(rs.getString("title"));
                request.setPrice(rs.getInt("price"));
                request.setNote(rs.getString("note"));

                Status status = fetchStatusById(statusId, con);
                request.setStatus(status);

                requests.add(request);
            }

            for (RequestDTO requ : requests) {
                List<Skill> skills = fetchRequestSkills(requ.getRequestId(), con);
                requ.setListSkills(skills);
                ScheduleDAO scheduleDAO = new ScheduleDAO();
                List<SchedulePublic> listSchedule = scheduleDAO.getScheduleByRequestId(requ.getRequestId());
                requ.setListSchedule(listSchedule);
            }
        } catch (SQLException e) {
            System.out.println("getRequestsByMenteeAndStatus: " + e.getMessage());
        }

        return requests;
    }

    public void updateExpiredRequestsStatus() throws SQLException {
        PreparedStatement ps = null;
        try {
            String sql = "UPDATE [HappyProgrammingDB].[dbo].[RequestsFormMentee] "
                    + "SET status_id = 4 "
                    + "WHERE deadline_date < CAST(GETDATE() AS DATE) "
                    + "AND status_id IN (2, 5)";
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateExpiredRequestsStatus: " + e.getMessage());
        }
    }

    public StaticMentee getStaticRequest(String menteeName) {
        String sql = "SELECT COUNT(DISTINCT request_id) AS TotalRequests, "
                + "SUM(DATEDIFF(HOUR, '00:00:00', deadline_hour)) AS TotalHour, "
                + "COUNT(DISTINCT mentor_name) AS TotalMentors "
                + "FROM [HappyProgrammingDB].[dbo].[RequestsFormMentee] where mentee_name = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, menteeName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int totalRequest = rs.getInt("TotalRequests");
                int totalHour = rs.getInt("TotalHour");
                int totalMentor = rs.getInt("TotalMentors");
                return new StaticMentee(totalRequest, totalHour, totalMentor);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Mentor> getMentorByRequest(String menteeName) throws SQLException {
        List<Mentor> mentors = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT DISTINCT mentor_name FROM RequestsFormMentee WHERE mentee_name = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, menteeName);
            rs = ps.executeQuery();

            while (rs.next()) {
                String mentorName = rs.getString("mentor_name");
                Mentor mentor = new Mentor(mentorName);
                mentors.add(mentor);
            }
        } catch (SQLException e) {
            System.out.println("getMentorByRequest: " + e.getMessage());
        }
        return mentors;
    }

    public List<Status> getAllStatuses() throws SQLException {
        List<Status> statuses = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM RequestStatuses";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Status status = new Status(
                        rs.getInt("status_id"),
                        rs.getString("status_name")
                );
                statuses.add(status);
            }
        } catch (SQLException e) {
            System.out.println("getAllStatuses: " + e.getMessage());
        }

        return statuses;
    }

    public List<RequestDTO> getRequestList(String menteeName) {
        String sql = "SELECT request_id, mentor_name, title, deadline_date, deadline_hour "
                + "FROM RequestsFormMentee rfm "
                + "WHERE [mentee_name] = ?";
        List<RequestDTO> requestList = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, menteeName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int requestId = rs.getInt("request_id");
                String mentorName = rs.getString("mentor_name");
                String title = rs.getString("title");
                LocalDate deadlineDate = rs.getDate("deadline_date").toLocalDate();
                LocalTime deadlineHour = rs.getTime("deadline_hour").toLocalTime();
                List<Skill> listSkills = fetchRequestSkills(requestId, con);
                requestList.add(new RequestDTO(listSkills, mentorName, deadlineDate, title, deadlineHour));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return requestList;
    }

    public List<RequestDTO> getRequestOfMentorInDeadlineByStatus(String mentorName) throws SQLException {
        List<RequestDTO> requests = new ArrayList<>();
        try {
            String sql = "SELECT r.*, rs.status_name \n"
                    + "FROM RequestsFormMentee r \n"
                    + "JOIN RequestStatuses rs ON r.status_id = rs.status_id \n"
                    + "WHERE r.mentor_name = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, mentorName);
            rs = ps.executeQuery();
            while (rs.next()) {
                RequestDTO request = new RequestDTO();
                request.setRequestId(rs.getInt("request_id"));
                request.setMentorName(rs.getString("mentor_name"));
                request.setMenteeName(rs.getString("mentee_name"));
                request.setDeadlineDate(rs.getDate("deadline_date").toLocalDate());
                request.setDeadlineHour(rs.getTime("deadline_hour").toLocalTime());
                request.setDescription(rs.getString("description"));
                request.setTitle(rs.getString("title"));

                int status_id = rs.getInt("status_id");
                String status_name = rs.getString("status_name");
                Status status = new Status(status_id, status_name);
                request.setStatus(status);

                requests.add(request);
            }
            if (requests.isEmpty()) {
                return requests;
            }
            for (RequestDTO requ : requests) {
                List<Skill> skills = fetchRequestSkills(requ.getRequestId(), con);
                requ.setListSkills(skills);
                ScheduleDAO scheduleDAO = new ScheduleDAO();
                List<SchedulePublic> listSchedule = scheduleDAO.getScheduleByRequestId(requ.getRequestId());
                requ.setListSchedule(listSchedule);
            }

        } catch (SQLException e) {
            System.out.println("getRequestOfMentorInDeadlineByStatus: " + e.getMessage());
        }

        return requests;
    }

    public int getRequestId() {
        String sql = "select TOP 1 r.request_id from RequestsFormMentee r order by r.request_id desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int req = rs.getInt(1);
                return req;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;

    }

    public int insertRequestReturnRequestId(Request request) {
        String query = "INSERT INTO RequestsFormMentee (mentor_name, mentee_name, deadline_date, deadline_hour, title, [description], status_id, price)"
                + "VALUES"
                + " (?,?,?,?,?,?,?,?)";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, request.getMentorName());
            ps.setString(2, request.getMenteeName());
            ps.setDate(3, Date.valueOf(request.getDeadlineDate()));
            ps.setTime(4, Time.valueOf(request.getDeadlineHour()));
            ps.setString(5, request.getTitle());
            ps.setString(6, request.getDescription());
            ps.setInt(7, request.getStatusId());
            ps.setInt(8, request.getPrice());

            int result = ps.executeUpdate();

            if (result == 1) {
                int requestId = getRequestId();
                if (requestId != 0) {
                    return requestId;
                }
//                for (Integer skill : skills) {
//                    insertRequestSkills(requestId, skill);
//                }
//
//                for (Integer selectedId : listSelectSlot) {
//                    insertRquestSelectedSlot(requestId, selectedId);
//                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return 0;
    }

    private List<Skill> fetchRequestSkills(int requestId, Connection con) throws SQLException {
        // Tạo câu truy vấn SQL để lấy thông tin từ bảng RequestSkills và Skills
        String sql = "SELECT s.* FROM RequestSkills rs JOIN Skills s ON rs.skill_id = s.skill_id WHERE request_id = ?";

        // Chuẩn bị câu truy vấn SQL
        ps = con.prepareStatement(sql);
        ps.setInt(1, requestId); // Đặt giá trị cho tham số trong câu truy vấn SQL

        // Thực hiện câu truy vấn và lấy kết quả
        rs = ps.executeQuery();

        // Tạo danh sách để lưu trữ thông tin của các kỹ năng
        List<Skill> skills = new ArrayList<>();
        while (rs.next()) {
            // Tạo một đối tượng Skill mới và đặt các thuộc tính cho nó
            Skill skill = new Skill(rs.getInt("skill_id"), rs.getString("skill_name"));
            skills.add(skill);
        }

        // Trả về danh sách kỹ năng
        return skills;
    }

    public Status fetchStatusByName(String statusName) throws SQLException {
        Status status = null;
        String sql = "SELECT * FROM Status_Selected WHERE status_name = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, statusName);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    status = new Status(rs.getInt("status_id"), rs.getString("status_name"));
                }
            }
        }
        return status;
    }

    public Status fetchStatusById(int statusId, Connection con) throws SQLException {
        // Tạo câu truy vấn SQL để lấy thông tin từ bảng RequestStatuses
        String sql = "SELECT * FROM RequestStatuses WHERE status_id = ?";

        // Chuẩn bị câu truy vấn SQL
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, statusId); // Đặt giá trị cho tham số trong câu truy vấn SQL

            // Thực hiện câu truy vấn và lấy kết quả
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Tạo một đối tượng Status mới và đặt các thuộc tính cho nó
                    return new Status(rs.getInt("status_id"), rs.getString("status_name"));
                } else {
                    return null; // Hoặc có thể ném ra ngoại lệ nếu không tìm thấy
                }
            }
        }
    }

    public void insertRquestSelectedSlot(int requestId, int selectedId) {
        try {
            String sql = "INSERT INTO RquestSelectedSlot(request_id, selected_id)"
                    + "VALUES"
                    + "(?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestId);
            ps.setInt(2, selectedId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public boolean insertRequestSkills(int requestId, int skillId) {
        try {
            String query = "INSERT INTO [dbo].[RequestSkills]"
                    + "           ([skill_id]"
                    + "           ,[request_id])"
                    + "     VALUES"
                    + "           (?"
                    + "           ,?)";
            ps = con.prepareStatement(query);

            ps.setInt(1, skillId);
            ps.setInt(2, requestId);
            int result = ps.executeUpdate();
            if(result == 1){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteRequest(int requestId) {
        try {

            String sql = "DELETE FROM [RequestSkills] WHERE [request_id] = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestId);
            int result1 = ps.executeUpdate();

            sql = "DELETE FROM [RquestSelectedSlot] WHERE [request_id] = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestId);
            int result2 = ps.executeUpdate();

            sql = "DELETE FROM [dbo].[RequestsFormMentee] WHERE request_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestId);
            int result3 = ps.executeUpdate();
            
            if(result1 >=1 && result2 >=1 && result3>=1){
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean updateStatus(int requestId, int statusId) {
        String sql = "UPDATE RequestsFormMentee SET status_id = ? WHERE request_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, statusId);
            ps.setInt(2, requestId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.out.println("updateStatus " + e.getMessage());
        }
        return false;
    }

    public void checkAndUpdateOverdueStatus() throws SQLException {
        String sql = "UPDATE RequestsFormMentee "
                + "SET status_id = 4 "
                + "WHERE CONVERT(DATETIME, deadline_date) + CAST(deadline_hour AS DATETIME) < GETDATE() "
                + "AND status_id != 4";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.executeUpdate();
        }
    }

    public Request getRequestById(int requestId) {
        try {
            String sql = "select * from RequestsFormMentee r where r.request_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Request r = new Request();
                r.setRequestId(rs.getInt(1));
                r.setMentorName(rs.getString(2));
                r.setMenteeName(rs.getString(3));
                r.setDeadlineDate(rs.getDate(4).toLocalDate());
                r.setDeadlineHour(rs.getTime(5).toLocalTime());
                r.setTitle(rs.getString(6));
                r.setDescription(rs.getString(7));
                r.setStatusId(rs.getInt(8));
                r.setPrice(rs.getInt(9));
                r.setNote(rs.getString(10));
                return r;
            }
        } catch (SQLException e) {
            System.out.println("getRequestById  " + e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) throws SQLException {
        RequestDAO rdao = new RequestDAO();
        List<RequestDTO> rList = rdao.getRequestOfMentorInDeadlineByStatus("son");
        for (RequestDTO rq : rList) {
            System.out.println(rq);

        }

//        List<RequestDTO> rList = rdao.getRequestsByMenteeAndStatus("hieu",3);
//        for (RequestDTO rq : rList) {
//            System.out.println(rq);
//
//        }
//        List<Mentor> mList = rdao.getMentorByRequest("truong");
//        System.out.println(mList);
    }

    public Request getRequestByStatusSaved(String menteeName, String mentorName) {
        try {
            String sql = "select r.* from RequestsFormMentee r join Cycle c on r.mentor_name = c.mentor_name where r.status_id = 6 and r.mentee_name = ? and r.mentor_name = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, menteeName);
            ps.setString(2, mentorName);
            rs = ps.executeQuery();
            while(rs.next()){
                Request r = new Request();
                r.setRequestId(rs.getInt(1));
                r.setMentorName(rs.getString(2));
                r.setMenteeName(rs.getString(3));
                r.setDeadlineDate(rs.getDate(4).toLocalDate());
                r.setDeadlineHour(rs.getTime(5).toLocalTime());
                r.setTitle(rs.getString(6));
                r.setDescription(rs.getString(7));
                r.setStatusId(rs.getInt(8));
                r.setPrice(rs.getInt(9));
                r.setNote(rs.getString(10));
                return r;
            }
            
        } catch (SQLException e) {
            System.out.println("getRequestByStatusSaved " +e.getMessage());
        }
        return null;
    }

}
