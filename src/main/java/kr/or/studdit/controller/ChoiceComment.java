package kr.or.studdit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.CommentVO;
import kr.or.studdit.vo.MyProfileVO;

@WebServlet("/choiceComment.do")
public class ChoiceComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		MyProfileVO vo = (MyProfileVO)session.getAttribute("myprofile");
		
		int temp = vo.getStd_mil();
		temp = temp + 40;
		
		vo.setStd_mil(temp);
		
		session.setAttribute("myprofile", vo);
		
		String cmt_code = request.getParameter("code");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		int result = service.updateChoice(cmt_code);
		String std_id = service.getChoiceStd(cmt_code);
		int update = service.giveChoiceMile(std_id);
		
		out.write(result);
		out.flush();
	}

}
