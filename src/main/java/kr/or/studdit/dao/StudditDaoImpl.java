package kr.or.studdit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.studdit.util.SqlMapClientFactory;
import kr.or.studdit.vo.ActMemberVO;
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.CommentVO;
import kr.or.studdit.vo.MyProfileVO;
import kr.or.studdit.vo.RankVO;
import kr.or.studdit.vo.RecruitVO;
import kr.or.studdit.vo.SatisVO;
import kr.or.studdit.vo.StudentVO;
import kr.or.studdit.vo.StudyActVO;
import kr.or.studdit.vo.StudyRoomVO;

public class StudditDaoImpl implements IStudditDao{
	
	private static IStudditDao dao;
	private SqlMapClient smc;
	
	private StudditDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IStudditDao getDaoInstance() {
		if(dao == null)
			dao = new StudditDaoImpl();
		
		return dao;
	}
	
	// 학생 회원가입 메서드 -LWG-
	@Override
	public int insertStudent(StudentVO studentVo) {
		int result = 0;
		
		try {
			if(smc.insert("signup.insertStudent",studentVo) == null)
				result = 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}

	// 고유번호 확인 메서드 -LWG-
	@Override
	public String searchSatNum(String sat_mail) {
		String result = null;
		
		try {
			result = (String)smc.queryForObject("signup.searchSatNum", sat_mail);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 로그인 -LWG-
	@Override
	public StudentVO studentLogin(StudentVO studentVo) {
		StudentVO result = null;
		
		try {
			result = (StudentVO)smc.queryForObject("login.studentLogin", studentVo);
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<BoardVO> selectByPage(Map<String, Object> map) {
		List<BoardVO> list = null;
		
		try {
			list = smc.queryForList("board.selectByPage", map);
		} catch (SQLException e) {
			System.out.println("게시판 sql error");
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<BoardVO> selectByHelp(Map<String, Object> map) {
		List<BoardVO> list = null;
		
		try {
			list = smc.queryForList("board.selectByHelp", map);
		} catch (SQLException e) {
			System.out.println("게시판 sql error");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		int cnt = 0;
		
		try {
			cnt = (int)smc.queryForObject("board.totalCount", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int helpCount(Map<String, Object> map) {
		int cnt = 0;
		
		try {
			cnt = (int)smc.queryForObject("board.helpCount", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 회원정보 업데이트 -KEB-
	@Override
	public int updateMyInfo(MyProfileVO vo) {
		int rnum=0;
		try {
			rnum = smc.update("signup.updateMyInfo",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rnum;
	}

	// 회원 ID 찾기 -LWG-
	@Override
	public String findId(SatisVO satisVo) {
		String result = null;
		
		try {
			result=(String)smc.queryForObject("find.findId", satisVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 회원 PASSWORD찾기 -LWG-
	@Override
	public String findPass(Map<String, String> map) {
		String result = null;
		
		try {
			result=(String)smc.queryForObject("find.findPass", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 회원 아이디,이메일 중복검사 -LWG-
	@Override
	public String checkId(Map<String, String> map) {
		String result = null;
		
		try {
			result=(String)smc.queryForObject("signup.checkId", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// ID 중복확인 -LWG-
	@Override
	public BoardVO selectBoard(String bor_code) {
		BoardVO boardVo = null;
		try {
			boardVo = (BoardVO)smc.queryForObject("board.selectBoard", bor_code);
		} catch (SQLException e) {
			System.out.println("sql error");
			e.printStackTrace();
		}
		return boardVo;
	}

	@Override
	public int insertComment(CommentVO commentVo) {
		Object result = 0;
		int output = 0;
		try {
			result = smc.insert("board.insertComment", commentVo);
			
			if(result == null) {
				output = 1;
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return output;
	}

	@Override
	public List<CommentVO> boardComment(String bor_code) {
		List<CommentVO> list = null;
		
		try {
			list = smc.queryForList("board.boardComment", bor_code);
		} catch (SQLException e) {
			System.out.println("sql error");
		}
		return list;
	}

	
	@Override
	public List<SatisVO> selectSatis() {
		List<SatisVO> selectSatis = null;
		try {
			selectSatis = smc.queryForList("admin.adminSatis");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return selectSatis;
	}

	@Override
	public int deleteComment(String cmt_code) {
		int result = 0;
		
		try {
			result = smc.delete("board.deleteComment", cmt_code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 관리자 student 정보 가져오기 -LWG-
	@Override
	public List<StudentVO> AllStudent() {
		List<StudentVO> AllStudent = null;
		try {
			AllStudent = smc.queryForList("admin.adminStudent");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return AllStudent;
	}

	@Override
	public int updateComment(Map<String, String> map) {
		int result = 0;
		
		try {
			result = smc.update("board.updateComment",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public MyProfileVO myProfile(String std_id) {
		MyProfileVO vo = null;
		
		try {
			vo = (MyProfileVO)smc.queryForObject("profile.myProfile", std_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	// 관리자 회원삭제
	@Override
	public int adminDelete(String std_id) {
		int result = 0;
		
		try {
			result = smc.delete("admin.adminDelete",std_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateHit(String bor_code) {
		int result = 0;
		
		try {
			result = smc.update("board.updateHit",bor_code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<RecruitVO> getStudyMember(String bor_code) {
		List<RecruitVO> list = null;
		
		try {
			list = smc.queryForList("board.getStudyMember", bor_code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertStudyMember(Map<String, String> map) {
		Object obj = null;
		int result = 0;
		try {
			obj = smc.insert("board.insertStudyMember", map);
			if(obj == null) {
				result = 1;
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteStudyMember(Map<String, String> map) {
		int result = 0;
		
		try {
			result = smc.delete("board.deleteStudyMember", map);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<BoardVO> getStudyList(Map<String, String> map) {
		List<BoardVO> list = null;
		
		try {
			list = smc.queryForList("board.getStudyList", map);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getStudyMemberCount(String bor_code) {
		int result = 0;
		
		try {
			result = (int)smc.queryForObject("board.getStudyMemberCount", bor_code);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int insertAct(StudyActVO studyActVo) {
		Object obj = null;
		int result = 0;
		
		try {
			obj = smc.insert("board.insertAct", studyActVo);
			if(obj == null) result = 1;
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public String getActCode(String bor_code) {
		String result = null;
		
		try {
			result = (String)smc.queryForObject("board.getActCode",bor_code);
		} catch (SQLException e) {
			result = null;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int actStudyMember(Map<String, String> map) {
		int result = 0;
		Object obj = null;
		
		try {
			obj = smc.insert("board.actStudyMember", map);
			if(obj == null)
				result = 1;
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<StudyActVO> getActList(String bor_code) {
		List<StudyActVO> list = null;
		
		try {
			list = smc.queryForList("board.getActList", bor_code);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ActMemberVO> getActMember(String act_code) {
		List<ActMemberVO> list = null;
		
		try {
			list = smc.queryForList("board.getActMember", act_code);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updateStudyState(StudyRoomVO studyRoomVo) {
		int result = 0;
		
		try {
			result = smc.update("board.updateStudyState", studyRoomVo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int giveStudyMileage(RecruitVO recruitVo) {
		int result = 0;
		
		try {
			result = smc.update("board.giveStudyMileage", recruitVo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public CommentVO getChoiceComment(String bor_code) {
		CommentVO commentVo = null;
		
		try {
			commentVo = (CommentVO)smc.queryForObject("board.getChoiceComment",bor_code);
		} catch (SQLException e) {
			commentVo = null;
			e.printStackTrace();
		}
		
		return commentVo;
	}

	@Override
	public int updateChoice(String cmt_code) {
		int result = 0;
		
		try {
			result = smc.update("board.updateChoice",cmt_code);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int giveChoiceMile(String std_id) {
		int result = 0;
		
		try {
			result = smc.update("board.giveChoiceMile", std_id);
		} catch (SQLException e) {
			result = 0;
		}
		
		return result;
	}

	@Override
	public String getChoiceStd(String cmt_code) {
		String result = null;
		
		try {
			result = (String)smc.queryForObject("board.getChoiceStd", cmt_code);
		} catch (SQLException e) {
			result = null;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<RankVO> getRank() {
		List<RankVO> list = null;
		
		try {
			list = smc.queryForList("board.getRank");
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deleteBoard(String bor_code) {
		int result = 0;
		
		try {
			result = smc.delete("board.deleteBoard",bor_code);
		} catch (SQLException e) {
		}
		return result;
	}

	@Override
	public int updateTier(MyProfileVO vo) {
		int result = 0;
		
		try {
			result = smc.update("board.updateTier", vo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		
		return result;
	}
}

// 메소드 오버라이딩 후 기능구현