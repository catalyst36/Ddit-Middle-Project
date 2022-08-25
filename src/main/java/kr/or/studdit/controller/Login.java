package kr.or.studdit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.StudentVO;

@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		StudentVO studentVo = new StudentVO();
		
		
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		studentVo.setStd_id(id);
		studentVo.setStd_pass(password);
		
		
		System.out.println(id + password);
		System.out.println(service.studentLogin(studentVo));
		
		studentVo = service.studentLogin(studentVo);
		
		HttpSession session = request.getSession();
		session.setAttribute("stdinfo", studentVo);
		
		Gson gson = new Gson();
		String json = gson.toJson(studentVo);
		out.write(json);
		response.flushBuffer();
	}

}
