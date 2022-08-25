package kr.or.studdit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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



@WebServlet("/insertToBoard.do")
public class InsertToBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MyProfileVO sessionVo = (MyProfileVO) session.getAttribute("myprofile");
		MyProfileVO vo = new MyProfileVO(); 
		
		
		String std_id = sessionVo.getStd_id();
		String bor_name = request.getParameter("category");
		String bor_area = request.getParameter("lan");
		String bor_tit = request.getParameter("title");
		String bor_con = request.getParameter("content");
		
		
		IStudyMainBoardService service = StudyMainBoardServiceImpl.getServiceInstance();
		List<InsertBoardVO> list= service.getAllBoardVo();
		System.out.println(list.size());
		InsertBoardVO bvo= new InsertBoardVO();
		
		int temp = 0;
		for(int i=0;i<list.size();i++) {
			if(temp < list.get(i).getBor_code()) {
				temp = list.get(i).getBor_code();
			}
		}
		
		int bor_code = temp + 1;
		
		bvo.setStd_id(std_id);	
		bvo.setBor_code(bor_code);
		bvo.setBor_name(bor_name);
		bvo.setBor_area(bor_area);
		bvo.setBor_tit(bor_tit);
		bvo.setBor_con(bor_con);

		service.insertToBoard(bvo);
		
		if(bor_name.equals("스터디")) {
			InsertBoardVO bvo2 = new InsertBoardVO();
			
			bvo2.setBor_code(bor_code);
			bvo2.setStd_id(std_id);
			
			service.insertToStudyBoard(bvo2);
			
			IStudditService service2 = StudditServiceImpl.getServiceInstance();
			Map<String, String> map = new HashMap<String, String>();
			
			String bor_code2 = String.valueOf(bor_code);
			
			map.put("std_id", std_id);
			map.put("bor_code", bor_code2);
			
			int result = service2.insertStudyMember(map);
		}
		
		
		
		if("스터디".equals(bor_name)) {
			request.getRequestDispatcher("/board/board.jsp").forward(request, response);
		}else if("질문".equals(bor_name)) {
			request.getRequestDispatcher("/help/help.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/free/free_board.jsp").forward(request, response);
		}
	}

}
