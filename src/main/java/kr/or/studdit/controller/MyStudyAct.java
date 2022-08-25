package kr.or.studdit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.StudyActVO;

@WebServlet("/myStudyAct.do")
public class MyStudyAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String bor_code = request.getParameter("bor_code");
		String[] members = request.getParameterValues("member");
		String act_tit = request.getParameter("act_tit");
		String act_con = request.getParameter("act_con");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		StudyActVO studyActVo = new StudyActVO();
		
		studyActVo.setBor_code(bor_code);
		studyActVo.setAct_tit(act_tit);
		studyActVo.setAct_con(act_con);
		
		int result = service.insertAct(studyActVo);
		
		String act_code = service.getActCode(bor_code);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("bor_code", bor_code);
		map.put("act_code", act_code);		
		
		for(int i=0;i<members.length;i++) {
			map.put("std_id", members[i]);
			service.actStudyMember(map);
		}
		
		request.getRequestDispatcher("/myStudyDetail.do?code="+bor_code).forward(request, response);
	}
}
