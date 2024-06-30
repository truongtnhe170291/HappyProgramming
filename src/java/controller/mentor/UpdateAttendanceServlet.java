import dal.ScheduleDAO;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.AttendanceRecord;

@WebServlet("/UpdateAttendanceServlet")
public class UpdateAttendanceServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        
        try {
            String mentorName = request.getParameter("mentorName");
            String menteeName = request.getParameter("menteeName");
            String dateString = request.getParameter("date");
            String slotId = request.getParameter("slotId");
            String attendanceStatus = request.getParameter("status");
            
            if (mentorName == null || menteeName == null || dateString == null || slotId == null || attendanceStatus == null) {
                response.getWriter().write("Missing required information");
                return;
            }
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = dateFormat.parse(dateString);
            
            AttendanceRecord record = new AttendanceRecord();
            record.setMentorName(mentorName);
            record.setMenteeName(menteeName);
            record.setDayOfSlot((java.sql.Date) date);
            record.setSlotName(slotId); 
            record.setAttendanceStatus(attendanceStatus);
            record.setAttendanceDate((java.sql.Date) new Date());
            
            ScheduleDAO attendance = new ScheduleDAO();
            boolean success = attendance.updateAttendance(record);
            
            if (success) {
                response.getWriter().write("Attendance updated successfully");
            } else {
                response.getWriter().write("Failed to update attendance");
            }
            
        } catch (ParseException e) {
            response.getWriter().write("Invalid date format");
        } catch (IOException e) {
            response.getWriter().write("An error occurred: " + e.getMessage());
        }
    }
}