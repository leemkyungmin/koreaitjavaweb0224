package com.koreait.projectE.command.Login;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;

public class CustomerMyPagePhotoUpdateCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) map.get("mr");
		String cNo = mr.getParameter("cNo");
		MultipartFile cPhoto = mr.getFile("cPhoto");
		
		String originFilename = cPhoto.getOriginalFilename();
		
		String extName = originFilename.substring(originFilename.lastIndexOf(".") + 1);
		
		String saveFilename = null;
		
		try {
			
			// 1) 저장할 파일 이름 만들기
			// 파일명 중복 방지 대책으로 서버에 저장할 파일의 이름에 업로드 시간을 추가한다.
			// 서버에 저장될 파일명 : 원래파일명_업로드시간.확장자
			// 원래파일명 : originFilename.substring(0, originFilename.lastIndexOf(".") )
			// 업로드시간 : System.currentTimeMillis()
			saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
					   "_" +
					   System.currentTimeMillis() +
					   "." + extName;
			
			// 2) 업로드
			
			// 2-1) 파일이 저장될 서버 내 경로(/resources/storage)를 알아낸다.
			String realPath = mr.getSession().getServletContext().getRealPath("/resources/storage/user_img");
			
			// 2-2) /resources/storage 경로가 존재하지 않으면 필요한 경로(디렉토리)를 만든다.
			// new File(경로) : 경로로 디렉토리만 사용되면 디렉토리로 인식한다.
			File directory = new File(realPath);
			if ( !directory.exists() ) {
				directory.mkdirs();  // mkdirs (하위 디렉토리를 모두 만든다.)
			}
			
			// 2-3) 서버에 저장할 파일을 만든다.
			File saveFile = new File(realPath, saveFilename); // (경로, 파일명)
			
			// 2-4) 업로드 한다.
			cPhoto.transferTo(saveFile);
			
			// 3) DB 에 저장
			LoginDAO ldao = sqlSession.getMapper(LoginDAO.class);
			ldao.customerPhotoUpdate(cNo, saveFilename);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
