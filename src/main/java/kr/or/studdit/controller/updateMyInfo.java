package kr.or.studdit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.MyProfileVO;

@WebServlet("/updateMyInfo.do")
public class updateMyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String std_pass = request.getParameter("uppass");
		String std_nname = request.getParameter("upnnane");
		
		HttpSession session = request.getSession();
		
		MyProfileVO sessionVo = (MyProfileVO) session.getAttribute("myprofile");
		

		
		sessionVo.setStd_pass(std_pass);
		sessionVo.setStd_nname(std_nname);
		sessionVo.setStd_id(sessionVo.getStd_id());
		
		
		IStudditService service= StudditServiceImpl.getServiceInstance();
		
		int result = service.updateMyInfo(sessionVo);
		
		session.setAttribute("myprofile", sessionVo);
		
		request.setAttribute("newInfo", result);
		
		response.sendRedirect(request.getContextPath()+"/create/myPage.jsp");
	}

}
