package controller.common;

import controllers.*;
import dal.SignUpDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.Base64;
import models.Account;

@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public static String decodeString(String encodedValue) {
        byte[] decodedBytes = Base64.getDecoder().decode(encodedValue);
        return new String(decodedBytes);
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");
        RequestDispatcher dispatcher = null;

        if (value == otp) {
            String accountDetails = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("detail")) {
                        accountDetails = cookie.getValue();
                        Cookie cookieToDelete = new Cookie("detail", "");
                        cookieToDelete.setMaxAge(0);
                        response.addCookie(cookieToDelete);
                        break;
                    }
                }
            }

            if (accountDetails != null) {
                String[] details = accountDetails.split("\\|");
                String gmail = details[0];
                String userName = details[1];
                String fullName = decodeString(details[2]);
                String password = details[3];
                Date dob = Date.valueOf(details[4]);
                boolean sex = "female".equalsIgnoreCase(details[5]);
                String address = decodeString(details[6]);
                String phone = details[7];
                int roleId = Integer.parseInt(details[8]);

                Account account = new Account();
                account.setGmail(gmail);
                account.setUserName(userName);
                account.setFullName(fullName);
                account.setPassword(password);
                account.setDob(dob);
                account.setSex(sex);
                account.setAddress(address);
                account.setPhone(phone);
                account.setRoleId(roleId);
                account.setStatusId(1);
                account.setAvatar("defaultAcount.jpg");

                SignUpDAO signUpDAO = new SignUpDAO();
                boolean success = false;
                if (signUpDAO.signUp(account)) {
                    success = true;
                    if (account.getRoleId() == 1) {
                        signUpDAO.insertMentee(account.getUserName());
                        success = true;
                    } else if (account.getRoleId() == 2) {
                        signUpDAO.insertMenter(account.getUserName());
                        success = true;
                    }
                }

                if (success) {
                    request.setAttribute("email", request.getParameter("email"));
                    request.setAttribute("messaget", "Success signup account.");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("message", "Failed to create account.");
                    dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                request.setAttribute("message", "Account details not found in cookies.");
                dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("message", "wrong otp");
            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
            dispatcher.forward(request, response);
        }
    }
}
