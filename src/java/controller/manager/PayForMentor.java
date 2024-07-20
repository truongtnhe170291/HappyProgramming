/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import dal.MentorDAO;
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
            
            JsonArray listAttenJson = jsonObject.getAsJsonArray("listAtten");
            List<AttendanceRecord> listAtten = new ArrayList<>();
            for (JsonElement element : listAttenJson) {
                JsonObject attenObject = element.getAsJsonObject();
                AttendanceRecord atten = gson.fromJson(attenObject, AttendanceRecord.class);
                listAtten.add(atten);
            }
            

            
       
             WalletDAO walletDAO = new WalletDAO();
        
        String mentorName = listAtten.get(0).getMentorName();
        long mentorAmount = attendedCount * priceOfMentor;
        Wallet mentorWallet = new Wallet(mentorName, mentorAmount, 0);
        walletDAO.updateWallet(mentorWallet);

        String menteeName = listAtten.get(0).getMenteeName();
        long menteeAmount = absentCount * priceOfMentor;
        Wallet menteeWallet = new Wallet(menteeName, -menteeAmount, 0);
        walletDAO.updateWallet(menteeWallet);

        Wallet managerWallet = new Wallet("manager", totalAmount, 0);
        walletDAO.updateWallet(managerWallet);

     // Thêm các giao dịch
LocalDateTime now = LocalDateTime.now();

// Giao dịch cho mentor
Transaction mentorTransaction = new Transaction();
mentorTransaction.setUser_send(menteeName);
mentorTransaction.setUser_receive(mentorName);
mentorTransaction.setCreate_date(now);
mentorTransaction.setAmount(mentorAmount);
mentorTransaction.setMessage("Complete pre-course");
walletDAO.insertTransaction(mentorTransaction);

// Giao dịch cho mentee (nếu có buổi vắng mặt)
if (menteeAmount > 0) {
    Transaction menteeTransaction = new Transaction();
    menteeTransaction.setUser_send(menteeName);
    menteeTransaction.setUser_receive("manager");
    menteeTransaction.setCreate_date(now);
    menteeTransaction.setAmount(menteeAmount);
    menteeTransaction.setMessage("Complete pre-course");
    walletDAO.insertTransaction(menteeTransaction);
}

// Giao dịch cho manager
Transaction managerTransaction = new Transaction();
managerTransaction.setUser_send(menteeName);
managerTransaction.setUser_receive("manager");
managerTransaction.setCreate_date(now);
managerTransaction.setAmount(totalAmount);
managerTransaction.setMessage("Complete pre-course");
walletDAO.insertTransaction(managerTransaction);

            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("status", "success");
            jsonResponse.addProperty("message", "Payment processed successfully");
            jsonResponse.addProperty("amountPaid", totalAmount);
            jsonResponse.addProperty("attendedSessions", attendedCount);
            jsonResponse.addProperty("absentSessions", absentCount);
            jsonResponse.addProperty("notYetSessions", notYetCount);
            
            out.print(gson.toJson(jsonResponse));
        } catch (Exception e) {
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
