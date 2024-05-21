/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author 84979
 */
@WebServlet(name="SendNewOtpServlet", urlPatterns={"/SendNewOtp"})
public class SendNewOtpServlet extends HttpServlet {
   

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String gmail = (String) session.getAttribute("gmail");

        if (gmail != null && !gmail.isEmpty()) {
            int otpvalue = new Random().nextInt(1255650);

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("minhvqhe176726@fpt.edu.vn", "uwdu ufxk lpae tojc");
                }
            });

            try {
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress("minhvqhe176726@fpt.edu.vn"));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(gmail));
                message.setSubject("OTP Reset");
                message.setText("Your new OTP is: " + otpvalue);
                Transport.send(message);
                System.out.println("New OTP sent successfully");

                session.setAttribute("otp", otpvalue);
                request.setAttribute("message", "New OTP sent to your email id");
                request.getRequestDispatcher("EnterOtp.jsp").forward(request, response);
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.setAttribute("message", "Error: Gmail not found in session.");
            request.getRequestDispatcher("EnterOtp.jsp").forward(request, response);
        }
    }
}



