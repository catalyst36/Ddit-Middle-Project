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
 * Servlet implementation class CommentDelete
 */
@WebServlet("/commentDelete.do")
public class CommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		String cmt_code = request.getParameter("code");
		
		int result = service.deleteComment(cmt_code);
		
		if(result > 0) {
			System.out.println("삭제된 행 : " + result);
		}
	}

}
