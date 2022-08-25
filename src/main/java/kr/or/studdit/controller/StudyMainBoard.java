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
import kr.or.studdit.vo.MyProfileVO;
import kr.or.studdit.vo.StudyMainBoardVO;

@WebServlet("/studyMainBoard.do")
public class StudyMainBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		
		//한글 처리
				request.setCharacterEncoding("UTF-8");
				
				//클라이언트 전송시 전달 데이터 받기
				
				//Session 추가해야함.
				
				
				
				
				//service객체 얻기
				IStudyMainBoardService service2 = StudyMainBoardServiceImpl.getServiceInstance();
				
				//service메소드 호출하기
				List<StudyMainBoardVO> list = service2.studyBoardList();
				//request에 결과 데이터 저장
				request.setAttribute("studyBoardAllList", list);//jsp쪽이랑 일치시켜라.
				
				//페이지로 이동
				request.getRequestDispatcher("main/studyMainBoard.jsp").forward(request, response);
				
				
	}

}
