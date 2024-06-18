/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import dal.CVDAO;
import dal.MentorDAO;
import dal.RequestDAO;
import dal.ScheduleDAO;
import dal.SkillDAO;
import dal.WalletDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.CV;
import models.FormData;
import models.Request;
import models.SchedulePublic;
import models.Skill;
import models.Wallet;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RequestServlet", urlPatterns = {"/request"})
public class RequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Account acc = (Account) request.getSession().getAttribute("user");
            if (acc == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            SkillDAO skillDAO = new SkillDAO();
            CVDAO cvdao = new CVDAO();
            MentorDAO mentorDAO = new MentorDAO();
            ScheduleDAO scheduleDAO = new ScheduleDAO();

            // check if not enough binance
            String warning = (String) request.getSession().getAttribute("warning");
            if (warning != null && warning.length() > 0) {
                request.setAttribute("warning", warning);
            }
            int cvId = Integer.parseInt(request.getParameter("cvId"));
            request.getSession().setAttribute("cvId", cvId);
            List<Skill> list = skillDAO.getSkillByCVId(cvId);
            //get user_name of Mentor  by cvid
            String userName = cvdao.getCVByCVId(cvId).getUserName();
            //get rate of mentor
            int rate = mentorDAO.getRateOfMentor(userName);
            // get Schedule public by user mentor name
            List<SchedulePublic> listSchedule_raw = scheduleDAO.getListSchedulePublicByMentorNameAndStatus(userName, 2);
            List<SchedulePublic> listSchedule = getOneWeek(listSchedule_raw);
            if (listSchedule.isEmpty()) {
                response.sendRedirect("homes.jsp");
                return;
            }
            for (SchedulePublic s : listSchedule) {
                DayOfWeek nameOfDay = s.getDayOfSlot().toLocalDate().getDayOfWeek();
                s.setNameOfDay(nameOfDay);
            }
            request.setAttribute("listSchedule", listSchedule);
            RequestDAO dao = new RequestDAO();
            Request requ = dao.getRequestByStatusSaved(acc.getUserName(), userName);
            if (requ != null) {
                request.setAttribute("Editable", "Editable");
                Skill s = skillDAO.getSkillByRequestId(requ.getRequestId());
                List<SchedulePublic> listScheduleByMentee = scheduleDAO.getScheduleByRequestId(requ.getRequestId());
                if (!listScheduleByMentee.isEmpty()) {
                    listScheduleByMentee = getOneWeek(listScheduleByMentee);
                }
                request.setAttribute("scheduleOfMentee", listScheduleByMentee);
                request.setAttribute("skillOfMentee", s);
            }

            CV cv = cvdao.getCVByCVId(cvId);

            // set attribute
            request.setAttribute("skills", list);
            request.setAttribute("rate", rate);
            request.setAttribute("cv", cv);
            request.getRequestDispatcher("Mentee_Request.jsp").forward(request, response);

        } catch (NumberFormatException e) {
        }
    }

    private List<SchedulePublic> getOneWeek(List<SchedulePublic> list) {
        List<SchedulePublic> listOne = new ArrayList<>();
        LocalDate referenceDate = list.get(0).getDayOfSlot().toLocalDate();

        // Tìm ngày đầu tiên và ngày cuối cùng của tuần chứa ngày cho trước
        LocalDate startOfWeek = referenceDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        LocalDate endOfWeek = referenceDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));

        // Tạo danh sách các ngày trong tuần
        List<LocalDate> weekDates = new ArrayList<>();
        LocalDate current = startOfWeek;
        while (!current.isAfter(endOfWeek)) {
            weekDates.add(current);
            current = current.plusDays(1);
        }
        for (SchedulePublic s : list) {
            for (LocalDate d : weekDates) {
                if (s.getDayOfSlot().toLocalDate().isEqual(d)) {
                    listOne.add(s);
                }
            }
        }

        return listOne;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            WalletDAO wdao = new WalletDAO();
            Account acc = (Account) request.getSession().getAttribute("user");
            if (acc == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            Wallet wallet = wdao.getWalletByUsenName(acc.getUserName());
            StringBuilder jsonBuffer = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonBuffer.append(line);
                }
            }

            String jsonString = jsonBuffer.toString();

            Gson gson = new Gson();
            FormData formData = gson.fromJson(jsonString, FormData.class);

            String title = formData.getTitle();
            String description = formData.getDescription();
            String deadlineDate_raw = formData.getDeadlineDate();
            String deadlineHour_raw = formData.getDeadlineHour();
            int skillId = Integer.parseInt(formData.getSkill());
            int totalPrice = formData.getTotalPrice();
            String mentorName = formData.getMentorname();
            String menteeName = acc.getUserName();
            String action = formData.getAction();
            String startTime = formData.getStartime();
            String endTime = formData.getEndtime();
            LocalDate deadlineDate = LocalDate.parse(deadlineDate_raw);
            LocalTime deadlineHour = LocalTime.parse(deadlineHour_raw);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            RequestDAO dao = new RequestDAO();
            ScheduleDAO sdao = new ScheduleDAO();
            Request re = new Request(mentorName, menteeName, deadlineDate, title, description, 2, deadlineHour);
            re.setPrice(totalPrice);
            if (action.equalsIgnoreCase("Editable")) {
                Request requ = dao.getRequestByStatusSaved(menteeName, mentorName);
                if (requ != null) {
                    // update request này
                    if (dao.deleteRequest(requ.getRequestId())) {
                        re.setStatusId(6);
                        int requestId = dao.insertRequestReturnRequestId(re);
                        //insert skill request
                        dao.insertRequestSkills(requestId, skillId);
                        int cycleId = sdao.getCycleIdInTime(mentorName, startTime, endTime);
                        List<Integer> listSelectSlot = new ArrayList<>();
                        List<SchedulePublic> listS = sdao.getListSheduleByCycleAndStatus(cycleId, 2);
                        for (FormData.Slot slot : formData.getSelectedSlots()) {
                            for (SchedulePublic sp : listS) {
                                // check the same slot id and name of date
                                if (sp.getSlotId().contains(slot.getSlot() + "") && sp.getNameOfDay().equals(LocalDate.parse(slot.getDay(), formatter).getDayOfWeek())) {
                                    listSelectSlot.add(sp.getSelectedId());
                                }
                            }
                        }
                        if (!listSelectSlot.isEmpty()) {
                            for (Integer i : listSelectSlot) {
                                dao.insertRquestSelectedSlot(requestId, i);
                            }
                        }
                    }
                } else {
                    re.setStatusId(6);
                    int requestId = dao.insertRequestReturnRequestId(re);
                    //insert skill request
                    dao.insertRequestSkills(requestId, skillId);
                    int cycleId = sdao.getCycleIdInTime(mentorName, startTime, endTime);
                    List<Integer> listSelectSlot = new ArrayList<>();
                    List<SchedulePublic> listS = sdao.getListSheduleByCycleAndStatus(cycleId, 2);
                    for (FormData.Slot slot : formData.getSelectedSlots()) {
                        for (SchedulePublic sp : listS) {
                            // check the same slot id and name of date
                            if (sp.getSlotId().contains(slot.getSlot() + "") && sp.getNameOfDay().equals(LocalDate.parse(slot.getDay(), formatter).getDayOfWeek())) {
                                listSelectSlot.add(sp.getSelectedId());
                            }
                        }
                    }
                    if (!listSelectSlot.isEmpty()) {
                        for (Integer i : listSelectSlot) {
                            dao.insertRquestSelectedSlot(requestId, i);
                        }
                    }
                }
            } else { // Send request
                Request requ = dao.getRequestByStatusSaved(menteeName, mentorName);
                if (requ != null) {
                    dao.updateStatus(requ.getRequestId(), 2);
                    // update request này
//                    wallet.setAvaiable_binance(wallet.getAvaiable_binance() - requ.getPrice());
//                    wdao.updateWallet(wallet);
                } else {
                    re.setStatusId(2);
                    int requestId = dao.insertRequestReturnRequestId(re);
                    //insert skill request
                    dao.insertRequestSkills(requestId, skillId);
                    int cycleId = sdao.getCycleIdInTime(mentorName, startTime, endTime);
                    List<Integer> listSelectSlot = new ArrayList<>();
                    List<SchedulePublic> listS = sdao.getListSheduleByCycleAndStatus(cycleId, 2);
                    for (FormData.Slot slot : formData.getSelectedSlots()) {
                        for (SchedulePublic sp : listS) {
                            // check the same slot id and name of date
                            if (sp.getSlotId().contains(slot.getSlot() + "") && sp.getNameOfDay().equals(LocalDate.parse(slot.getDay(), formatter).getDayOfWeek())) {
                                listSelectSlot.add(sp.getSelectedId());
                            }
                        }
                    }
                    if (!listSelectSlot.isEmpty()) {
                        for (Integer i : listSelectSlot) {
                            dao.insertRquestSelectedSlot(requestId, i);
                        }
                    }
//                    wallet.setAvaiable_binance(wallet.getAvaiable_binance() - re.getPrice());
//                    wdao.updateWallet(wallet);
                }
            }

            // insert request
            //get selected Slot
