package kr.or.studdit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;

@WebServlet("/commentUpdate.do")
public class CommentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String cmt_code = request.getParameter("code");
		String cmt_con = request.getParameter("con");
	
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		Map<String, String> map = new HashMap<String, String>();
		
		
		
		map.put("cmt_code", cmt_code);
		map.put("cmt_con", cmt_con);
		
		int result = service.updateComment(map);
		
		if(result > 0) {
			System.out.println("업데이트된 행 : " + result);
		}
	}
}
