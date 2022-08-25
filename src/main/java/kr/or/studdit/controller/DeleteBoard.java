package kr.or.studdit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;

@WebServlet("/deleteBoard.do")
public class DeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		String bor_code = request.getParameter("code");
		String nav = request.getParameter("nav");
		
		int result = service.deleteBoard(bor_code);
		
		if("스터디".equals(nav)) {
			response.sendRedirect(request.getContextPath() + "/board/board.jsp");
		}else if("질문".equals(nav)) {
			response.sendRedirect(request.getContextPath() + "/help/help.jsp");
		}else {
			response.sendRedirect(request.getContextPath() + "/free/free_board.jsp");
		}
	}

}
