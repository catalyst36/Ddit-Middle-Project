package kr.or.studdit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.ActMemberVO;
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.RecruitVO;
import kr.or.studdit.vo.StudyActVO;

@WebServlet("/myStudyDetail.do")
public class MyStudyDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String bor_code = request.getParameter("code");
		String any = request.getParameter("any");
		String ani = request.getParameter("ani");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		BoardVO boardVo = service.selectBoard(bor_code);
		List<RecruitVO> recruitList = service.getStudyMember(bor_code);
		List<StudyActVO> actList = service.getActList(bor_code);
		List<String[]> actMemberList = new ArrayList<String[]>();
		for(int i=0;i<actList.size();i++) {
			List<ActMemberVO> list = service.getActMember(actList.get(i).getAct_code());
			String[] arr = new String[list.size()];
			for(int j=0;j<arr.length;j++) {
				arr[j] = list.get(j).getStd_id();
			}
			actMemberList.add(arr);
		}
		
		request.setAttribute("actList", actList);
		request.setAttribute("boardInfo", boardVo);
		request.setAttribute("memberList", recruitList);
		request.setAttribute("actMemberList", actMemberList);
		
		if(any != null) {
			request.getRequestDispatcher("/board/doing_study_noupdate.jsp").forward(request, response);
		} else if(ani != null) {
			request.getRequestDispatcher("/board/board_recruit.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/board/doing_study_detail.jsp").forward(request, response);
		}
		
		
	}

}
