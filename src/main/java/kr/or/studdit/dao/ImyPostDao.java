package kr.or.studdit.dao;

import java.util.List;

import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.CommentVO;

public interface ImyPostDao {
	public List<BoardVO> allMyPost(String std_id);
	
	public List<CommentVO> allMycomment(String std_id); 
}
