package kr.or.studdit.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.studdit.service.IuploadFileService;
import kr.or.studdit.service.UploadFileServiceImpl;
import kr.or.studdit.vo.MyProfileVO;
import kr.or.studdit.vo.StudentVO;


@WebServlet("/updateProPic.do")
@MultipartConfig
public class updateProPic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 불러오기
				request.setCharacterEncoding("utf-8");

				// 사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정
				String uploadPath = "D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\studditproject\\src\\main\\webapp\\images\\profilePic";
				
				// 저장될 폴더가 없으면 생성한다.
				File fileUploadDir = new File(uploadPath);
				if (!fileUploadDir.exists()) {
					fileUploadDir.mkdirs();
				}
				
				String old_photo = request.getParameter("old_photo");
System.out.println("old_phot : "+old_photo);		
				
				HttpSession session = request.getSession();
						
				MyProfileVO profilevo = (MyProfileVO)session.getAttribute("myprofile");
				StudentVO stdVo = new StudentVO();

				
				stdVo.setStd_id(profilevo.getStd_id());
				stdVo.setSat_phot(old_photo); // 일단 이전 프로필사진으로 셋팅한다.
					
				String savePhoto = null;
				
				// form의 file입력 요소의 name값을 이용하여 Part객체 구하기
				Part part = request.getPart("updateMyPic");
System.out.println("part : "+part);
				
				if(part != null) {
					String photo = extractFileName(part);
System.out.println("photo : "+photo);
					if(!"".equals(photo)) {
						try {
							savePhoto = UUID.randomUUID().toString();
							part.write(uploadPath + File.separator + savePhoto);
							stdVo.setSat_phot(savePhoto);// 수정파일이 있으면 새로운 파일명으로 셋팅
							 
						}catch(IOException e) {
							
						}
					}
				}
				
				IuploadFileService service = UploadFileServiceImpl.getServiceUpInstance();
				
				int cnt = service.upProfile(stdVo);
				
				profilevo.setSat_phot(savePhoto);
				
				
				session.setAttribute("myprofile", profilevo);
				
				response.sendRedirect(request.getContextPath()+"/create/myPage.jsp");
	}



	private String extractFileName(Part part) {
		String fileName = ""; 
		String contentDisposition = part.getHeader("Content-Disposition");
		String[] items = contentDisposition.split(";");
		for (String item : items) {
			if (item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}
		return fileName;
	}
}

