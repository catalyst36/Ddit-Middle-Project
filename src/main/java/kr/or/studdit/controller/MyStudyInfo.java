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

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.BoardVO;

@WebServlet("/myStudyInfo.do")
public class MyStudyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String std_id = request.getParameter("id");
		String bor_code = null;
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("std_id", std_id);
		map.put("str_cst", "모집");
		
		List<BoardVO> appStudy = service.getStudyList(map);
		
		map.put("str_cst", "진행");
		
		List<BoardVO> doingStudy = service.getStudyList(map);
		
		map.put("str_cst", "마감");
		
		List<BoardVO> endStudy = service.getStudyList(map);
		
		request.setAttribute("appStudy", appStudy);
		request.setAttribute("doingStudy", doingStudy);
		request.setAttribute("endStudy", endStudy);
		
		request.getRequestDispatcher("/board/doing_study.jsp").forward(request, response);
	}

}
