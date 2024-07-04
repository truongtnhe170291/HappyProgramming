/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.AccountDAO;
import dal.MentorDAO;
import dal.SkillDAO;
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
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Skill;
import services.CVService;
import services.VietnameseConverter;

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, String a)
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
            out.println("<h1>Servlet UpdateAccountServlet at " + a + "</h1>");
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
        if(curentAccount == null){
            response.sendRedirect("login.jsp");
            return;
        }
        Account acc = dao.getAccount(curentAccount.getUserName(), curentAccount.getPassword());
        if (acc.getRoleId() == 1) {
            request.setAttribute("user", acc);
            request.getRequestDispatcher("MemberProfile.jsp").forward(request, response);
            return;
        }
        if (acc.getRoleId() == 2) {
            MentorDAO mentorDao = new MentorDAO();
            request.setAttribute("user", acc);
            request.getRequestDispatcher("mentor_info.jsp").forward(request, response);
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

        String userName = request.getParameter("username");
        String fullName = VietnameseConverter.removeDiacritics(request.getParameter("fullname"));
        String sex = request.getParameter("sex");
        String gmail = request.getParameter("gmail");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String address = VietnameseConverter.removeDiacritics(request.getParameter("address"));
        Part filePart = request.getPart("fileUpload");

        // D:\Workspase\Java_NetBeans\Project-SWP-HappyProgramming\HappyProgramming\web\img
        String upload = "D:\\Workspase\\Java_NetBeans\\Project-SWP-HappyProgramming\\HappyProgramming\\web\\img\\";

        Account curentAccount = (Account) request.getSession().getAttribute("user");

        String oldavata = curentAccount.getAvatar();
        System.out.println(curentAccount.getFullName());
        System.out.println(oldavata);
        // Lấy tên tệp
        String fileName = filePart.getSubmittedFileName();
        System.out.println(fileName);
        if (!fileName.equals("") && !fileName.equals(oldavata)) {
            String uploadDirectory = upload + fileName;
            System.out.println(uploadDirectory);
            System.out.println("sdfsdfsdjfsd");
            try (OutputStream out = new FileOutputStream(uploadDirectory)) {
                InputStream in = filePart.getInputStream();
                byte[] bytes = new byte[in.available()];
                in.read(bytes);
                out.write(bytes);
                out.close();
            } catch (IOException e) {
                System.out.println(e);
                fileName = "default.jpg";
            }
        } else if (fileName.equals(oldavata) && !fileName.equals("") || fileName.equals("") && oldavata != null) {
            fileName = oldavata;
        } else {
            fileName = "default.jpg";
        }
        AccountDAO dao = new AccountDAO();
        try {
            dao.updateAccount(userName, fullName, dob, sex, address, gmail, fileName, phone);
            response.sendRedirect("UpdateAccountServlet");
        } catch (NullPointerException e) {
            dao.updateAccount(userName, fullName, dob, sex, address, gmail, fileName, phone);
            response.sendRedirect("UpdateAccountServlet");
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
