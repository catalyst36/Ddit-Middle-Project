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
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.CommentVO;
import kr.or.studdit.vo.RecruitVO;

@WebServlet("/boardDetail.do")
public class BoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String bor_code = request.getParameter("code");
		String nav = request.getParameter("nav");
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		System.out.println(bor_code);
		System.out.println(nav);
		
		int hit = service.updateHit(bor_code);

		BoardVO boardVo = service.selectBoard(bor_code);

		request.setAttribute("boardInfo", boardVo);

		
		if("질문".equals(nav) && nav != null) {
			CommentVO commentVo = service.getChoiceComment(bor_code);
			request.setAttribute("choiceComment", commentVo);
			request.getRequestDispatcher("/help/help_detail.jsp").forward(request, response);
		}else if("자유".equals(nav) && nav != null) {
			request.getRequestDispatcher("/free/free_board_detail.jsp").forward(request, response);
		}
		else {
			List<RecruitVO> recruitList = service.getStudyMember(bor_code);
			request.setAttribute("memberList", recruitList);
			request.getRequestDispatcher("/board/board_recruit.jsp").forward(request, response);
		}
		
		
	}

}
