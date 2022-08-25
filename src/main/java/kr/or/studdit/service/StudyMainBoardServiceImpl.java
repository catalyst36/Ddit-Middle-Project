package kr.or.studdit.service;

import java.util.List;

import kr.or.studdit.dao.IStudyMainBoardDao;
import kr.or.studdit.dao.StudyMainBoardDaoImpl;
import kr.or.studdit.vo.BoardVO;
import kr.or.studdit.vo.InsertBoardVO;
import kr.or.studdit.vo.StudyMainBoardVO;

public class StudyMainBoardServiceImpl implements IStudyMainBoardService {
	//dao 객체
	private IStudyMainBoardDao dao;
	
	//자신의 객체
	private static IStudyMainBoardService service;
	
	//생성자
	private StudyMainBoardServiceImpl() {
		dao= StudyMainBoardDaoImpl.getDaoInstance();
	}
	//자신의 객체를 생성, 리턴
	public static IStudyMainBoardService getServiceInstance() {
		if(service == null) 
			service = (IStudyMainBoardService) new StudyMainBoardServiceImpl();
		
		return service;
	}
	//스터디게시글전체 리스트
	@Override
	public List<StudyMainBoardVO> studyBoardList() {
		return dao.studyBoardList();
	}
	@Override
	public List<StudyMainBoardVO> javaList() {
		// TODO Auto-generated method stub
		return dao.javaList();
	}
	@Override
	public List<StudyMainBoardVO> databaseList() {
		// TODO Auto-generated method stub
		return dao.databaseList();
	}
	@Override
	public List<StudyMainBoardVO> jspList() {
		// TODO Auto-generated method stub
		return dao.jspList();
	}
	@Override
	public List<StudyMainBoardVO> pythonList() {
		// TODO Auto-generated method stub
		return dao.pythonList();
	}
	@Override
	public List<StudyMainBoardVO> htmlList() {
		// TODO Auto-generated method stub
		return dao.htmlList();
	}
	@Override
	public InsertBoardVO insertToBoard(InsertBoardVO bvo) {
		
		return dao.insertToBoard(bvo);
	}
	@Override
	public InsertBoardVO insertToStudyBoard(InsertBoardVO vo) {
	
		return dao.insertToStudyBoard(vo);
	}
	@Override
	public List<InsertBoardVO> getAllBoardVo() {
		// TODO Auto-generated method stub
		return dao.getAllBoardVo();
	}
	@Override
	public List<StudyMainBoardVO> springList() {
		
		return dao.springList();
	}
	
	
	
	
	
	
}
