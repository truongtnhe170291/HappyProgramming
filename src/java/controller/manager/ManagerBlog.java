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
        BlogDAO blogdao = new BlogDAO();
        List<Blog> blog = blogdao.getBlogs();
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("Manager_Blog.jsp").forward(request, response);
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

            // Check if file name exists and handle default if not
            if (fileName == null || fileName.isEmpty()) {
                fileName = "default_blog_img.jpg";
            }

            // Save the file to the server
            String uploadDirectory = "D:\\SWP\\HappyProgramming\\web\\imgblog\\";
            String filePath = uploadDirectory + fileName;
            try (OutputStream out = new FileOutputStream(filePath)) {
                InputStream in = filePart.getInputStream();
                byte[] bytes = new byte[in.available()];
                int bytesRead = in.read(bytes);
                if (bytesRead != -1) {
                    out.write(bytes);
                } else {
                    System.out.println("No bytes read from the input stream.");
                    fileName = "default_blog_img.jpg"; // Handle default image if saving fails
                }
            } catch (IOException e) {
                e.printStackTrace(); // Print the stack trace for more details
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
        } catch (Exception ex) {
            // Handle errors
            ex.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while creating the blog: " + ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
