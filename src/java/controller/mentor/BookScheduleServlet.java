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

import java.lang.reflect.Type;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BookScheduleServlet", urlPatterns = {"/bookSchedule"})
public class BookScheduleServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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

        // get thu 2 của tuan sau nua
        LocalDate today = LocalDate.now();
        LocalDate nextMonday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
        LocalDate nextNextMonday = nextMonday.plusWeeks(1);

        //get list Slot
        MentorDAO mentorDao = new MentorDAO();
        List<Slot> listSlot = mentorDao.listSlots();

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
            Type personListType = new TypeToken<List<SlotDTO>>() {}.getType();

            // Phân tích JSON thành danh sách các đối tượng Person
            List<SlotDTO> list = gson.fromJson(requestData, personListType);
            for(SlotDTO slot : list){
                System.out.println(slot.getDay());
            }
            request.getSession().setAttribute("status", "Saved");
            response.sendRedirect("bookSchedule");
        } catch (IOException e) {
        }

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
