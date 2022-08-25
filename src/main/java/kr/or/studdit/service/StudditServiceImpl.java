package kr.or.studdit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.studdit.dao.IStudditDao;
import kr.or.studdit.dao.StudditDaoImpl;
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

public class StudditServiceImpl implements IStudditService{
	
	private static IStudditService service;
	private IStudditDao dao;
	private int count = 0;
	
	private StudditServiceImpl() {
		dao = StudditDaoImpl.getDaoInstance();
	}
	
	public static IStudditService getServiceInstance() {
		if(service == null)
			service = new StudditServiceImpl();
		
		return service;
	}
	
	// 회원가입
	@Override
	public int insertStudent(StudentVO studentVo) {

		return dao.insertStudent(studentVo);
	}

	// 고유번호 찾기
	@Override
	public String searchSatNum(String sat_mail) {
		
		return dao.searchSatNum(sat_mail);
	}

	// 학생 로그인
	@Override
	public StudentVO studentLogin(StudentVO studentVo) {

		return dao.studentLogin(studentVo);
	}

	@Override
	public List<BoardVO> selectByPage(Map<String, Object> map) {
		return dao.selectByPage(map);
	}
	
	@Override
	public List<BoardVO> selectByHelp(Map<String, Object> map) {
		return dao.selectByHelp(map);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}
	
	@Override
	public int helpCount(Map<String, Object> map) {
		return dao.helpCount(map);
	}
	
	

	@Override
	public int totalPage(String cst, String area, String tit, String sword, String search) {
		//전체 글 갯수 구하기 
		Map<String, Object>  map = new HashMap<String, Object>();
		map.put("cst", cst);
		map.put("area", area);
		map.put("tit", tit);
		map.put("sword", sword);
		map.put("ssearch", search);
		System.out.println(cst);
		if(cst == null) {
			map.put("name", "질문");
			count = this.helpCount(map);
		}else if(area == null) {
			map.put("cst", "");
			map.put("name", "자유");
			count = this.helpCount(map);
		}else {
			count = this.totalCount(map);
		}

		
		//전체페이지수 구하기 
		int totalPage = (int) Math.ceil((double)count / PageVO.getPerList() );
		
		System.out.println("전체글 갯수 =" + count);
		System.out.println("전체 페이지 수 =" + totalPage);
		
		return totalPage;
	}

	@Override
	public PageVO pageInfo(int page, String cst, String area, String tit, String sword, String search) {
		int totalPage  = this.totalPage(cst, area, tit, sword , search);
		
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		if(end > count) end = count;
		
		int startPage = ((page -1) / PageVO.getPerPage() * PageVO.getPerPage()) + 1;
			
		int endPage = startPage + PageVO.getPerPage() - 1;
		if(endPage > totalPage) endPage = totalPage;
		
				
		PageVO vo = new PageVO();
		vo.setStart(start);
        vo.setEnd(end);
        vo.setStartPage(startPage);
        vo.setEndPage(endPage);
        vo.setTotalPage(totalPage);
        
        return vo;
	}

	@Override
	public int updateMyInfo(MyProfileVO vo) {
		return dao.updateMyInfo(vo);
	}

	// 회원 ID찾기
	@Override
	public String findId(SatisVO satisVo) {
		return dao.findId(satisVo);
	}

	@Override
	public BoardVO selectBoard(String bor_code) {
		return dao.selectBoard(bor_code);
	}

	// 회원 PASSWORD찾기
	@Override
	public String findPass(Map<String, String> map) {
		return dao.findPass(map);
	}

	// ID,이메일 중복체크
	@Override
	public String checkId(Map<String, String> map) {
		return dao.checkId(map);
	}

	// 관리자 satis정보 가져오기
	@Override
	public List<SatisVO> selectSatis() {
		return dao.selectSatis();
	}

	@Override
	public int insertComment(CommentVO commentVo) {
		return dao.insertComment(commentVo);
	}

	@Override
	public List<CommentVO> boardComment(String bor_code) {
		return dao.boardComment(bor_code);
	}

	@Override
	public int deleteComment(String cmt_code) {
		return dao.deleteComment(cmt_code);
	}

	@Override
	public List<StudentVO> AllStudent() {
		return dao.AllStudent();
	}

	@Override
	public int updateComment(Map<String, String> map) {
		return dao.updateComment(map);
	}


	@Override
	public MyProfileVO myProfile(String std_id) {
		return dao.myProfile(std_id);
	}

	@Override
	public int adminDelete(String Std_id) {
		return dao.adminDelete(Std_id);
	}

	@Override
	public int updateHit(String bor_code) {
		return dao.updateHit(bor_code);
	}

	@Override
	public List<RecruitVO> getStudyMember(String bor_code) {
		return dao.getStudyMember(bor_code);
	}

	@Override
	public int insertStudyMember(Map<String, String> map) {
		return dao.insertStudyMember(map);
	}

	@Override
	public int deleteStudyMember(Map<String, String> map) {
		return dao.deleteStudyMember(map);
	}

	@Override
	public List<BoardVO> getStudyList(Map<String, String> map) {
		return dao.getStudyList(map);
	}

	@Override
	public int getStudyMemberCount(String bor_code) {
		return dao.getStudyMemberCount(bor_code);
	}

	@Override
	public int insertAct(StudyActVO studyActVo) {
		return dao.insertAct(studyActVo);
	}

	@Override
	public String getActCode(String bor_code) {
		return dao.getActCode(bor_code);
	}

	@Override
	public int actStudyMember(Map<String, String> map) {
		return dao.actStudyMember(map);
	}

	@Override
	public List<StudyActVO> getActList(String bor_code) {
		return dao.getActList(bor_code);
	}

	@Override
	public List<ActMemberVO> getActMember(String act_code) {
		return dao.getActMember(act_code);
	}

	@Override
	public int updateStudyState(StudyRoomVO studyRoomVo) {
		return dao.updateStudyState(studyRoomVo);
	}

	@Override
	public int giveStudyMileage(RecruitVO recruitVo) {
		return dao.giveStudyMileage(recruitVo);
	}

	@Override
	public CommentVO getChoiceComment(String bor_code) {
		return dao.getChoiceComment(bor_code);
	}

	@Override
	public int updateChoice(String cmt_code) {
		return dao.updateChoice(cmt_code);
	}

	@Override
	public int giveChoiceMile(String std_id) {
		return dao.giveChoiceMile(std_id);
	}

	@Override
	public String getChoiceStd(String cmt_code) {
		return dao.getChoiceStd(cmt_code);
	}

	@Override
	public List<RankVO> getRank() {
		return dao.getRank();
	}

	@Override
	public int deleteBoard(String bor_code) {
		return dao.deleteBoard(bor_code);
	}

	@Override
	public int updateTier(MyProfileVO vo) {
		return dao.updateTier(vo);
	}

	// 메소드 오버라이딩 후 컨트롤러 연결
	
}
