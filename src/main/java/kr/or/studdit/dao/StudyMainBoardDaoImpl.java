package kr.or.studdit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.studdit.util.SqlMapClientFactory;
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.InsertBoardVO;
import kr.or.studdit.vo.StudyMainBoardVO;

public class StudyMainBoardDaoImpl implements IStudyMainBoardDao {
	//SqlMapClient
	private SqlMapClient smc;
	
	//자신의 객체
	private static IStudyMainBoardDao dao;
	
	//생성자
	private StudyMainBoardDaoImpl() {
		smc= SqlMapClientFactory.getSqlMapClient();
	}
	
	//자신의 객체를 생성하고 리턴
	public static IStudyMainBoardDao getDaoInstance() {
		if(dao == null) dao= new StudyMainBoardDaoImpl();
		
		return dao;
	}
	/////////////////////////////////////////////dao설정
	
	//스터디게시글전체 리스트
	@Override
	public List<StudyMainBoardVO> studyBoardList() {
		List<StudyMainBoardVO> boardList = null;
		try {
			boardList = smc.queryForList("board.getAllStudyMainBoard");//xml의 쿼리문과 일치
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public List<StudyMainBoardVO> javaList() {
		List<StudyMainBoardVO> list = null;
		
		try {
			list = smc.queryForList("board.getJavaStudyMainBoard");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<StudyMainBoardVO> databaseList() {
		List<StudyMainBoardVO> list = null;
		
		try {
			list = smc.queryForList("board.getDBStudyMainBoard");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<StudyMainBoardVO> jspList() {
		List<StudyMainBoardVO> list = null;
		
		try {
			list = smc.queryForList("board.getJSPStudyMainBoard");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<StudyMainBoardVO> pythonList() {
		List<StudyMainBoardVO> list = null;
		
		try {
			list = smc.queryForList("board.getPYStudyMainBoard");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public List<StudyMainBoardVO> htmlList() {
		List<StudyMainBoardVO> list = null;
		
		try {
			list = smc.queryForList("board.getHTMLStudyMainBoard");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public InsertBoardVO insertToBoard(InsertBoardVO bvo) {
		InsertBoardVO vo1 = null;
		
		try {
			vo1 = (InsertBoardVO) smc.insert("board.insertToBoard", bvo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo1;
	}

	@Override
	public InsertBoardVO insertToStudyBoard(InsertBoardVO vo) {
		InsertBoardVO vo1 = null;
		 try {
			vo1 = (InsertBoardVO) smc.insert("board.insertToStudyBoard", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return vo1;
	}

	@Override
	public List<InsertBoardVO> getAllBoardVo() {
		List<InsertBoardVO> list = null;
		
		try {
			list = (List<InsertBoardVO>) smc.queryForList("board.getAllBoardVo");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<StudyMainBoardVO> springList() {
		List<StudyMainBoardVO> list = null;
		
		try {
			list = smc.queryForList("board.getSpringStudyMainBoard");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
}
