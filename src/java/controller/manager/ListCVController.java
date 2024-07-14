/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.CVDAO;
import dal.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.CV;
import models.CVDTO;
import models.Skill;
import models.Status;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ListCVController", urlPatterns = {"/listCV"})
public class ListCVController extends HttpServlet {

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
            out.println("<title>Servlet ListCVController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListCVController at " + request.getContextPath() + "</h1>");
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
        String statusFilter = request.getParameter("statusFilter");
        String searchName = request.getParameter("searchName");
        String pageParam = request.getParameter("page");
        int page = pageParam != null ? Integer.parseInt(pageParam) : 1;
        int pageSize = 3; // Number of CVs per page

        CVDAO dao = new CVDAO();
        List<CVDTO> list;
        int totalCVs;

        if ((statusFilter == null || statusFilter.isEmpty()) && (searchName == null || searchName.isEmpty())) {
            // Không Search, Không Filter
            list = dao.getAllCV(page, pageSize);
            totalCVs = dao.getTotalCVCount();
        } else if (statusFilter == null || statusFilter.isEmpty()) {
            // Không Filter, chỉ Search
            list = dao.searchCVByMentorName(searchName, page, pageSize);
            totalCVs = dao.getTotalCVCountByMentorName(searchName);
        } else if (searchName == null || searchName.isEmpty()) {
            // Chỉ Filter, không Search
            int statusId = Integer.parseInt(statusFilter);
            list = dao.getCVByStatus(statusId, page, pageSize);
            totalCVs = dao.getTotalCVCountByStatus(statusId);
        } else {
            // Search và Filter
            int statusId = Integer.parseInt(statusFilter);
            list = dao.searchCVByMentorNameAndStatus(searchName, statusId, page, pageSize);
            totalCVs = dao.getTotalCVCountByMentorNameAndStatus(searchName, statusId);
        }

        int totalPages = (int) Math.ceil((double) totalCVs / pageSize);

        // Đặt các thuộc tính cho request để chuyển tiếp đến trang JSP
        request.setAttribute("cvList", list);
        request.setAttribute("statusList", dao.getAllStatuses());
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("statusFilter", statusFilter);
        request.setAttribute("searchName", searchName);

        // Chuyển hướng đến trang listCV.jsp
        request.getRequestDispatcher("listCV.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        throw new ServletException("Database error: " + e.getMessage());
    } 
}


    public static void main(String[] args) {
        CVDAO dao = new CVDAO();
        List<CVDTO> list = dao.getAllCV(1, 5);
         List<Status> statusList = dao.getAllStatuses();
        System.out.println(list);
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
        CVDAO dao = new CVDAO();
        List<CVDTO> list = dao.getAllCV(1,3);
        request.setAttribute("cvList", list);
        request.getRequestDispatcher("listCV.jsp").forward(request, response);
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
