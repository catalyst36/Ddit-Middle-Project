package kr.or.studdit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.SatisVO;
import kr.or.studdit.vo.StudentVO;

// 아이디 찾기 -LWG-

@WebServlet("/find.do")
public class Find extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		SatisVO satisVo = new SatisVO();
		
		String name = request.getParameter("id");
		String mail = request.getParameter("e-mail");
		
		satisVo.setSat_name(name);
		satisVo.setSat_mail(mail);
		
		
		
		String fid = service.findId(satisVo);
		System.out.println(fid);
		
		Gson gson = new Gson();
		String json = gson.toJson(fid);
		System.out.println(json);
		out.write(json);
		response.flushBuffer();
	}

}
