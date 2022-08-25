package kr.or.studdit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.studdit.service.IuploadFileService;
import kr.or.studdit.service.UploadFileServiceImpl;
import kr.or.studdit.vo.MyProfileVO;
import kr.or.studdit.vo.StudentVO;

/**
 * Servlet implementation class deleteProPic
 */
@WebServlet("/deleteProPic.do")
public class deleteProPic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		MyProfileVO profilevo = (MyProfileVO)session.getAttribute("myprofile");
		StudentVO stdVo = new StudentVO();
		
		
		String stdId = profilevo.getStd_id();
		
		IuploadFileService service = UploadFileServiceImpl.getServiceUpInstance();
		
		int cnt = service.delProfile(stdId);
		
		response.sendRedirect(request.getContextPath()+"/create/myPage.jsp" );
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
