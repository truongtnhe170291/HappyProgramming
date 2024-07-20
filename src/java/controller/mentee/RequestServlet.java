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
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.CV;
import models.Cycle;
import models.FormData;
import models.Hold;
import models.Request;
import models.SchedulePublic;
import models.Skill;
import models.Slot;
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
            WalletDAO walletDAO = new WalletDAO();
            SkillDAO skillDAO = new SkillDAO();
            CVDAO cvdao = new CVDAO();
            MentorDAO mentorDAO = new MentorDAO();
            ScheduleDAO scheduleDAO = new ScheduleDAO();

            int cvId = Integer.parseInt(request.getParameter("cvId"));
            List<Skill> list = skillDAO.getSkillByCVId(cvId);
            //get user_name of Mentor  by cvid
            String userName = cvdao.getCVByCVId(cvId).getUserName();
            //get rate of mentor
            int rate = mentorDAO.getRateOfMentor(userName);
            Cycle c = mentorDAO.getNewCycleByUser(userName);
            // get Schedule public by user mentor name
            List<SchedulePublic> listSchedule = scheduleDAO.getListSchedulePublicByMentorNameAndStatus(userName, 2, c.getCycleId());
            if (listSchedule.isEmpty()) {
                response.sendRedirect("homeMentee");
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

                request.setAttribute("scheduleOfMentee", listScheduleByMentee);
                request.setAttribute("skillOfMentee", s);
                request.setAttribute("requestMentee", requ);
            }
            Wallet wallet = walletDAO.getWalletByUsenName(acc.getUserName());
            if (wallet == null) {
                if (walletDAO.insertWallet(new Wallet(acc.getUserName(), 0, 0))) {
                    request.setAttribute("wallet", 0);
                }
            } else {
                request.setAttribute("wallet", wallet.getReal_balance() - wallet.getHold());
            }
            CV cv = cvdao.getCVByCVId(cvId);

            List<Slot> listSlot = mentorDAO.listSlots();
            // set attribute

            List<SchedulePublic> listSchedule_General = scheduleDAO.getScheduleByMenteeName(acc.getUserName());
            request.setAttribute("listSchedule_gereral", listSchedule_General);
            request.setAttribute("mon", listSchedule.get(0).getStartTime());
            request.setAttribute("listSlot", listSlot);
            request.setAttribute("skills", list);
            request.setAttribute("rate", rate);
            request.setAttribute("cv", cv);
            request.getRequestDispatcher("Mentee_Request.jsp").forward(request, response);

        } catch (NumberFormatException e) {
        }
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

            for (FormData.Slot slot : formData.getSelectedSlots()) {
                System.out.println(slot.getSlot() + " " + slot.getDay());
                System.out.println("Test send");
            }
            System.out.println("break");
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
                                // check the same slot id and date
                                if (sp.getSlotId().contains(slot.getSlot() + "") && sp.getDayOfSlot().toString().equals(slot.getDay())) {
                                    System.out.println("check trùng ngày" + sp.getDayOfSlot());
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
                            if (sp.getSlotId().contains(slot.getSlot() + "") && sp.getDayOfSlot().toString().equals(slot.getDay())) {
                                System.out.println("check trùng ngày" + sp.getDayOfSlot());
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
                    if (dao.deleteRequest(requ.getRequestId())) {
                        re.setStatusId(2);
                        int requestId = dao.insertRequestReturnRequestId(re);
                        //insert skill request
                        dao.insertRequestSkills(requestId, skillId);
                        int cycleId = sdao.getCycleIdInTime(mentorName, startTime, endTime);
                        List<Integer> listSelectSlot = new ArrayList<>();
                        List<SchedulePublic> listS = sdao.getListSheduleByCycleAndStatus(cycleId, 2);
                        for (FormData.Slot slot : formData.getSelectedSlots()) {
                            for (SchedulePublic sp : listS) {
                                // check the same slot id and date
                                if (sp.getSlotId().contains(slot.getSlot() + "") && sp.getDayOfSlot().toString().equals(slot.getDay())) {
                                    System.out.println("check trùng ngày" + sp.getDayOfSlot());
                                    listSelectSlot.add(sp.getSelectedId());
                                }
                            }
                        }
                        if (!listSelectSlot.isEmpty()) {
                            for (Integer i : listSelectSlot) {
                                dao.insertRquestSelectedSlot(requestId, i);
                            }
                        }

                        // update request này
                        wallet.setHold(wallet.getHold() + requ.getPrice());
                        wdao.updateWalletHold(wallet);
                        Hold h = new Hold(re.getMenteeName(), requestId, re.getPrice(), LocalDateTime.now(), "Hold money by request with title: " + re.getTitle(), true);
                        wdao.inserHold(h);
                    }

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
                            if (sp.getSlotId().contains(slot.getSlot() + "") && sp.getDayOfSlot().toString().equals(slot.getDay())) {
                                System.out.println("check trùng ngày" + sp.getDayOfSlot());
                                listSelectSlot.add(sp.getSelectedId());
                            }
                        }
                    }
                    if (!listSelectSlot.isEmpty()) {
                        for (Integer i : listSelectSlot) {
                            dao.insertRquestSelectedSlot(requestId, i);
                        }
                    }
                    // update request này
                    wallet.setHold(wallet.getHold() + re.getPrice());
                    wdao.updateWalletHold(wallet);
                    Hold h = new Hold(re.getMenteeName(), requestId, re.getPrice(), LocalDateTime.now(), "Hold money by request with title: " + re.getTitle(), true);
                    wdao.inserHold(h);
                }
            }
//            //insert request
//            //get selected Slot
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
}
