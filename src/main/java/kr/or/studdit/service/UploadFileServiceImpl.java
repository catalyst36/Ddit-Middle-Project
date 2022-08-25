package kr.or.studdit.service;

import kr.or.studdit.dao.IuploadFileDao;
import kr.or.studdit.dao.UploadFileDaoImpl;
import kr.or.studdit.vo.FileVO;
import kr.or.studdit.vo.StudentVO;

public class UploadFileServiceImpl implements IuploadFileService {

	private static IuploadFileService service;
	private IuploadFileDao dao;
	private int count =0;
	
	private UploadFileServiceImpl() {
		dao=UploadFileDaoImpl.getDaoUpInstance();
	}
	
	public static IuploadFileService getServiceUpInstance() {
		if(service == null) {
			service = new UploadFileServiceImpl();
		}
		return service;
	}
	
	@Override
	public int uploadPic(FileVO filevo) {
		return dao.uploadPic(filevo);
	}

	@Override
	public String changeBasicProPic(String fileNot) {
		return dao.changeBasicProPic(fileNot);
		}

	@Override
	public String getFile(String std_id) {
		return dao.getFile(std_id);
	}

	@Override
	public int upProfile(StudentVO stdvo) {
		// TODO Auto-generated method stub
		return dao.upProfile(stdvo);
	}

	@Override
	public int delProfile(String std_id) {
		// TODO Auto-generated method stub
		return dao.delProfile(std_id);
	}

}
