package kr.or.studdit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.PasswordAuthentication;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;

// PASSWORD찾기 -LWG-
@WebServlet("/findPass.do")
public class FindPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		Map<String, String> map = new HashMap<>();
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String mail = request.getParameter("e-mail");
		
		map.put("sat_name", name);
		map.put("std_id", id);
		map.put("sat_mail", mail);
		
		String result = service.findPass(map);
		if(result != null) {
			
			String host = "smtp.naver.com"; // 네이버 메일 사용
			final String user = "dlddu20@naver.com"; // 관리자 메일
			final String password = "bj!qksksk214!"; 
			
			String to = mail;
			
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
		    props.put("mail.smtp.starttls.enable", "true");
			
			
		    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {  // 설정값을 저장하여 세션 생성
		    	protected PasswordAuthentication getPasswordAuthentication() {
		    		return new PasswordAuthentication(user, password);      // 관리자 PASSWORD 인증
		    	}
	        });
			
			try {
				MimeMessage message = new MimeMessage(session);
				
				message.setFrom(new InternetAddress(user));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
				message.setSubject("Studdit Send Mail Missing Password");
				message.setText("Your password : " + result);
				Transport.send(message);
				
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		    
			
			result = "Protected console";
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(result);
		System.out.println(json);
		out.write(json);
		response.flushBuffer();
	}

}
