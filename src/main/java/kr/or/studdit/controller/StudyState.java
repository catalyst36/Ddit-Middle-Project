package kr.or.studdit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.MyProfileVO;
import kr.or.studdit.vo.RecruitVO;
import kr.or.studdit.vo.StudyRoomVO;

@WebServlet("/studyState.do")
public class StudyState extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String bor_code = request.getParameter("code");
		String state = request.getParameter("state");
		String std_id = request.getParameter("id");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		StudyRoomVO studyRoomVo = new StudyRoomVO();
		
		studyRoomVo.setBor_code(bor_code);
		studyRoomVo.setStr_cst(state);
		
		if(state.equals("마감")) {
			List<RecruitVO> recruitList = service.getStudyMember(bor_code);
			for(int i=0;i<recruitList.size();i++) {
				int update = service.giveStudyMileage(recruitList.get(i));
				
				HttpSession session = request.getSession();
				MyProfileVO profile = (MyProfileVO)session.getAttribute("myprofile"); 
				int mil = profile.getStd_mil();
				profile.setStd_mil(mil + 100);
				
				session.setAttribute("myprofile", profile);
			}
		}
		

		

		
		int result = service.updateStudyState(studyRoomVo);
		
		if(result>0) {
			request.getRequestDispatcher("/myStudyInfo.do?id="+std_id).forward(request, response);
		}
	}
}
