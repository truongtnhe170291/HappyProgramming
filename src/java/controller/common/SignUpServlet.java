package controller.common;

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
import java.time.LocalDate;
import java.util.Base64;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import models.Account;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    final SignUpDAO signUpDAO = new SignUpDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sign_up.jsp").forward(request, response);
    }

    public static String encodeString(String value) {
        return Base64.getEncoder().encodeToString(value.getBytes());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gmail = request.getParameter("email");
        String userName = request.getParameter("username");
        String fullName = request.getParameter("fullname");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        String stringDateFrom = request.getParameter("Dob");
        String sex = request.getParameter("sex");
        String address = request.getParameter("Address");
        String phone = request.getParameter("tel");
        String role = request.getParameter("role");
        Date dateFrom;
        gmail = gmail.replaceAll("[^\\x20-\\x7e]", "");
        try {
            if (stringDateFrom == null || stringDateFrom.isEmpty()) {
                dateFrom = Date.valueOf(LocalDate.MIN);
            } else {
                dateFrom = Date.valueOf(stringDateFrom);
            }
        } catch (IllegalArgumentException e) {
            dateFrom = Date.valueOf(LocalDate.MIN);
            e.printStackTrace();
        }

        if (gmail != null && !gmail.isEmpty() && confirm_password.equals(password)) {
            Account account = new Account();
            account.setGmail(gmail);
            account.setUserName(userName);
            account.setFullName(fullName);
            account.setPassword(password);
            account.setDob(dateFrom);
            account.setSex(sex.equalsIgnoreCase("female"));
            account.setAddress(address);
            account.setPhone(phone);
            account.setRoleId(Integer.parseInt(role));
            account.setStatusId(1);
            if (signUpDAO.isDuplicateAccount(userName)) {
                request.setAttribute("error", "Username already exists.");
                request.getRequestDispatcher("sign_up.jsp").forward(request, response);
                return;
            }
            String encodedFullName = encodeString(fullName);
            String encodedAddress = encodeString(address);
            String accountDetails = gmail + "|" + userName + "|" + encodedFullName + "|" + password + "|" + dateFrom + "|" + (account.isSex() ? "female" : "male") + "|" + encodedAddress + "|" + phone + "|" + role;
            Cookie accountCookie = new Cookie("detail", accountDetails);
            accountCookie.setMaxAge(10 * 60);
            response.addCookie(accountCookie);
            RequestDispatcher dispatcher = null;
            int otpvalue = 0;
            HttpSession mySession = request.getSession();

            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            String to = gmail;
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("minhvqhe176726@fpt.edu.vn", "uwdu ufxk lpae tojc");																								// password here
                }
            });
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(gmail));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Hello");
                message.setText("your OTP is: " + otpvalue);
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
            request.setAttribute("message", "OTP is sent to your gmail id");
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("gmail", gmail);
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("error", "password not the same confirm password");
        }

    }
}
