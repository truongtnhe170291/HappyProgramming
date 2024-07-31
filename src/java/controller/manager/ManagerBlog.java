/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import java.io.InputStream;
import java.io.OutputStream;
import dal.BlogDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

import java.io.FileOutputStream;

import java.util.List;
import models.Blog;
import services.VietnameseConverter;

/**
 *
 * @author DIEN MAY XANH
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet(name = "ManagerBlog", urlPatterns = {"/ManagerBlog"})
public class ManagerBlog extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
            BlogDAO blogdao = new BlogDAO();
            List<Blog> blog = blogdao.getBlogs();
            request.setAttribute("blog", blog);
            request.getRequestDispatcher("Manager_Blog.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            response.sendRedirect("PageError");
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
        try {
            // Retrieve image part
            Part filePart = request.getPart("img");
            String fileName = filePart.getSubmittedFileName();
            String uploadDirectory = "D:\\TaiLieu\\SWP391\\HappyProgramming\\web\\imgblog\\"; // Ensure trailing backslash

// Ensure upload directory exists
            File uploadDir = new File(uploadDirectory);
            if (!uploadDir.exists()) {
                if (uploadDir.mkdirs()) {
                    System.out.println("Upload directory created.");
                } else {
                    System.out.println("Failed to create upload directory.");
                }
            }

// Save the file to the server
            String filePath = uploadDirectory + fileName;
            try (InputStream in = filePart.getInputStream(); OutputStream out = new FileOutputStream(filePath)) {

                byte[] buffer = new byte[4096]; // Buffer size
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
                System.out.println("File saved successfully: " + filePath);
            } catch (IOException e) {
                System.out.println("Error saving file: " + e.getMessage());
                fileName = "default_blog_img.jpg"; // Handle default image if saving fails
            }

            // Get other form data
            String link = VietnameseConverter.removeDiacritics(request.getParameter("link"));

            // Set the status to true by default
            boolean status = true;

            // Save to database
            BlogDAO blogDAO = new BlogDAO();
            boolean isCreated = blogDAO.createBlog(fileName, link, status);

            // Redirect or forward based on success or failure
            if (isCreated) {
                response.sendRedirect("ManagerBlog");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (ServletException | IOException ex) {
            response.sendRedirect("PageError");
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
