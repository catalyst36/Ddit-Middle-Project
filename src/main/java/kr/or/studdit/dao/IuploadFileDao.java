package kr.or.studdit.dao;

import kr.or.studdit.vo.FileVO;
import kr.or.studdit.vo.StudentVO;

public interface IuploadFileDao {
	//파일 업로드 (파일번호, 파일경로, 학생id만 insert)
	public int uploadPic(FileVO filevo);
	
	//기본 프로필 사진으로 select하는
	public String changeBasicProPic(String fileNot);
	
	// 파일 정보
	public String getFile(String std_id);
	
	public int upProfile(StudentVO stdvo);
	
	public int delProfile(String std_id);
}
