package kr.or.studdit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.studdit.service.ImyPostService;
import kr.or.studdit.service.myPostServiceImple;
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.CommentVO;

@WebServlet("/allMyComment.do")
public class myAllComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String std_id=request.getParameter("id");
		//String bor_code=null;
		
		ImyPostService service = myPostServiceImple.getServiceInstance();
		
		List<CommentVO> mycommList = service.allMycomment(std_id);
		
		request.setAttribute("mycomment", mycommList);
		
		request.getRequestDispatcher("/create/myAllComment.jsp").forward(request, response);
	}


}
