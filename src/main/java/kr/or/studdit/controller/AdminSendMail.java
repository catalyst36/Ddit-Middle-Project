package kr.or.studdit.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminSendMail.do")
public class AdminSendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String[] mail_arr = request.getParameterValues("val");
		
		String host = "smtp.naver.com"; // 네이버 메일 사용
		final String user = "dlddu20@naver.com"; // 관리자 메일
		final String password = "bj!qksksk214!"; 
		
		String[] to = mail_arr;
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
	    props.put("mail.smtp.starttls.enable", "true");
		
	    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	    	protected PasswordAuthentication getPasswordAuthentication() {
	    		return new PasswordAuthentication(user, password);
	    	}
	    });
	    
	    try {
	    	MimeMessage message = new MimeMessage(session);
			for(int i=0; i<mail_arr.length; i++) {
				message.setFrom(new InternetAddress(user));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail_arr[i]));
				message.setSubject("Studdit Signup Page ! ! !");
				message.setText("Welcom Studdit Signup !!! : " + "http://192.168.143.28/studditproject/create/signup.jsp");
				Transport.send(message);
			}
			
	    		    	
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	    
		
		response.sendRedirect(request.getContextPath() + "/admin/adminpage.jsp");
	}

}
