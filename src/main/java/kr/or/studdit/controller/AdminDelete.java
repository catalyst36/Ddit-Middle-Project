package kr.or.studdit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;

/**
 * Servlet implementation class AdminDelete
 */
@WebServlet("/adminDelete.do")
public class AdminDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 
		String stdId = request.getParameter("id");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		int result = service.adminDelete(stdId);
		
		response.sendRedirect(request.getContextPath() + "/admin/adminpage.jsp");
		
	}


}
