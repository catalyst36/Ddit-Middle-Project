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
import kr.or.studdit.service.IStudyMainBoardService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.service.StudyMainBoardServiceImpl;
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.InsertBoardVO;
import kr.or.studdit.vo.MyProfileVO;
import kr.or.studdit.vo.StudyMainBoardVO;

@WebServlet("/updateToBoard.do")
public class UpdateToBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		
				//한글 처리
				request.setCharacterEncoding("UTF-8");
				
				/*
				 * String std_pass = request.getParameter("uppass"); String std_nname =
				 * request.getParameter("upnnane");
				 * 
				 * HttpSession session = request.getSession();
				 * 
				 * MyProfileVO sessionVo = (MyProfileVO) session.getAttribute("myprofile");
				 * 
				 * MyProfileVO vo = new MyProfileVO();
				 * 
				 * vo.setStd_pass(std_pass); vo.setStd_nname(std_nname);
				 * vo.setStd_id(sessionVo.getStd_id());
				 * 
				 * IStudditService service= StudditServiceImpl.getServiceInstance();
				 * 
				 * int result = service.updateMyInfo(vo);
				 * 
				 * request.setAttribute("newInfo", result);
				 */
				
				
				//클라이언트 전송시 전달 데이터 받기
				
				//service객체 얻기 
				IStudyMainBoardService service2 = StudyMainBoardServiceImpl.getServiceInstance();
				
				//service메소드 호출하기
				List<InsertBoardVO> list = service2.getAllBoardVo();
				
				
				//request에 결과 데이터 저장
				
				request.setAttribute("getAllBoardVo", list);//jsp쪽이랑 일치시켜라.
				
				//페이지로 이동
				request.getRequestDispatcher("main/updateToBoard.jsp").forward(request, response);
				
				
	}

}
