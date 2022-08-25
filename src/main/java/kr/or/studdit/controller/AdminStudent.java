package kr.or.studdit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.StudentVO;

@WebServlet("/adminStudent.do")
public class AdminStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		List<StudentVO> AllStudent = service.AllStudent();
		
		Gson gson = new Gson();
		String json = gson.toJson(AllStudent);
		System.out.println(json);
		out.write(json);
		response.flushBuffer();
		
	}
}
