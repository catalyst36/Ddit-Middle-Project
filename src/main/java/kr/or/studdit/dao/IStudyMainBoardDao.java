package kr.or.studdit.dao;

import java.util.List;

import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.InsertBoardVO;
import kr.or.studdit.vo.StudyMainBoardVO;

public interface IStudyMainBoardDao {
	//스터디게시글 전체 리스트
	public List<StudyMainBoardVO> studyBoardList();
	
	public List<StudyMainBoardVO> javaList();

	public List<StudyMainBoardVO> databaseList();
	
	public List<StudyMainBoardVO> jspList();
	
	public List<StudyMainBoardVO> pythonList();	

	public List<StudyMainBoardVO> htmlList();	

	public List<StudyMainBoardVO> springList();	

	/* 글쓰기 일반 게시글 */
	public InsertBoardVO insertToBoard(InsertBoardVO bvo);
	
	/* 글쓰기 스터디 게시글 */
	public InsertBoardVO insertToStudyBoard(InsertBoardVO vo);
	
	public List<InsertBoardVO> getAllBoardVo();
	
}
