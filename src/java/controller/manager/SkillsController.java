package controller.manager;

import dal.SkillDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import models.Skill;
import java.util.ArrayList;
import java.util.List;
import services.VietnameseConverter;

@WebServlet(name = "SkillsController", urlPatterns = {"/skills"})
@MultipartConfig
public class SkillsController extends HttpServlet {

    private SkillDAO skillDAO;

    @Override
    public void init() {
        skillDAO = new SkillDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            SkillDAO skillDAO = new SkillDAO();

            String pageParam = request.getParameter("page");
            int page = pageParam != null ? Integer.parseInt(pageParam) : 1;
            int pageSize = 3;

            String statusParam = request.getParameter("status");
            String skillName = request.getParameter("skillName");

            Boolean status = null;
            if (statusParam != null && !statusParam.isEmpty()) {
                status = Boolean.parseBoolean(statusParam);
            }

            List<Skill> skills = new ArrayList<>();
            int totalSkills = 0;

            if (status != null && skillName != null && !skillName.isEmpty()) {
                skills = skillDAO.getAllSkillByStatusAndSkillName(status, skillName, page, pageSize);
                totalSkills = skillDAO.getCountSkillByStatusAndSkillName(status, skillName);
            } else if (status != null) {
                skills = skillDAO.getAllSkillByStatus(status, page, pageSize);
                totalSkills = skillDAO.getCountSkillByStatus(status);
            } else if (skillName != null && !skillName.isEmpty()) {
                skills = skillDAO.getAllSkillBySkillName(skillName, page, pageSize);
                totalSkills = skillDAO.getCountSkillBySkillName(skillName);
            } else {
                skills = skillDAO.getAllSkills(page, pageSize);
                totalSkills = skillDAO.getCountSkill();
            }

            int totalPages = (int) Math.ceil((double) totalSkills / pageSize);

            request.setAttribute("skills", skills);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("status", statusParam);
            request.setAttribute("skillName", skillName);

            request.getRequestDispatcher("Manager_Skill.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int skillID = Integer.parseInt(request.getParameter("skillID"));
            String skillName = VietnameseConverter.removeDiacritics(request.getParameter("skillName"));
            String description = VietnameseConverter.removeDiacritics(request.getParameter("description"));
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            // Handle file upload
            Part filePart = request.getPart("img"); // Retrieves <input type="file" name="img">

            // Check if a new file is uploaded
            String fileName = null;
            if (filePart != null && filePart.getSize() > 0) {
                fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                // Specify the directory to save uploaded files
                String uploadDirectory = "C:\\Users\\ADMIN\\Documents\\GitHub\\HappyProgramming\\web\\img";

                // Check if the file already exists in the upload directory
                File uploadDir = new File(uploadDirectory);
                File existingFile = new File(uploadDir, fileName);

                // If the file already exists, delete it
                if (existingFile.exists()) {
                    existingFile.delete();
                }

                // Save the file to the specified directory
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, Paths.get(uploadDirectory, fileName), StandardCopyOption.REPLACE_EXISTING);
                }
            }

            // Update the skill in your DAO or database
            skillDAO.updateSkill(skillID, skillName, fileName, description, status);

            // Redirect back to skills page or wherever needed
            response.sendRedirect("skills");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
