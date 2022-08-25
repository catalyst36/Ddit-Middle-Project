package kr.or.studdit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import kr.or.studdit.service.IStudditService;
import kr.or.studdit.service.StudditServiceImpl;
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.PageVO;

@WebServlet("/helpList.do")
public class HelpList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		int cpage = Integer.parseInt(request.getParameter("page"));
		System.out.println(cpage);
		String sword = request.getParameter("sword");
		String search = request.getParameter("ssearch");
		String area = request.getParameter("type-area");
		String tit = request.getParameter("type-tit");
		String cst = request.getParameter("cst");
		
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		PageVO vo = service.pageInfo(cpage, cst, area, tit, sword, search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cst", cst);
		map.put("area", area);
		map.put("tit", tit);
		map.put("sword", sword);
		map.put("ssearch", search);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		map.put("name", "질문");
		
		List<BoardVO> list = service.selectByHelp(map);
		

		JsonObject obj = new JsonObject();
		obj.addProperty("tpage", vo.getTotalPage());
		obj.addProperty("spage", vo.getStartPage());
		obj.addProperty("epage", vo.getEndPage());
		
		Gson  gson = new Gson();
		
		JsonElement  slist = gson.toJsonTree(list);
		obj.add("lists", slist);
		
		out.print(obj);
		out.flush();
	}

}
