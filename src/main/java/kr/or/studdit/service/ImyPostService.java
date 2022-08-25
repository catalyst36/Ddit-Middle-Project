package kr.or.studdit.service;

import java.util.List;

import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.CommentVO;

public interface ImyPostService {
	public List<BoardVO> allMyPost(String std_id);
	
	public List<CommentVO> allMycomment(String std_id); 
	
}
