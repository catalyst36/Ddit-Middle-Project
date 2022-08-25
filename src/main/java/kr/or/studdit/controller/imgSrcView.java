package kr.or.studdit.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.studdit.service.IuploadFileService;
import kr.or.studdit.service.UploadFileServiceImpl;
import kr.or.studdit.vo.FileVO;
import kr.or.studdit.vo.MyProfileVO;

/**
 * Servlet implementation class imgSrcView
 */
@WebServlet("/imgSrcView.do")
public class imgSrcView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
System.out.println("들어는 오니 ..??");
		request.setCharacterEncoding("UTF-8");
		
//		// 세션 불러오기
//		HttpSession session = request.getSession();
//		
//		MyProfileVO profileVo = (MyProfileVO)session.getAttribute("myprofile");
//		
		// 세션에 저장된 id값 불러오기
		String std_id = request.getParameter("id");
System.out.println("세션에 저장된 id >> "+std_id);
		
		IuploadFileService service = UploadFileServiceImpl.getServiceUpInstance();
		
		// student테이블에 std_phot저장된거 불러와서 넣어줌
		String fileName = service.getFile(std_id);
System.out.println("std_phot : "+fileName);

		// std_phot가 null이면 기본 프사로 돌림
		if(fileName==null) {
			fileName = "basicProfile.png";
		}
		
		String downloadPath = "D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\studditproject\\src\\main\\webapp\\images\\profilePic";
		
		String filePath = downloadPath + File.separator + fileName;
		
		File file = new File(filePath);
		BufferedOutputStream bos = null;
		BufferedInputStream bis = null;
		
		if (file.exists()) {
			try {
				// 출력용 스트림 객체 생성 ==> response객체 이용
				bos = new BufferedOutputStream(response.getOutputStream());
				
				// 파일 입력용 스트림 객체 생성
				bis = new BufferedInputStream(new FileInputStream(file));
				
				byte[] buffer = new byte[1024];
				int len = -1;

				// byte배열을 이용해서 파일 내용을 읽어와 출력용 스트림 객체로 출력한다.
				while ((len = bis.read(buffer)) > 0 ) {
					bos.write(buffer, 0, len);
				}
			} catch(IOException e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			} finally {				
				if (bis != null) {	bis.close();		}
				if (bos != null) { bos.flush();	bos.close();	}
			}
		} 
		System.out.println("끝!!!");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


//MyProfileVO vo = (MyProfileVO)session.getAttribute("myprofile");