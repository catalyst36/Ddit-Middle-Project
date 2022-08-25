package kr.or.studdit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.IuploadFileService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.service.UploadFileServiceImpl;
import kr.or.studdit.vo.MyProfileVO;
import kr.or.studdit.vo.StudentVO;

@WebServlet("/testMyProfile.do")
public class TestMyProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestMyProfile() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String std_id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		IuploadFileService fileService = UploadFileServiceImpl.getServiceUpInstance();
		
		MyProfileVO vo = service.myProfile(std_id);
		
		if(vo.getStd_mil() >= 500 && !vo.getStd_tier().equals("실버")) {
			//실버
			vo.setStd_tier("실버");
			int result = service.updateTier(vo);
		}else if(vo.getStd_mil() >= 1000 && vo.getStd_mil() < 1500 && !vo.getStd_tier().equals("골드")) {
			//골드
			vo.setStd_tier("골드");
			int result = service.updateTier(vo);
		}else if(vo.getStd_mil() >= 1500 && vo.getStd_mil() < 2000 && !vo.getStd_tier().equals("플레티넘")) {
			//플레
			vo.setStd_tier("플레티넘");
			int result = service.updateTier(vo);
		}else if(vo.getStd_mil() >= 2000 && !vo.getStd_tier().equals("다이아몬드")) {
			//다이아
			vo.setStd_tier("다이아몬드");
			int result = service.updateTier(vo);
		}

		String img = vo.getSat_phot();
		
		if(img == null) {
			img =  "basicProfile.png";
		}
		
		vo.setSat_phot(img);
		
		session.setAttribute("myprofile", vo);
		
		if(std_id.equals("DDIT1004")) {
			response.sendRedirect(request.getContextPath() + "/admin/adminpage.jsp");
		}else {
			response.sendRedirect(request.getContextPath() + "/main/index.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
