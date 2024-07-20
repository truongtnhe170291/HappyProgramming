/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import com.google.gson.Gson;
import dal.MentorDAO;
import dal.RequestDAO;
import dal.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import models.Account;

import models.RequestDTO;
import models.SchedulePublic;
import models.Skill;
import models.Slot;

@WebServlet(name = "Schedule_General_Mentee", urlPatterns = {"/Schedule_General_Mentee"})
public class Schedule_General_Mentee extends HttpServlet {

 
  

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        Account acc = (Account) request.getSession().getAttribute("user");
        if (acc == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        if (acc.getRoleId() == 1) {
            ScheduleDAO dao = new ScheduleDAO();
            RequestDAO rdao = new RequestDAO();
            MentorDAO mentorDao = new MentorDAO();

            List<SchedulePublic> list = dao.getScheduleByMenteeName(acc.getUserName());
            List<Skill> listSkill = rdao.getListSkillsByMenteeRequestWithOpenClass(acc.getUserName());
            List<RequestDTO> listReqq = rdao.getAllRequestByStatusAndMentee(acc.getUserName(), 1);
            List<RequestDTO> listReq = updateAbsentAndAttended(listReqq, list);
            ArrayList<Slot> listSlots = mentorDao.listSlots();

            // Sử dụng phương thức processSkillData mới
            Map<String, Map<String, Map<String, Integer>>> skillData = processSkillData(listSkill, listReq);

            request.setAttribute("listSchedule_gereral", list);
            request.setAttribute("listSkill", listSkill);
            request.setAttribute("startTime", list.isEmpty() ? null : list.get(0).getStartTime());
            request.setAttribute("listRequests", listReq);
            request.setAttribute("listSlot", listSlots);
            
            Gson gson = new Gson();
            String skillDataJson = gson.toJson(skillData);
            request.setAttribute("skillDataJson", skillDataJson);
            request.setAttribute("skillDataJsons", skillData);

            // In ra console để kiểm tra
            System.out.println("Processed Skill Data: " + skillData);
            
            request.getRequestDispatcher("General_schedule_mentee.jsp").forward(request, response);
        }
    } catch (ServletException | IOException e) {
        e.printStackTrace();
        request.getRequestDispatcher("General_schedule_mentee.jsp").forward(request, response);
    }
}

private Map<String, Map<String, Map<String, Integer>>> processSkillData(List<Skill> skills, List<RequestDTO> listReq) {
    Map<String, Map<String, Map<String, Integer>>> skillData = new HashMap<>();

    for (Skill skill : skills) {
        Map<String, Map<String, Integer>> timeRanges = new HashMap<>();

        for (RequestDTO request : listReq) {
            if (request.getListSkills().stream().anyMatch(s -> s.getSkillID() == skill.getSkillID())) {
                // Lấy thời gian từ lịch trình đầu tiên (giả sử tất cả các lịch trình trong một yêu cầu có cùng thời gian)
                if (!request.getListSchedule().isEmpty()) {
                    SchedulePublic firstSchedule = request.getListSchedule().get(0);
                    String timeRange = firstSchedule.getStartTime() + " - " + firstSchedule.getEndTime();
                    timeRanges.putIfAbsent(timeRange, new HashMap<>());
                    
                    Map<String, Integer> attendanceCounts = timeRanges.get(timeRange);
                    
                    // Cập nhật số liệu dựa trên absent và attended của RequestDTO
                    attendanceCounts.put("Absent", attendanceCounts.getOrDefault("Absent", 0) + request.getAbsent());
                    attendanceCounts.put("Attended", attendanceCounts.getOrDefault("Attended", 0) + request.getAttended());
                    int notYet = request.getListSchedule().size() - request.getAbsent() - request.getAttended();
                    attendanceCounts.put("Not Yet", attendanceCounts.getOrDefault("Not Yet", 0) + notYet);
                }
            }
        }

        if (!timeRanges.isEmpty()) {
            skillData.put(skill.getSkillName(), timeRanges);
        }
    }

    return skillData;
}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("General_schedule_mentee.jsp").forward(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private List<RequestDTO> updateAbsentAndAttended(List<RequestDTO> listReq, List<SchedulePublic> list) {
        for(RequestDTO rDTO : listReq){
            int absent = 0;
            int attended = 0;
            for(SchedulePublic sp : list){
                        System.out.println(rDTO.getRequestId()+"abc"+sp.getRequestId());

                if(rDTO.getRequestId() == sp.getRequestId()){
                    System.out.println(sp.getAttendanceStatus());
                    if(sp.getAttendanceStatus() != null && sp.getAttendanceStatus().equals("Absent")){
                        System.out.println(sp.getAttendanceStatus()+"1");
                        absent++;
                    }
                    
                    if(sp.getAttendanceStatus() != null && sp.getAttendanceStatus().equals("Attended")){
                        attended++;
                    }
                }
            }
            rDTO.setAbsent(absent);
            rDTO.setAttended(attended);
        }
        return listReq;
    }

}
