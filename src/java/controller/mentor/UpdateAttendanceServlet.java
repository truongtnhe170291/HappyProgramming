package controller.mentor;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
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
import java.io.BufferedReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.AttendanceRecord;

@WebServlet(name = "UpdateAttendanceServlet", urlPatterns = {"/UpdateAttendanceServlet"})
public class UpdateAttendanceServlet extends HttpServlet {

  @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/plain;charset=UTF-8");
    try {
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        JsonObject jsonRequest = gson.fromJson(reader, JsonObject.class);
        int selected_id = jsonRequest.get("selected_id").getAsInt();
        String menteeName = jsonRequest.get("menteeName").getAsString();
        String date = jsonRequest.get("date").getAsString();
        String status = jsonRequest.get("status").getAsString();
        int request_id = jsonRequest.get("request_id").getAsInt();

        java.sql.Date sqlDate = java.sql.Date.valueOf(date);

        AttendanceRecord record = new AttendanceRecord();
        record.setMenteeName(menteeName);
        record.setRequestId(request_id);
        record.setAttendanceDate(sqlDate);
        record.setAttendanceStatus(status);
        record.setSelectedId(selected_id);
        ScheduleDAO attendance = new ScheduleDAO();
        boolean success = attendance.updateAttendance(record);

        if (success) {
            response.getWriter().write("Attendance record updated successfully");
        } else {
            response.getWriter().write("Failed to update attendance record");
        }

    } catch (JsonIOException | JsonSyntaxException | IOException e) {
        response.getWriter().write("Invalid data format: " + e.getMessage());
    }
}

}
