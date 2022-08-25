package kr.or.studdit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;

@WebServlet("/studyMemberDelete.do")
public class StudyMemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String std_id = request.getParameter("id");
		String bor_code = request.getParameter("code");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("std_id", std_id);
		map.put("bor_code", bor_code);
		
		int result = service.deleteStudyMember(map);
		
		if(result > 0) {
			out.write("success");
			out.flush();
		}else {
			out.write("fail");
			out.flush();
		}
		
	}

}
