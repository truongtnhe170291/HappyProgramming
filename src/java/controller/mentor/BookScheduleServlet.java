/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.MentorDAO;
import com.google.gson.JsonElement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import models.Account;
import models.FormData;
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
//        Account acc = (Account) request.getSession().getAttribute("user");
//        if (acc == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }
        // get thu 2 của tuan sau nua
        LocalDate today = LocalDate.now();
        LocalDate nextMonday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
        LocalDate nextNextMonday = nextMonday.plusWeeks(1);

        // get list Slot
        MentorDAO mentorDao = new MentorDAO();
        List<Slot> listSlot = mentorDao.listSlots();

//        int cycleID = mentorDao.getCycleIdByMentor(acc.getUserName(), getStartDate().toString(),
//                getEndDatePerMonth().toString());
//        System.out.println(cycleID);
//        ArrayList<SelectedSlot> listSelectedSlot = mentorDao.listSelectedSlotByCycle(6);
//        for (SelectedSlot selectedSlot : listSelectedSlot) {
//            System.out.println(selectedSlot);
//        }
//        request.setAttribute("listSS", listSelectedSlot);
        request.setAttribute("mon", nextNextMonday.toString());
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

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        StringBuilder jsonBuffer = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuffer.append(line);
            }
        }

        JsonObject jsonObject = gson.fromJson(jsonBuffer.toString(), JsonObject.class);

        JsonObject[] slots = gson.fromJson(jsonObject.get("slots"), JsonObject[].class);
//        List<SlotData> listSchedule = new ArrayList<>();
        for (JsonObject slot : slots) {
            for (Map.Entry<String, JsonElement> entry : slot.entrySet()) {
                String key = entry.getKey();
                System.out.println(key);
//                listSchedule.add(getSlotDataByKey(key));
            }
        }
        
        
        

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status", "success");
        //jsonResponse.addProperty("week", week);

        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }

    public String getSlotName(int value) {
        String slotName = "";
        switch (value) {
            case 1: {
                slotName = "SLOT01";
                break;
            }
            case 2: {
                slotName = "SLOT02";
                break;
            }
            case 3: {
                slotName = "SLOT03";
                break;
            }
            case 4: {
                slotName = "SLOT04";
                break;
            }
        }
        return slotName;
    }

    private SlotData getSlotDataByKey(String key) {
        if (key != null) {
            String[] keyParts = key.split("-");
            String slotId = keyParts[2];  // 3
            String date = keyParts[3] + "-" + keyParts[4];
            return new SlotData(slotId, LocalDate.parse(date));
        }
        return null;
    }

}
