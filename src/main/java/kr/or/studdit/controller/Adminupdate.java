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

/**
 * Servlet implementation class Adminupdate
 */
@WebServlet("/adminupdate.do")
public class Adminupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

request.setCharacterEncoding("utf-8");
		
		String std_pass = request.getParameter("uppass");
		String std_nname = request.getParameter("upnname");
		String std_id = request.getParameter("upid");
		
		HttpSession session = request.getSession();
		
		MyProfileVO sessionVo = (MyProfileVO) session.getAttribute("myprofile");
		
		MyProfileVO vo = new MyProfileVO();
		
		vo.setStd_pass(std_pass);
		vo.setStd_nname(std_nname);
		vo.setStd_id(std_id);
		
		System.out.println(sessionVo.getStd_id());
		
		IStudditService service= StudditServiceImpl.getServiceInstance();
		
		System.out.println("11");
		int result = service.updateMyInfo(vo);
		System.out.println(result);
		
		response.sendRedirect("/admin/adminpage.jsp");
	}

}
