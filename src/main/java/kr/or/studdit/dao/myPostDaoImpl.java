package kr.or.studdit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.studdit.util.SqlMapClientFactory;
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.CommentVO;

public class myPostDaoImpl implements ImyPostDao {
	private static myPostDaoImpl dao;
	private SqlMapClient smc;
	
	private myPostDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ImyPostDao getDaomyPostInstance() {
		if(dao == null) {
			dao = new myPostDaoImpl();
		}
		return dao;
	}
	
	
	@Override
	public List<BoardVO> allMyPost(String std_id) {
		List<BoardVO> allMyPost = null;
		
		try {
			allMyPost = smc.queryForList("post.myAllPost",std_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allMyPost;
	}

	@Override
	public List<CommentVO> allMycomment(String std_id) {
		List<CommentVO> allMycomment = null;
		
		try {
			allMycomment = smc.queryForList("post.myAllComment",std_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allMycomment;
	}

}
