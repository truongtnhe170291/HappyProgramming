/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import dal.MentorDAO;
import dal.RequestDAO;
import dal.ScheduleDAO;
import dal.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.AttendanceRecord;
import models.Transaction;
import models.Wallet;

/**
 *
 * @author 2k3so
 */
@WebServlet(name = "PayForMentor", urlPatterns = {"/PayForMentor"})
public class PayForMentor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PayForMentor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayForMentor at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        try {
            Account a = (Account) request.getSession().getAttribute("user");
            if (a == null) {
                response.sendRedirect("LoginManager");
                return;
            }
            MentorDAO mentorDao = new MentorDAO();
            ScheduleDAO sdao = new ScheduleDAO();
            String requestId = request.getParameter("requestId");
            List<AttendanceRecord> listAtten = sdao.getListAttendanceRecoderByRequestId(requestId);
            int priceOfMentor = mentorDao.getRateOfMentor(listAtten.get(0).getMentorName());
            request.setAttribute("priceOfMentor", priceOfMentor);
            request.setAttribute("listAtten", listAtten);
            request.getRequestDispatcher("ListRequestFromMenteeManager.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Account acc = (Account) request.getSession().getAttribute("user");
        if (acc == null) {
            response.sendRedirect("LoginManager");
            return;
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            StringBuilder buffer = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            String data = buffer.toString();

            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(data, JsonObject.class);

            int priceOfMentor = jsonObject.get("priceOfMentor").getAsInt();
            int attendedCount = jsonObject.get("attendedCount").getAsInt();
            int absentCount = jsonObject.get("absentCount").getAsInt();
            int notYetCount = jsonObject.get("notYetCount").getAsInt();
            int totalAmount = jsonObject.get("totalAmount").getAsInt();
            int attendedAmount = jsonObject.get("attendedAmount").getAsInt();
            int absentAmount = jsonObject.get("absentAmount").getAsInt();
            int notYetAmount = jsonObject.get("notyetAmount").getAsInt();

            JsonArray listAttenJson = jsonObject.getAsJsonArray("listAtten");
            List<AttendanceRecord> listAtten = new ArrayList<>();
            for (JsonElement element : listAttenJson) {
                JsonObject attenObject = element.getAsJsonObject();
                AttendanceRecord atten = gson.fromJson(attenObject, AttendanceRecord.class);
                listAtten.add(atten);
            }

            WalletDAO walletDAO = new WalletDAO();
            // mentor
            String mentorName = listAtten.get(0).getMentorName();
            Wallet wmentor = walletDAO.getWalletByUsenName(mentorName);
            System.out.println("start");
            System.out.println(attendedAmount);
            if (wmentor != null) {
                Wallet mentorWallet = new Wallet(mentorName, attendedAmount + wmentor.getReal_balance(), 0);
                walletDAO.updateWallet(mentorWallet);
            } else {
                Wallet mentorWallet = new Wallet(mentorName, attendedAmount, 0);
                walletDAO.insertWallet(mentorWallet);
            }

            //mentee
            String menteeName = listAtten.get(0).getMenteeName();
            Wallet wmentee = walletDAO.getWalletByUsenName(menteeName);
            Wallet menteeWallet = new Wallet(menteeName, wmentee.getReal_balance() + absentAmount + notYetAmount, 0);
            walletDAO.updateWallet(menteeWallet);

            //manager
            Wallet wmanager = walletDAO.getWalletByUsenName(acc.getUserName());
            long managemon = absentAmount + notYetAmount;
            System.out.println("start");
            System.out.println(managemon);
            Wallet managerWallet = new Wallet(acc.getUserName(), wmanager.getReal_balance() - absentAmount - notYetAmount - attendedAmount, 0);

            walletDAO.updateWallet(managerWallet);

            // Thêm các giao dịch
            LocalDateTime now = LocalDateTime.now();
            int request_id = listAtten.get(0).getRequestId();
// Giao dịch cho mentor
            if (attendedAmount > 0) {
                Transaction mentorTransaction = new Transaction();
                mentorTransaction.setUser_send(acc.getUserName());
                mentorTransaction.setUser_receive(mentorName);
                mentorTransaction.setCreate_date(now);
                mentorTransaction.setAmount(attendedAmount);
                mentorTransaction.setMessage("Complete pre-course for request: " + request_id);
                walletDAO.insertTransaction(mentorTransaction);
            }
// Giao dịch cho mentee (nếu có buổi vắng mặt)
            if (absentAmount > 0 || notYetAmount > 0) {
                Transaction menteeTransaction = new Transaction();
                menteeTransaction.setUser_send(acc.getUserName());
                menteeTransaction.setUser_receive(menteeName);
                menteeTransaction.setCreate_date(now);
                menteeTransaction.setAmount(absentAmount + notYetAmount);
                menteeTransaction.setMessage("Complete pre-course return money with not attended");
                walletDAO.insertTransaction(menteeTransaction);
            }

// Giao dịch cho manager
            Transaction managerTransaction = new Transaction();
            String sender = "";
            if (attendedCount > 0 && absentCount == 0 && notYetCount == 0) {
                sender = mentorName;
            } else {
                sender = menteeName;
            }
            managerTransaction.setUser_send(sender);
            managerTransaction.setUser_receive(acc.getUserName());
            managerTransaction.setCreate_date(now);
            managerTransaction.setAmount(totalAmount);
            managerTransaction.setMessage("Complete pre-course with 5% Amount for System");
            walletDAO.insertTransaction(managerTransaction);

            RequestDAO rdao = new RequestDAO();
            rdao.updateStatus(request_id, 7);
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("status", "success");
            jsonResponse.addProperty("message", "Payment processed successfully");
            jsonResponse.addProperty("amountPaid", totalAmount);
            jsonResponse.addProperty("attendedSessions", attendedCount);
            jsonResponse.addProperty("absentSessions", absentCount);
            jsonResponse.addProperty("notYetSessions", notYetCount);

            out.print(gson.toJson(jsonResponse));
        } catch (JsonSyntaxException | IOException e) {
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("status", "error");
            errorResponse.addProperty("message", "An error occurred: " + e.getMessage());
            out.print(new Gson().toJson(errorResponse));

            e.printStackTrace();
        } finally {
            out.flush();
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