//            String[] selectedSlots = request.getParameterValues("schedule");
//            List<Integer> listSelected = new ArrayList<>();
//            for (String paramValue : selectedSlots) {
//                listSelected.add(Integer.valueOf(paramValue));
//            }
//            if (requestId != 0) {
//                if (dao.insertRequestSkills(requestId, skillId)) {
//
//                }
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
//                JsonObject responseJson = new JsonObject();
//                responseJson.addProperty("status", "success" + t);
//                response.getWriter().write(responseJson.toString());
//            } else {
//                System.out.println("insert fails");
//            }
        } catch (JsonSyntaxException | IOException e) {
            System.out.println(e.getMessage());
        }

    }

    /*
    <form action="RequestServlet" method="post">
        <label for="mentorName">Mentor Name:</label>
        <input type="text" id="mentorName" name="mentorName" value="user2" required><br>
        
        <label for="gMailMentee">Mentee Name:</label>
        <input type="text" id="menteeName" name="menteeName" value="user1" required><br>
        
        <label for="deadlineDate">Deadline Date:</label>
        <input type="date" id="deadlineDate" name="deadlineDate" required><br>
        
        <label for="deadlineHour">Deadline Hour:</label>
        <input type="time" id="deadlineHour" name="deadlineHour" required><br>
        
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required><br>
        
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea><br>
        
        <label for="skills">Select Skills:</label><br>
        <c:forEach var="skill" items="${skills}">
            <input type="checkbox" id="skill${skill.skillID}" name="skills" value="${skill.skillID}">
            <label for="skill${skill.skillID}">${skill.skillName}</label><br>
        </c:forEach>
        
        <input type="submit" value="Submit">
    </form>*/
}
