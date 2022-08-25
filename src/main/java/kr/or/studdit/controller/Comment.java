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

@WebServlet("/comment.do")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		String cmt_con = request.getParameter("reply");
		String bor_code = request.getParameter("bor_code");
		String std_id = request.getParameter("std_id");
		String cmt_code = request.getParameter("cmt_code");
		String nav = request.getParameter("nav");
		cmt_con = cmt_con.replace("\r\n", "<br>");
		
		CommentVO reqVo = new CommentVO();
		BoardVO boardVo = service.selectBoard(bor_code);
		
		reqVo.setCmt_con(cmt_con);
		reqVo.setBor_code(bor_code);
		reqVo.setStd_id(std_id);
		reqVo.setCmt_code(cmt_code);
		
		int result = service.insertComment(reqVo);
		
		
		System.out.println(result);
		request.setAttribute("code", bor_code);
		request.setAttribute("boardInfo", boardVo);
		
		System.out.println("comment :" + nav);
		
		//response.sendRedirect(request.getContextPath() + "/board/board_detail.jsp");
		if("질문".equals(nav) && nav != null) {
			request.getRequestDispatcher("/help/help_detail.jsp").forward(request, response);
		}else if("자유".equals(nav) && nav != null) {
			System.out.println("니가 나와야된다");
			request.getRequestDispatcher("/free/free_board_detail.jsp").forward(request, response);
		}
		else {
			List<RecruitVO> recruitList = service.getStudyMember(bor_code);
			request.setAttribute("memberList", recruitList);
			request.getRequestDispatcher("/board/board_recruit.jsp").forward(request, response);
		}
			
	}

}
