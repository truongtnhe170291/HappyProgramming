package controller.common;

import controllers.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/SucessOtp")
public class SucessOtp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otps");
        long otpExpiry = (Long) session.getAttribute("otps_expiry");
        RequestDispatcher dispatcher = null;

        long currentTime = System.currentTimeMillis();
        if (currentTime > otpExpiry) {
            request.setAttribute("message", "OTP has expired");
            session.removeAttribute("otps_expiry");
            request.getRequestDispatcher("confirmOtp.jsp").forward(request, response);;

        } else {
            if (value == otp) {
                request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("newPassword.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("message", "Wrong OTP");
                dispatcher = request.getRequestDispatcher("confirmOtp.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

}
