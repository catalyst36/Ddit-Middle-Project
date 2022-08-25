package kr.or.studdit.service;

import java.util.List;
import java.util.Map;

import kr.or.studdit.vo.ActMemberVO;
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.CommentVO;
import kr.or.studdit.vo.MyProfileVO;
import kr.or.studdit.vo.PageVO;
import kr.or.studdit.vo.RankVO;
import kr.or.studdit.vo.RecruitVO;
import kr.or.studdit.vo.SatisVO;
import kr.or.studdit.vo.StudentVO;
import kr.or.studdit.vo.StudyActVO;
import kr.or.studdit.vo.StudyRoomVO;

public interface IStudditService {

	// 추가할 기능 선언부
	
	// 회원가입 -LWG-
	public int insertStudent (StudentVO studentVo);
	
	// ID,이메일 중복체크 -LWG-
	public String checkId (Map<String, String> map);
	
	// 고유번호 찾기 -LWG-
	public String searchSatNum (String sat_mail);
	
	// 로그인 -LWG-
	public StudentVO studentLogin (StudentVO studentVo);
	
	// 회원ID 찾기 -LWG-
	public String findId (SatisVO satisVo);
	
	// 회원PASSWORD찾기 -LWG-
	public String findPass (Map<String, String> map);
	
	// 게시판 select -YJS-
	public List<BoardVO> selectByPage(Map<String, Object> map);
	
	public List<BoardVO> selectByHelp(Map<String, Object> map);
	
	//게시글의 전체갯수 가져오기 -YJS- 
	public int totalCount(Map<String, Object> map);
	
	public int helpCount(Map<String, Object> map);
	
	//전체 페이지 수 구하기 
	public int totalPage(String cst, String area, String tit, String sword, String search);
		
	//페이지정보를 얻기위한 메소드 
	public PageVO pageInfo(int page, String cst, String area, String tit, String sword, String search);
	
	//회원정보 수정 -KEB-
	public int updateMyInfo(MyProfileVO vo);
	
	// 게시글 가져오기 -YJS-
	public BoardVO selectBoard(String bor_code);
	
	// 관리자 satis정보 가져오기 -LWG-
	public List<SatisVO> selectSatis();
	
	// 댓글 집어넣기 -YJS-
	public int insertComment(CommentVO commentVo);
	
	// 댓글 가져오기 -YJS-
	public List<CommentVO> boardComment(String bor_code);
	
	// 댓글 삭제 -YJS-
	public int deleteComment(String cmt_code);
	
	// 관리자 student정보 가져오기 -LWG-
	public  List<StudentVO> AllStudent();
	
	// 댓글 수정 -YJS-
	public int updateComment(Map<String, String> map);
	
	// 프로필 가져오기 -YJS-
	public MyProfileVO myProfile(String std_id);
	
	// 관리자 회원삭제 -LWG-
	public int adminDelete(String Std_id);
	
	// 게시글 조회수 증가 -YJS-
	public int updateHit(String bor_code);
	
	// 스터디 멤버 조회 -YJS-
	public List<RecruitVO> getStudyMember(String bor_code);
	
	// 스터디 멤버 삽입 -YJS-
	public int insertStudyMember(Map<String, String> map);
	
	// 스터디 멤버 삭제 -YJS-
	public int deleteStudyMember(Map<String, String> map);
	
	// 내 스터디 가져오기 -YJS-
	public List<BoardVO> getStudyList(Map<String, String> map);
	
	// 스터디 인원수 -YJS-
	public int getStudyMemberCount(String bor_code);
	
	// 활동 기록 -YJS-
	public int insertAct(StudyActVO studyActVo);
	
	// actcode 가져오기 -YJS-
	public String getActCode(String bor_code);
	
	// 출석 여부 -YJS-
	public int actStudyMember(Map<String, String>map);
	
	// 활동 리스트 -YJS-
	public List<StudyActVO> getActList (String bor_code);
	
	public List<ActMemberVO> getActMember (String act_code);
	
	public int updateStudyState(StudyRoomVO studyRoomVo);
	
	public int giveStudyMileage(RecruitVO recruitVo);
	
	public CommentVO getChoiceComment(String bor_code);
	
	public int updateChoice(String cmt_code);
	
	public int giveChoiceMile(String std_id);
	
	public String getChoiceStd(String cmt_code);
	
	public List<RankVO> getRank();
	
	public int deleteBoard(String bor_code);
	
	public int updateTier(MyProfileVO vo);
}
