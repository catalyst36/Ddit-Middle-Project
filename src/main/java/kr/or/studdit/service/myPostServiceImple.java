package kr.or.studdit.service;

import java.util.List;

import kr.or.studdit.dao.ImyPostDao;
import kr.or.studdit.dao.myPostDaoImpl;
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.CommentVO;

public class myPostServiceImple implements ImyPostService {

	private static ImyPostService service;
	private ImyPostDao dao;
	private int count = 0;
	
	private myPostServiceImple() {
		dao = myPostDaoImpl.getDaomyPostInstance();
	}
	
	public static ImyPostService getServiceInstance() {
		if(service == null)
			service = new myPostServiceImple();
		
		return service;
	}
	
	
	
	@Override
	public List<BoardVO> allMyPost(String std_id) {
		// TODO Auto-generated method stub
		return dao.allMyPost(std_id);
	}

	@Override
	public List<CommentVO> allMycomment(String std_id) {
		// TODO Auto-generated method stub
		return dao.allMycomment(std_id);
	}

}
