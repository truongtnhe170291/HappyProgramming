/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.MentorDAO;
import com.google.gson.JsonElement;
import dal.CVDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import models.Account;
import models.CV;
import models.Cycle;
import models.FormData;
import models.SchedulePublic;
import models.Slot;
import models.SlotData;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BookScheduleServlet", urlPatterns = {"/bookSchedule"})
public class BookScheduleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Gson gson = new Gson();
    private MentorDAO mentorDao = new MentorDAO();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // check login
        Account acc = (Account) request.getSession().getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        CVDAO cdao = new CVDAO();
        CV cv = cdao.getCVByUserName(acc.getUserName());
        if (cv == null || cv.getStattusId() != 2) {
            request.setAttribute("noBook", "You need to complete your CV before booking your schedule");
        }
        // get thu 2 của tuan sau nua
        LocalDate today = LocalDate.now();
        LocalDate nextMonday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
        LocalDate nextNextMonday = nextMonday.plusWeeks(1);
        Cycle c = mentorDao.getNewCycleByUser(acc.getUserName());
        String status = "";
        //get list schdule
        if (mentorDao.checkContainSelectSlotSave(acc.getUserName(), 4) || mentorDao.checkContainSelectSlotSave(acc.getUserName(), 1) || mentorDao.checkContainSelectSlotSave(acc.getUserName(), 2) || mentorDao.checkContainSelectSlotSave(acc.getUserName(), 3)) {
            LocalDate dateInStartAndEnd = LocalDate.parse(c.getStart()).plusWeeks(2).plusDays(2);
            if (today.isBefore(dateInStartAndEnd)) {
                List<SchedulePublic> listsp = mentorDao.listSlotsCycleByMentor(acc.getUserName(), c.getStart(), c.getEnd());
                if (!listsp.isEmpty()) {
                    for (SchedulePublic s : listsp) {
                        LocalDate date = LocalDate.parse(s.getDayOfSlot().toString());
                        s.setNameOfDay(date.getDayOfWeek());
                        status = s.getStatus();
                    }
                } else {
                    listsp = mentorDao.listSlotsCycleByMentor(acc.getUserName(), c.getStart(), c.getEnd());
                    for (SchedulePublic s : listsp) {
                        LocalDate date = LocalDate.parse(s.getDayOfSlot().toString());
                        s.setNameOfDay(date.getDayOfWeek());
                        status = s.getStatus();
                    }
                }

                if (mentorDao.checkContainSelectSlotSave(acc.getUserName(), 3)) {
                    request.getSession().setAttribute("reject", mentorDao.getCycleByCycleID(listsp.get(0).getCycleID()).getNote());
                }
                for (SchedulePublic s : listsp) {
                    System.out.println(s.getNameOfDay());
                }
                request.setAttribute("listScheduleSave", listsp);
                request.setAttribute("mon", c.getStart());
            } else {
                request.setAttribute("mon", nextNextMonday.toString());
            }
        } else {
            request.setAttribute("mon", nextNextMonday.toString());
        }
        request.setAttribute("status", status);

        // get list Slot
        List<Slot> listSlot = mentorDao.listSlots();

//        int cycleID = mentorDao.getCycleIdByMentor(acc.getUserName(), getStartDate().toString(),
//                getEndDatePerMonth().toString());
//        System.out.println(cycleID);
//        ArrayList<SelectedSlot> listSelectedSlot = mentorDao.listSelectedSlotByCycle(6);
//        for (SelectedSlot selectedSlot : listSelectedSlot) {
//            System.out.println(selectedSlot);
//        }
//        request.setAttribute("listSS", listSelectedSlot);
        request.setAttribute("listSlot", listSlot);
        request.getRequestDispatcher("BookSchedule.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Account acc = (Account) request.getSession().getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        StringBuilder jsonBuffer = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuffer.append(line);
            }
        }
        String requestBody = jsonBuffer.toString();
        JsonObject jsonObject = gson.fromJson(jsonBuffer.toString(), JsonObject.class);

        JsonObject[] slots = gson.fromJson(jsonObject.get("slots"), JsonObject[].class);
