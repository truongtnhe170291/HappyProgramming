/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import models.CV;
import services.CVService;
import services.SkillService;
import models.Account;
import services.AccountService;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "CVServlet", urlPatterns = {"/cv"})
public class CVServlet extends HttpServlet {

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
            // Get data from UpdateMenteeProfileDemo.jsp
            String gmail = request.getParameter("gmail");
            String fullname = request.getParameter("fullName");
            String dob = request.getParameter("dob");
            String _sex = request.getParameter("sex");
            String address = request.getParameter("address");
            String profession = request.getParameter("profession");
            String professionIntro = request.getParameter("professionIntro");
            String achievementDescription = request.getParameter("achievementDescription");
            String serviceDescription = request.getParameter("serviceDescription");
            String[] _skills = request.getParameterValues("skills");
            int[] skills;
            if (_skills.length > 0) {
                skills = new int[_skills.length];
                for (int i = 0; i < _skills.length; i++) {
                    skills[i] = Integer.parseInt(_skills[i]);
                }
            } else {
                skills = new int[0];
            }
            boolean sex;
            sex = _sex.equals("1");

            // insert anh save img file
            Part filePart = request.getPart("fileUpload");

            // C:\Users\Admin\Desktop\HappyProgramming\web\img
            String upload = "C:\\Users\\Admin\\Desktop\\HappyProgramming\\web\\imgcv\\";

            Account curentAccount = (Account) request.getSession().getAttribute("user");

            String oldavata = curentAccount.getAvatar();

            // Lấy tên tệp
            String fileName = filePart.getSubmittedFileName();
            if (!fileName.equals("") && !fileName.equals(oldavata)) {
                String uploadDirectory = upload + fileName;
                System.out.println(uploadDirectory);
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

            // lấy từ session khi người dùng đăng nhập
            Account acc = (Account) request.getSession().getAttribute("user");
            String username = acc.getUserName();

            // Lấy các Skill và profile
            AccountService accountService = AccountService.getInstance();
            // lấy account từ session
            SkillService skillService = SkillService.getInstance();
            request.setAttribute("skills", skillService.getSkills());
            request.setAttribute("user", accountService.getAccount(acc.getUserName(), acc.getPassword()));

            CV c = new CV(0, gmail, username, fullname, java.sql.Date.valueOf(dob), sex, address, profession, professionIntro, achievementDescription, serviceDescription, skills, fileName);
            CVService cvService = CVService.getInstance();
            CV newCv = cvService.createOrUpdateCV(c);
            if (newCv != null) {
                request.setAttribute("cv", newCv);
                request.getRequestDispatcher("mentor_info.jsp").forward(request, response);
            } else {
                String msg = "Create or Update Fail";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("mentor_info.jsp").forward(request, response);
            }

        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println(e);
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
