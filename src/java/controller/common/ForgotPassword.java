package controller.common;

import dal.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
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

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                  request.getRequestDispatcher("forget-password.jsp").forward(request, response);
    }
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();
        AccountDAO ac = new AccountDAO();
        try {
            if (username!= null && email != null && !email.equals("") && ac.isUsermailAndEmailExists(username,email)) {
                Random rand = new Random();
                otpvalue = rand.nextInt(1255650);

                String to = email; 
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("minhvqhe176726@fpt.edu.vn", "uwdu ufxk lpae tojc"); 
                    }
                });

                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress("minhvqhe176726@fpt.edu.vn")); 
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("Hello");
                    message.setText("Your OTP is: " + otpvalue);
                    Transport.send(message);
                    System.out.println("Message sent successfully");
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                long currentTime = System.currentTimeMillis();
                long expiryTime = currentTime + 30 * 1000; 

                dispatcher = request.getRequestDispatcher("confirmOtp.jsp");
                request.setAttribute("messages", "OTP is sent to your email id");
                mySession.setAttribute("otps", otpvalue);
                mySession.setAttribute("otps_expiry", expiryTime); 
                mySession.setAttribute("emails", email);        
                mySession.setAttribute("username_newpass", username);    
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("messages", "Username or Email does not exist");
                dispatcher = request.getRequestDispatcher("forget-password.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("messages", "Error: " + e.getMessage());
            dispatcher = request.getRequestDispatcher("forget-password.jsp"); 
            dispatcher.forward(request, response);
        }
    }
}