//        for (JsonObject s : slots) {
//            System.out.println(s);
//        }
        String status = "";
        Map<String, Object> jsonData = parseJson(requestBody);
        if (jsonData.get("status") instanceof String) {
            status = (String) jsonData.get("status");
        }

        String endDate = "";
        if (jsonData.get("endDate") instanceof String) {
//            endDate = (String) jsonData.get("endDate");
            endDate = convertDateFormat((String) jsonData.get("endDate"));
        }
        String startDate = "";
        if (jsonData.get("startDate") instanceof String) {
            startDate = (String) jsonData.get("startDate");
        }
        List<SlotData> listSchedule = new ArrayList<>();
        for (JsonObject slot : slots) {
            for (Map.Entry<String, JsonElement> entry : slot.entrySet()) {
                String key = entry.getKey();
                listSchedule.add(getSlotDataByKey(key));
            }
        }
        LocalDate deadLineDate = LocalDate.now().plusDays(5);

        if (status.equals("save")) {
            if (!mentorDao.checkContainSelectSlotSave(acc.getUserName(), 4)) {
                if (!listSchedule.isEmpty()) {
                    mentorDao.insertCycle(startDate, endDate, "", acc.getUserName(), deadLineDate.toString());
                    int cycleId = mentorDao.getCycleIdByMentor(acc.getUserName(), startDate, endDate);
                    for (SlotData s : listSchedule) {
                        mentorDao.insertSchedulePublic(s.getSlotId(), cycleId, s.getDate().toString(), 4);
                    }
                }
            } else {
                // delete schedule old
                List<SchedulePublic> listsp = mentorDao.listSlotsCycleByMentor(acc.getUserName(), startDate, endDate);
                if (!listsp.isEmpty()) {
                    int cycleID = listsp.get(0).getCycleID();
                    mentorDao.deleteSchedulePublic(cycleID);
                    mentorDao.deleteCycle(cycleID);
                }

                if (!listSchedule.isEmpty()) {
                    mentorDao.insertCycle(startDate, endDate, "", acc.getUserName(), deadLineDate.toString());
                    int cycleId = mentorDao.getCycleIdByMentor(acc.getUserName(), startDate, endDate);
                    for (SlotData s : listSchedule) {
                        mentorDao.insertSchedulePublic(s.getSlotId(), cycleId, s.getDate().toString(), 4);
                    }
                }
            }
        } else {
            if (!mentorDao.checkContainSelectSlotSave(acc.getUserName(), 4)) {
                if (!listSchedule.isEmpty()) {
                    if (request.getSession().getAttribute("reject") != null) {
                        List<SchedulePublic> listsp = mentorDao.listSlotsCycleByMentor(acc.getUserName(), startDate, endDate);
                        if (!listsp.isEmpty()) {
                            int cycleID = listsp.get(0).getCycleID();
                            mentorDao.deleteSchedulePublic(cycleID);
                            mentorDao.deleteCycle(cycleID);
                        }
                        request.getSession().removeAttribute("reject");
                    }
                    mentorDao.insertCycle(startDate, endDate, "", acc.getUserName(), deadLineDate.toString());
                    int cycleId = mentorDao.getCycleIdByMentor(acc.getUserName(), startDate, endDate);
                    for (SlotData s : listSchedule) {
                        mentorDao.insertSchedulePublic(s.getSlotId(), cycleId, s.getDate().toString(), 1);
                    }
                }
            } else {
                List<SchedulePublic> listsp = mentorDao.listSlotsCycleByMentor(acc.getUserName(), startDate, endDate);
                if (!listsp.isEmpty()) {
                    int cycleID = listsp.get(0).getCycleID();
                    mentorDao.deleteSchedulePublic(cycleID);
                    mentorDao.deleteCycle(cycleID);
                }

                if (!listSchedule.isEmpty()) {
                    mentorDao.insertCycle(startDate, endDate, "", acc.getUserName(), deadLineDate.toString());
                    int cycleId = mentorDao.getCycleIdByMentor(acc.getUserName(), startDate, endDate);
                    for (SlotData s : listSchedule) {
                        mentorDao.insertSchedulePublic(s.getSlotId(), cycleId, s.getDate().toString(), 1);
                    }
                }
                System.out.println("4. Show reject id: " + request.getSession().getAttribute("reject"));
            }
        }

        System.out.println("Status: " + status);
        System.out.println("start: " + startDate);
        System.out.println("End Date: " + endDate);

//        
//        
//            
//            
//        }
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status", "success");

        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }

    private Map<String, Object> parseJson(String json) {
        Map<String, Object> map = new HashMap<>();
        json = json.trim();
        if (json.startsWith("{") && json.endsWith("}")) {
            json = json.substring(1, json.length() - 1);
            String[] pairs = json.split(",");
            for (String pair : pairs) {
                String[] keyValue = pair.split(":", 2);
                if (keyValue.length == 2) {
                    String key = keyValue[0].trim().replace("\"", "");
                    String value = keyValue[1].trim();
                    if (value.startsWith("{") && value.endsWith("}")) {
                        map.put(key, parseJson(value));
                    } else if (value.startsWith("[") && value.endsWith("]")) {
                        map.put(key, parseJsonArray(value));
                    } else if (value.startsWith("\"") && value.endsWith("\"")) {
                        map.put(key, value.substring(1, value.length() - 1));
                    } else {
                        map.put(key, value);
                    }
                }
            }
        }
        return map;
    }

    private List<Object> parseJsonArray(String jsonArray) {
        List<Object> list = new ArrayList<>();
        jsonArray = jsonArray.trim();
        if (jsonArray.startsWith("[") && jsonArray.endsWith("]")) {
            jsonArray = jsonArray.substring(1, jsonArray.length() - 1);
            String[] items = jsonArray.split(",");
            for (String item : items) {
                item = item.trim();
                if (item.startsWith("{") && item.endsWith("}")) {
                    list.add(parseJson(item));
                } else if (item.startsWith("[") && item.endsWith("]")) {
                    list.add(parseJsonArray(item));
                } else if (item.startsWith("\"") && item.endsWith("\"")) {
                    list.add(item.substring(1, item.length() - 1));
                } else {
                    list.add(item);
                }
            }
        }
        return list;
    }

    public String getSlotName(int value) {
        switch (value) {
            case 1: {
                return "SLOT01";
            }
            case 2: {
                return "SLOT02";
            }
            case 3: {
                return "SLOT03";
            }
            case 4: {
                return "SLOT04";
            }
        }
        return null;
    }

    private SlotData getSlotDataByKey(String key) {
        try {
            if (key != null) {
                String[] keyParts = key.split("-");
                String slotId_raw = keyParts[2];  // 3
                String slotId = getSlotName(Integer.parseInt(slotId_raw));
                String date = keyParts[3] + "-" + keyParts[4] + "-" + keyParts[5];
                return new SlotData(slotId, LocalDate.parse(convertDateFormat(date)));
            }
            return null;
        } catch (NumberFormatException e) {
            System.out.println("getSlotDataByKey" + e.getMessage());
        }
        return null;
    }

    private String convertDateFormat(String date) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = "";
        try {
            Date parsedDate = inputFormat.parse(date);
            formattedDate = outputFormat.format(parsedDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return formattedDate;
    }
}
