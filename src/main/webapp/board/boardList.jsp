<%@page import="kr.or.studdit.vo.PageVO"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.or.studdit.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	List<BoardVO>  list =(List<BoardVO>) request.getAttribute("list");
	PageVO vo = (PageVO)request.getAttribute("pageVo");
	
	JsonObject obj = new JsonObject();
	obj.addProperty("tpage", vo.getTotalPage());
	obj.addProperty("spage", vo.getStartPage());
	obj.addProperty("epage", vo.getEndPage());
	
	Gson  gson = new Gson();
	
	JsonElement  slist = gson.toJsonTree(list);
	obj.add("lists", slist);
	
	out.print(obj);
	out.flush();
  %>
  