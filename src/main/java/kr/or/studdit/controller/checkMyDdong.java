package kr.or.studdit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.studdit.dao.myPostDaoImpl;
import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.ImyPostService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.BoardVO;

@WebServlet("/checkMyDdong.do")
public class checkMyDdong extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bor_code=request.getParameter("code");
		String nav = request.getParameter("nav");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		BoardVO boardVo = service.selectBoard(bor_code);

		request.setAttribute("boardInfo", boardVo);
	}



}
