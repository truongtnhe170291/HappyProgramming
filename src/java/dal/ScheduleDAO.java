/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import models.AttendanceRecord;

import models.ScheduleDTO;
import models.ScheduleCommon;
import models.SchedulePublic;
import models.Status;

/**
 *
 * @author Admin
 */
public class ScheduleDAO {

    private Connection con;

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public ScheduleDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            System.out.println("Error at connection!!!");
        }
    }

    public List<ScheduleDTO> getAllRequestByMentorByStatus(int status, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT DISTINCT c.cycle_id, c.mentor_name, c.deadline_date, sta.status_name, c.start_time, c.end_time "
                + "FROM Selected_Slot ss "
                + "JOIN Cycle c ON ss.cycle_id = c.cycle_id "
                + "JOIN Slots s ON s.slot_id = ss.slot_id "
                + "JOIN Status_Selected sta ON sta.status_id = ss.status_id "
                + "WHERE ss.status_id = ? "
                + // Sửa đổi ở đây: Thêm khoảng trắng sau WHERE và trước ORDER BY
                "ORDER BY c.deadline_date DESC "
                + // Sửa đổi ở đây: Thêm khoảng trắng sau ORDER BY
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";  // Sửa đổi ở đây: Thêm từ khóa ROWS giữa NEXT và ONLY

        List<ScheduleDTO> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, offset);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ScheduleDTO(
                        rs.getString("mentor_name"),
                        rs.getDate("deadline_date"),
                        rs.getString("status_name"),
                        rs.getDate("start_time"),
                        rs.getDate("end_time"),
                        rs.getInt("cycle_id")));
            }
            for (ScheduleDTO s : list) {
                List<SchedulePublic> lists = getSlotDetail(s.getMentorName(), 1);
                s.setList(lists);
            }
        } catch (SQLException e) {
            System.out.println("getAllRequestByMentorByStatus: " + e.getMessage());
        }
        return list;
    }

    public List<ScheduleDTO> getAllRequestByMentor(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT DISTINCT c.cycle_id, c.mentor_name, c.deadline_date, sta.status_name, c.start_time, c.end_time "
                + "FROM Selected_Slot ss "
                + "JOIN Cycle c ON ss.cycle_id = c.cycle_id "
                + "JOIN Slots s ON s.slot_id = ss.slot_id "
                + "JOIN Status_Selected sta ON sta.status_id = ss.status_id "
                + " ORDER BY c.deadline_date DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        List<ScheduleDTO> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ScheduleDTO(
                        rs.getString("mentor_name"),
                        rs.getDate("deadline_date"),
                        rs.getString("status_name"),
                        rs.getDate("start_time"),
                        rs.getDate("end_time"),
                        rs.getInt("cycle_id")));
            }
            for (ScheduleDTO s : list) {
                List<SchedulePublic> lists = getSlotDetail(s.getMentorName(), 1);
                s.setList(lists);
            }
        } catch (SQLException e) {
            System.out.println("getAllRequestByMentor: " + e.getMessage());
        }
        return list;
    }

    public List<ScheduleDTO> searchRequestByMentorNameAndStatus(String mentorName, int statusId, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT DISTINCT c.cycle_id, c.mentor_name, c.deadline_date, sta.status_name, c.start_time, c.end_time "
                + "FROM Selected_Slot ss "
                + "JOIN Cycle c ON ss.cycle_id = c.cycle_id "
                + "JOIN Slots s ON s.slot_id = ss.slot_id "
                + "JOIN Status_Selected sta ON sta.status_id = ss.status_id "
                + "WHERE c.mentor_name LIKE ? AND ss.status_id = ? "
                + " ORDER BY c.deadline_date DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        List<ScheduleDTO> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + mentorName + "%"); // Using LIKE for partial matching
            ps.setInt(2, statusId);
            ps.setInt(3, offset);
            ps.setInt(4, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ScheduleDTO(
                        rs.getString("mentor_name"),
                        rs.getDate("deadline_date"),
                        rs.getString("status_name"),
                        rs.getDate("start_time"),
                        rs.getDate("end_time"),
                        rs.getInt("cycle_id")));
            }
            for (ScheduleDTO s : list) {
                List<SchedulePublic> lists = getSlotDetail(s.getMentorName(), 1);
                s.setList(lists);
            }
        } catch (SQLException e) {
            System.out.println("getAllRequestByMentor: " + e.getMessage());
        }
        return list;
    }

    public List<ScheduleDTO> getAllRequestByMentorName(String mentorName, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT DISTINCT c.cycle_id, c.mentor_name, c.deadline_date, sta.status_name, c.start_time, c.end_time "
                + "FROM Selected_Slot ss "
                + "JOIN Cycle c ON ss.cycle_id = c.cycle_id "
                + "JOIN Slots s ON s.slot_id = ss.slot_id "
                + "JOIN Status_Selected sta ON sta.status_id = ss.status_id "
                + "WHERE c.mentor_name LIKE ? "
                + " ORDER BY c.deadline_date DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        List<ScheduleDTO> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + mentorName + "%"); // Using LIKE for partial matching
            ps.setInt(2, offset);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ScheduleDTO(
                        rs.getString("mentor_name"),
                        rs.getDate("deadline_date"),
                        rs.getString("status_name"),
                        rs.getDate("start_time"),
                        rs.getDate("end_time"),
                        rs.getInt("cycle_id")));
            }
            for (ScheduleDTO s : list) {
                List<SchedulePublic> lists = getSlotDetail(s.getMentorName(), 1);
                s.setList(lists);
            }
        } catch (SQLException e) {
            System.out.println("getAllRequestByMentor: " + e.getMessage());
        }
        return list;
    }

    public int getTotalRequestByStatus(int status) {
        String sql = "SELECT COUNT(DISTINCT c.cycle_id) AS totalRequests "
                + "FROM Selected_Slot ss "
                + "JOIN Cycle c ON ss.cycle_id = c.cycle_id "
                + "JOIN Slots s ON s.slot_id = ss.slot_id "
                + "JOIN Status_Selected sta ON sta.status_id = ss.status_id "
                + "WHERE ss.status_id = ? )";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, status);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("totalRequests");
                }
            }
        } catch (SQLException e) {
            System.out.println("getTotalRequestByStatus: " + e.getMessage());
        }
        return 0;
    }

    public int getTotalRequestByMentorName(String mentorName) {
        String sql = "SELECT COUNT(DISTINCT c.cycle_id) AS totalRequests "
                + "FROM Selected_Slot ss "
                + "JOIN Cycle c ON ss.cycle_id = c.cycle_id "
                + "JOIN Slots s ON s.slot_id = ss.slot_id "
                + "JOIN Status_Selected sta ON sta.status_id = ss.status_id "
                + "WHERE c.mentor_name LIKE ? ";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + mentorName + "%");
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("totalRequests");
                }
            }
        } catch (SQLException e) {
            System.out.println("getTotalRequestByMentorName: " + e.getMessage());
        }
        return 0;
    }

    public int getTotalRequestByMentorNameAndStatus(String mentorName, int status) {
        String sql = "SELECT COUNT(DISTINCT c.cycle_id) AS totalRequests "
                + "FROM Selected_Slot ss "
                + "JOIN Cycle c ON ss.cycle_id = c.cycle_id "
                + "JOIN Slots s ON s.slot_id = ss.slot_id "
                + "JOIN Status_Selected sta ON sta.status_id = ss.status_id "
                + "WHERE c.mentor_name LIKE ? AND ss.status_id = ? ";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + mentorName + "%");
            ps.setInt(2, status);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("totalRequests");
                }
            }
        } catch (SQLException e) {
            System.out.println("getTotalRequestByMentorNameAndStatus: " + e.getMessage());
        }
        return 0;
    }

    public int getTotalRequests() {
        String sql = "SELECT COUNT(DISTINCT c.cycle_id) AS totalRequests "
                + "FROM Selected_Slot ss "
                + "JOIN Cycle c ON ss.cycle_id = c.cycle_id "
                + "JOIN Slots s ON s.slot_id = ss.slot_id "
                + "JOIN Status_Selected sta ON sta.status_id = ss.status_id ";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("totalRequests");
                }
            }
        } catch (SQLException e) {
            System.out.println("getTotalRequests: " + e.getMessage());
        }
        return 0;
    }

    public List<Status> getAllStatus() {
        List<Status> statusList = new ArrayList<>();
        String sql = "SELECT * FROM Status_Selected";

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Status status = new Status();
                status.setStatusId(rs.getInt("status_id"));
                status.setStatusName(rs.getString("status_name"));
                statusList.add(status);
            }
        } catch (SQLException e) {
            System.out.println("Error while fetching status list: " + e.getMessage());
        }

        return statusList;
    }

    public List<SchedulePublic> getSlotDetail(String mentorName, int statusId) {
        String sql = "SELECT * from "
                + "Selected_Slot ss join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id "
                + "  where c.mentor_name = ? and ss.status_id = ? and CAST(c.deadline_date AS DATE) > CAST(CURRENT_TIMESTAMP AS DATE) order by day_of_slot";
        List<SchedulePublic> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, mentorName);
            ps.setInt(2, statusId);
            rs = ps.executeQuery();
            while (rs.next()) {
                LocalDate dateLocal = LocalDate.parse(rs.getDate(4).toString());
                SchedulePublic schedule = new SchedulePublic(
                        rs.getString(10),
                        rs.getInt(1),
                        rs.getDate(4),
                        rs.getString(12),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getString(13),
                        rs.getString(4),
                        dateLocal.getDayOfWeek().toString());
                list.add(schedule);
            }
            for (SchedulePublic s : list) {
                s.setNameOfDay(s.getDayOfSlot().toLocalDate().getDayOfWeek());
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean approveRequest(int cycleId) {
        String sql = "UPDATE [dbo].[Selected_Slot] SET [status_id] = 2 WHERE cycle_id = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cycleId);
            int row = ps.executeUpdate();
            if (row != 1) {
                return false;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }

    public boolean rejectRequest(int cycleId, String rejectReason) {
        String updateSlotSql = "UPDATE [dbo].[Selected_Slot] SET [status_id] = 3 WHERE cycle_id = ?";
        String updateCycleSql = "UPDATE [dbo].[Cycle] SET [note] = ? WHERE cycle_id = ?";

        try {
            // Update status in Selected_Slot table
            PreparedStatement updateSlotPs = con.prepareStatement(updateSlotSql);
            updateSlotPs.setInt(1, cycleId);
            int slotRow = updateSlotPs.executeUpdate();
            if (slotRow != 1) {
                return false;
            }

            // Update note in Cycle table
            PreparedStatement updateCyclePs = con.prepareStatement(updateCycleSql);
            updateCyclePs.setString(1, rejectReason);
            updateCyclePs.setInt(2, cycleId);
            int cycleRow = updateCyclePs.executeUpdate();
            if (cycleRow != 1) {
                return false;
            }

        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    public void rejectRequestNew(int cycleId, String rejectReason) {
        String updateSlotSql = "UPDATE [dbo].[Selected_Slot] SET [status_id] = 3 WHERE cycle_id = ?";
        String updateCycleSql = "UPDATE [dbo].[Cycle] SET [note] = ? WHERE cycle_id = ?";

        try (
                // Update status in Selected_Slot table
                PreparedStatement updateSlotPs = con.prepareStatement(updateSlotSql); // Update note in Cycle table
                 PreparedStatement updateCyclePs = con.prepareStatement(updateCycleSql)) {
            updateSlotPs.setInt(1, cycleId);
            int slotRow = updateSlotPs.executeUpdate();

            updateCyclePs.setString(1, rejectReason);
            updateCyclePs.setInt(2, cycleId);
            int cycleRow = updateCyclePs.executeUpdate();
            System.out.println("Error updating Cycle table for cycle_id: " + cycleId);

        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ScheduleDAO dao = new ScheduleDAO();
        List<SchedulePublic> lisr = dao.getScheduleByMenteeName("truong");
        for (SchedulePublic s : lisr) {
            System.out.println(s);
        }
    }

    public List<SchedulePublic> getListSchedulePublicByMentorNameAndStatus(String userName, int statusId) {

        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "SELECT ss.selected_id, ss.day_of_slot, ss.slot_id, c.start_time, c.end_time, s.slot_name from Selected_Slot ss join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id "
                    + "where c.mentor_name = ? AND ss.status_id = ? order by day_of_slot";

            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setInt(2, statusId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SchedulePublic(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getDate(4), rs.getDate(5),
                        rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<SchedulePublic> getListSchedulePublic(String userName) {
        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "FROM Selected_Slot ss\n"
                    + "JOIN Cycle c ON ss.cycle_id = c.cycle_id\n"
                    + "WHERE c.mentor_name = ? \n"
                    + "AND c.cycle_id = (\n"
                    + "    SELECT MAX(cycle_id) \n"
                    + "    FROM Cycle\n"
                    + "    WHERE mentor_name = ?\n"
                    + ");";

            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SchedulePublic(
                        rs.getString(10),
                        rs.getDate(4),
                        rs.getString(2),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(3),
                        rs.getString(5),
                        rs.getString(9)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public String getSelectedSlotStatus(String userName, Date startTime, Date endTime) {
        String status = "";
        try {
            String sql = "SELECT * from Selected_Slot ss join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id JOIN Status_Selected stas ON stas.status_id = ss.status_id\r\n"
                    + //
                    "where ss.mentor_name = ? AND c.start_time >= ? AND c.end_time <= ?";

            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setDate(2, startTime);
            ps.setDate(3, endTime);
            rs = ps.executeQuery();
            while (rs.next()) {
                status = rs.getString(13);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public List<SchedulePublic> getScheduleByRequestId(int requestId) {
        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "select * from Selected_Slot ss join RquestSelectedSlot rs on rs.selected_id = ss.selected_id join Cycle c on ss.cycle_id = c.cycle_id join Slots s on s.slot_id = ss.slot_id where rs.request_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestId);
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
            System.out.println("getScheduleByRequestId" + e.getMessage());
        }
        return list;
    }

  public List<SchedulePublic> getScheduleByMenteeName(String menteeName) {
    List<SchedulePublic> list = new ArrayList<>();
    try {
        String sql = "SELECT ss.*, rs.*, c.*, s.*, rfm.*, sk.skill_name " +
                     "FROM Selected_Slot ss " +
                     "JOIN RquestSelectedSlot rs ON rs.selected_id = ss.selected_id " +
                     "JOIN Cycle c ON ss.cycle_id = c.cycle_id " +
                     "JOIN Slots s ON s.slot_id = ss.slot_id " +
                     "JOIN RequestsFormMentee rfm ON rs.request_id = rfm.request_id " +
                     "JOIN RequestSkills rsk ON rfm.request_id = rsk.request_id " +
                     "JOIN Skills sk ON rsk.skill_id = sk.skill_id " +
                     "WHERE rfm.mentee_name = ? AND rfm.status_id = 1";
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
            schedule.setSkillName(rs.getString("skill_name"));
            DayOfWeek nameOfDay = schedule.getDayOfSlot().toLocalDate().getDayOfWeek();
            schedule.setNameOfDay(nameOfDay);
            list.add(schedule);
        }
    } catch (SQLException e) {
        System.out.println("getScheduleByMenteeName: " + e.getMessage());
    }
    return list;
}


    public List<ScheduleCommon> getScheduleCommonByMentorName(String userName) {
        List<ScheduleCommon> list = new ArrayList<>();
        try {
            String sql = "SELECT r.mentor_name, a.full_name, s.skill_name,  s.description, \n"
                    + "ss.day_of_slot, \n"
                    + " sl.slot_id, \n"
                    + "sl.slot_name, \n"
                    + "att.attendance_status \n"
                    + "FROM \n"
                    + "RequestsFormMentee r JOIN  Accounts a on a.user_name = r.mentee_name\n"
                    + "JOIN RequestSkills rs on r.request_id = rs.request_id \n"
                    + "JOIN Skills s on s.skill_id = rs.skill_id \n"
                    + "JOIN RquestSelectedSlot rss on rss.request_id = rs.request_id\n"
                    + "JOIN Selected_Slot ss on rss.selected_id = ss.selected_id\n"
                    + "JOIN Slots sl on sl.slot_id = ss.slot_id\n"
                    + "LEFT JOIN Attendance att on att.mentee_name = r.mentee_name AND att.request_id = r.request_id\n"
                    + "WHERE  r.mentor_name = ? and r.status_id = 1;";

            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                ScheduleCommon sc = new ScheduleCommon(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8));
                list.add(sc);
            }
        } catch (SQLException e) {
            System.out.println("getScheduleCommonByMentorName: " + e.getMessage());
        }
        return list;
    }

    public int getCycleIdInTime(String mentorName, String startTime, String endTime) {
        try {
            String sql = "select c.cycle_id from Cycle c where c.mentor_name = ? and c.start_time = ? and c.end_time = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, mentorName);
            ps.setString(2, startTime);
            ps.setString(3, endTime);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getCycleIdInTime: " + e.getMessage());
        }
        return -1;
    }

    public List<SchedulePublic> getListSheduleByCycleAndStatus(int cycleId, int statusId) {
        List<SchedulePublic> list = new ArrayList<>();
        try {
            String sql = "select * from Selected_Slot ss where ss.cycle_id = ? and ss.status_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, cycleId);
            ps.setInt(2, statusId);
            rs = ps.executeQuery();
            while (rs.next()) {
                SchedulePublic schedule = new SchedulePublic();
                schedule.setSelectedId(rs.getInt("selected_id"));
                schedule.setSlotId(rs.getString("slot_id"));
                schedule.setCycleID(cycleId);
                schedule.setDayOfSlot(rs.getDate("day_of_slot"));
                DayOfWeek nameOfDay = schedule.getDayOfSlot().toLocalDate().getDayOfWeek();
                schedule.setNameOfDay(nameOfDay);
                list.add(schedule);
            }
        } catch (SQLException e) {
            System.out.println("getListSheduleByCycleAndStatus: " + e.getMessage());
        }
        return list;
    }

    public boolean updateStatusSelectedSlot(int selectedId, int status) {
        String sql = "UPDATE [dbo].[Selected_Slot] SET [status_id] = ? WHERE selected_id = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, selectedId);
            int row = ps.executeUpdate();
            if (row != 1) {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;

    }

    public boolean updateAttendance(AttendanceRecord record) {
        String sql = "UPDATE Attendance SET attendance_status = ? "
                + "WHERE mentee_name = ? AND selected_id = ? AND request_id = ?";

        try (
                PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, record.getAttendanceStatus());
            pstmt.setString(2, record.getMenteeName());
            pstmt.setInt(3, record.getSelectedId());
            pstmt.setInt(4, record.getRequestId());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                return insertNewAttendance(record);
            }

            return true;
        } catch (SQLException e) {
            System.out.println("updateAttendance: " + e.getMessage());
            return false;
        }
    }

    private boolean insertNewAttendance(AttendanceRecord record) {
        String sql = "INSERT INTO Attendance (request_id, selected_id, mentee_name, attendance_status, attendance_date) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, record.getRequestId());
            pstmt.setInt(2, record.getSelectedId());
            pstmt.setString(3, record.getMenteeName());
            pstmt.setString(4, record.getAttendanceStatus());
            pstmt.setTimestamp(5, new java.sql.Timestamp(record.getAttendanceDate().getTime()));

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.out.println("insertNewAttendance: " + e.getMessage());
            return false;
        }
    }
}
