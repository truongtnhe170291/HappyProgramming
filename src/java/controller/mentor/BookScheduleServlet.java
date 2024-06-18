/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import dal.MentorDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import models.Slot;
import models.SlotDTO;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.PrintWriter;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.BookSchedule;
import models.SchedulePublic;
import models.SelectedSlot;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BookScheduleServlet", urlPatterns = {"/bookSchedule"})
public class BookScheduleServlet extends HttpServlet {

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
        
        ArrayList<SelectedSlot> listSelectedSlot = mentorDao.listSelectedSlotByCycle(6);
        for (SelectedSlot selectedSlot : listSelectedSlot) {
            System.out.println(selectedSlot);
        }
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
        MentorDAO mentorDao = new MentorDAO();

        Account acc = (Account) request.getSession().getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<BookSchedule> dates = new ArrayList<>();

        try {
            BufferedReader reader = request.getReader();
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            reader.close();
            String requestData = sb.toString();
            Gson gson = new Gson();

            // Xác định kiểu của danh sách đối tượng
            Type personListType = new TypeToken<List<SlotDTO>>() {
            }.getType();

            // Phân tích JSON thành danh sách các đối tượng Person
            List<SlotDTO> list = gson.fromJson(requestData, personListType);
            for (SlotDTO slot : list) {
                LocalDate date = LocalDate.parse(slot.getDay());
                dates.add(new BookSchedule(date, slot.getSlot()));
            }

            List<BookSchedule> newDates = new ArrayList<>(); // Tạo một danh sách mới để lưu trữ các đối tượng mới
            for (BookSchedule date : dates) {
                newDates.add(date);
                for (int i = 1; i < 4; i++) {
                    newDates.add(new BookSchedule(date.getScheduleName().plusWeeks(i), date.getScheduleSlot()));
                }
            }

            dates = newDates;

            for (BookSchedule date : dates) {
                System.out.println(date);
            }

            // Tiến hành insert dữ liệu về cycle vào db
            // Kiểm tra xem user này đã tồn tại cycle này hay chưa
            if (!mentorDao.checkContainCycle(acc.getUserName(), getStartDate().toString(), getEndDatePerMonth().toString())) {
                mentorDao.insertCycle(getStartDate().toString(), getEndDatePerMonth().toString(), "", acc.getUserName(), getStartDate().toString());
                //  Lấy ra cycleId để insert vào selected Slot
                int cycleID = mentorDao.getCycleIdByMentor(acc.getUserName(), getStartDate().toString(),
                        getEndDatePerMonth().toString());
                if (list != null) {
                    for (BookSchedule date : dates) {
                        //Status đang ở trạng thái saved
                        mentorDao.insertSchedulePublic(getSlotName(date.getScheduleSlot()), cycleID, date.getScheduleName().toString(), 6);
                    }
                }
            } // Nếu đã tồn tại cycle thì chỉ tiến hành insert selected slot
            else {
                int cycleID = mentorDao.getCycleIdByMentor(acc.getUserName(), getStartDate().toString(),
                        getEndDatePerMonth().toString());
                if (list != null) {
                    for (BookSchedule date : dates) {
                        //Status đang ở trạng thái saved
                        mentorDao.insertSchedulePublic(getSlotName(date.getScheduleSlot()), cycleID, date.getScheduleName().toString(), 6);
                    }
                }
            }
            response.sendRedirect("bookSchedule?loadData=ok");
        } catch (IOException e) {
        }

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

    public LocalDate getEndDatePerMonth() {
        LocalDate endSunday;
        // get thu 2 của tuan sau nua
        LocalDate today = LocalDate.now();
        LocalDate nextMonday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
        LocalDate Monday1 = nextMonday.plusWeeks(1);
        LocalDate Monday2 = Monday1.plusWeeks(1);
        LocalDate Monday3 = Monday2.plusWeeks(1);
        LocalDate Monday4 = Monday3.plusWeeks(1);
        endSunday = Monday4.plusDays(6);
        return endSunday;
    }

    public LocalDate getStartDate() {
        LocalDate nextNextMonday;
        // get thu 2 của tuan sau nua
        LocalDate today = LocalDate.now();
        LocalDate nextMonday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
        nextNextMonday = nextMonday.plusWeeks(1);
        return nextNextMonday;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
