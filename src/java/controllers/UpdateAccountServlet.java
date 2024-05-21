/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;
import java.util.regex.Pattern;
import models.Account;
import models.CV;
import services.CVService;
import services.SkillService;

/**
 *
 * @author 2k3so
 */
@MultipartConfig
@WebServlet(name = "UpdateAccountServlet", urlPatterns = {"/UpdateAccountServlet"})
public class UpdateAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAccountServlet at " + request.getContextPath() + "</h1>");
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
        AccountDAO dao = new AccountDAO();
        HttpSession session = request.getSession();

        Account curentAccount = (Account) session.getAttribute("user");
        Account a = dao.getAccount(curentAccount.getUserName(), curentAccount.getPassword());
<<<<<<< HEAD

=======
        // show skills 
        SkillService skillService = SkillService.getInstance();
        request.setAttribute("skills", skillService.getSkills());

        CVService cvService = CVService.getInstance();
        CV cv = cvService.getCVByUserName(curentAccount.getUserName());
        if (cv != null) {

            request.setAttribute("cv", cv);
        }
>>>>>>> 6452d8b6fd3bfa683d4489a2a764e7fc856362a5
        request.setAttribute("user", a);
        request.getRequestDispatcher("user_info.jsp").forward(request, response);

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

        String userName = request.getParameter("username");
        String fullName = request.getParameter("fullname");
        String sex = request.getParameter("sex");
        String gmail = request.getParameter("gmail");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Part filePart = request.getPart("fileUpload");
        HttpSession session = request.getSession();
        AccountDAO dao = new AccountDAO();
        boolean flag = true;

        Account curentAccount = (Account) session.getAttribute("user");
        Account a = dao.getAccount(curentAccount.getUserName(), curentAccount.getPassword());

        String resultFileName = a.getAvatar();

            // Lấy tên tệp
            String fileName = filePart.getSubmittedFileName();
            String uploadDirectory = "C:\\Users\\2k3so\\OneDrive\\Desktop\\HappyProgramming\\build\\web\\img\\" + fileName;
            try {
                OutputStream out = new FileOutputStream(uploadDirectory);
                InputStream in = filePart.getInputStream();
                byte[] bytes = new byte[in.available()];
                in.read(bytes);
                out.write(bytes);
                out.close();
            } catch (IOException e) {
                fileName = "default.jpg";
            }

        if (userName.isBlank() || fullName.isBlank() || gmail.isBlank() || dob.isBlank() || phone.isBlank() || address.isBlank()) {
            flag = false;
        } else if (!isValidPhoneNumber(phone)) {
            flag = false;
        } else if (!isValidName(fullName)) {
            flag = false;
        } else {
            flag = true;
        }

        if (flag) {
            dao.updateAccount(userName, fullName, dob, sex, address, gmail, fileName, phone);
            request.setAttribute("user", a);
            request.getRequestDispatcher("user_info.jsp").forward(request, response);
        } else {
            request.setAttribute("user", a);
            request.getRequestDispatcher("user_info.jsp").forward(request, response);
        }

    }

    public boolean isValidPhoneNumber(String phoneNumber) {
        String PhoneNumberPattern = "^(0[3|5|7|8|9])+([0-9]{8})$";
        Pattern pattern = Pattern.compile(PhoneNumberPattern);
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }

    public boolean isValidName(String name) {
        String regex = "^[\\p{L} .'-]+$";
        if (name == null || name.length() > 50) {
            return false;
        }
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(name);
        return matcher.matches();
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
