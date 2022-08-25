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
import kr.or.studdit.vo.StudentVO;
// 회원가입 서블릿 -LWG-
@WebServlet("/signup.do")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("userid");
		String password = request.getParameter("userpassword1");
		String nname = request.getParameter("nname");
		String email = request.getParameter("e-mail");
		System.out.println("아이디는 : " + id);
		System.out.println("이메일 : " + email);
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		Map<String, String> map = new HashMap<>();
		
		map.put("std_id", id);
		map.put("sat_mail", email);
		
		String ckresult = service.checkId(map);
		System.out.println(ckresult);
		if(ckresult == null) {
			String satNum = service.searchSatNum(email);
			
			StudentVO studentVo = new StudentVO();
			studentVo.setStd_id(id);
			studentVo.setStd_pass(password);
			studentVo.setStd_nname(nname);
			studentVo.setSat_num(satNum);
			

			int result = service.insertStudent(studentVo);
			
			
			if(result == 1) {
				out.write("success");
				out.flush();
			}
		} else {
			out.write("fail");
			out.flush();
		}
		
	}

}
