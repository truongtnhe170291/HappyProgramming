package controller.common;

import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import models.Account;

@WebServlet(name = "NewPassword", urlPatterns = {"/NewPassword"})
public class NewPassword extends HttpServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         request.getRequestDispatcher("newPassword.jsp").forward(request, response);
    } 

        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
             PrintWriter Out = response.getWriter();
		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
                String username = (String) session.getAttribute("username_newpass");
                Account a = new Account();
		          AccountDAO ac = new AccountDAO();
                          try {
                if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
                    a.setUserName(username);
                    a.setPassword(newPassword);
		
                    
                    if(ac.changePassWord(a)){
                        request.setAttribute("status", "Reset Success");
					 request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                    	        
					
				} else {
					request.setAttribute("statust", "confirm password not the same new password");
					 request.getRequestDispatcher("newPassword.jsp").forward(request, response);
				}
            } catch (Exception e) {
                request.setAttribute("statust", "error");
					 request.getRequestDispatcher("newPassword.jsp").forward(request, response);
            }
                
				
		}
	}


