package kr.or.studdit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.RankVO;

@WebServlet("/getRank.do")
public class GetRank extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		List<RankVO> list = service.getRank();
		
		request.setAttribute("rank", list);
		
		request.getRequestDispatcher("/main/rank.jsp").forward(request, response);
	}

}
