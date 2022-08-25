package kr.or.studdit.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.studdit.util.SqlMapClientFactory;
import kr.or.studdit.vo.FileVO;
import kr.or.studdit.vo.StudentVO;

public class UploadFileDaoImpl implements IuploadFileDao {
	private static IuploadFileDao dao;
	private SqlMapClient smc;
	
	private UploadFileDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IuploadFileDao getDaoUpInstance() {
		if(dao == null) {
			dao = new UploadFileDaoImpl();
		}
		return dao;
	}
	
	
	@Override
	public int uploadPic(FileVO filevo) {
		int res = 0;
		
		try {
			smc.insert("file.uploadPic",filevo);
			res = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	
	@Override
	public String changeBasicProPic(String fileNot) {
		String route = null;
		
		try {
			route =	(String)smc.queryForObject("file.changeBasicProPic",fileNot);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return route;
	}

	
	
	@Override
	public String getFile(String std_id) {
		String fileVo = null;
		
		try {
			fileVo = (String)smc.queryForObject("file.getFile", std_id);
		} catch (SQLException e) {
			fileVo=null;
			e.printStackTrace();
		}
		
		return fileVo;
	}

	@Override
	public int upProfile(StudentVO stdvo) {
		int cnt=0;
		try {
			cnt=smc.update("file.upProfile",stdvo);
		} catch (SQLException e) {
			cnt=0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int delProfile(String std_id) {
		int cnt=0;
		try {
			cnt=smc.delete("file.delProfile",std_id);
		} catch (SQLException e) {
			cnt=0;
			e.printStackTrace();
		}
		return cnt;
	}

}
