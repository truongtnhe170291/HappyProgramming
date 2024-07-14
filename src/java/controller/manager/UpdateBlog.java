/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manager;
import java.io.FileOutputStream;
import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import models.Blog;
import services.VietnameseConverter;

/**
 *
 * @author DIEN MAY XANH
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                  maxFileSize = 1024 * 1024 * 10,      // 10MB
                  maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet(name="UpdateBlog", urlPatterns={"/UpdateBlog"})
public class UpdateBlog extends HttpServlet {
   
    private static final String UPLOAD_DIR = "uploads";
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateBlog</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBlog at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 
    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String blogIdStr = request.getParameter("blogId");
        String statusStr = request.getParameter("status");
        
        // Check if blogId and status parameters are missing
        if (blogIdStr == null || statusStr == null) {
            response.getWriter().write("Missing blog ID or status.");
            return;
        }

        try {
            int blogId = Integer.parseInt(blogIdStr);
            boolean status = Boolean.parseBoolean(statusStr);

            // Retrieve image part
            Part filePart = request.getPart("img");
            String fileName = filePart.getSubmittedFileName();
            String uploadDirectory = "D:\\SWP\\HappyProgramming\\web\\imgblog\\";


            // Ensure upload directory exists
            File uploadDir = new File(uploadDirectory);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // Create directories if they don't exist
            }

            // Save the file to the server
            String filePath = uploadDirectory + fileName;
            try (InputStream in = filePart.getInputStream();
                 OutputStream out = new FileOutputStream(filePath)) {
                
                byte[] buffer = new byte[4096]; // Buffer size
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
            } catch (IOException e) {
                System.out.println("Error saving file: " + e.getMessage());
                fileName = "default_blog_img.jpg"; // Handle default image if saving fails
            }

            // Get other form data
            String link = VietnameseConverter.removeDiacritics(request.getParameter("link"));

            // Update the database
            BlogDAO blogDAO = new BlogDAO();
            boolean isUpdated = blogDAO.updateBlog(blogId, fileName, link, status);

            // Redirect based on success or failure
            if (isUpdated) {
                response.sendRedirect("ManagerBlog"); // Redirect on success
            } else {
                response.getWriter().write("Failed to update blog."); // Write message on failure
            }

        } catch (NumberFormatException | IOException | ServletException e) {
            response.getWriter().write("Error processing request: " + e.getMessage());
        }
    }
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
