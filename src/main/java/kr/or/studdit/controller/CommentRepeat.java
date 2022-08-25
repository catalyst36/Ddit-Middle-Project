package kr.or.studdit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import kr.or.studdit.vo.CommentVO;

@WebServlet("/commentRepeat.do")
public class CommentRepeat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String bor_code = request.getParameter("code");
		IStudditService service = StudditServiceImpl.getServiceInstance();
		
		List<CommentVO> commentList = service.boardComment(bor_code);
		
		
		JsonObject obj = new JsonObject();
		Gson  gson = new Gson();
		JsonElement clist = gson.toJsonTree(commentList);
		obj.add("clist", clist);
		out.print(obj);
		out.flush();
	}

}
