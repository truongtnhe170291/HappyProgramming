package controller.manager;

import dal.SkillDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import models.Skill;
import services.VietnameseConverter;

@WebServlet(name = "CreateSkillController", urlPatterns = {"/createSkill"})
@MultipartConfig
public class CreateSkillController extends HttpServlet {

    private SkillDAO skillDAO;

    public void init() {
        skillDAO = new SkillDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String skillName = VietnameseConverter.removeDiacritics(request.getParameter("skillName"));
        Part filePart = request.getPart("img"); // Retrieves <input type="file" name="img">
        String description = VietnameseConverter.removeDiacritics(request.getParameter("description"));
        boolean status = true; // Default status to active

        String fileName = getFileName(filePart);
        //C:\Users\ADMIN\Documents\GitHub\HappyProgramming\web\img
        String uploadPath = "C:\\Users\\ADMIN\\Documents\\GitHub\\HappyProgramming\\web\\img" + File.separator + fileName;
        
        // Save the file
        File file = new File(uploadPath);
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, file.toPath());
        }

        Skill newSkill = new Skill();
        newSkill.setSkillName(skillName);
        newSkill.setImg("img/" + fileName); // Storing the relative path to the image
        newSkill.setDescription(description);
        newSkill.setStatus(status);
        
        skillDAO.saveSkill(newSkill);
        response.sendRedirect("skills");
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
