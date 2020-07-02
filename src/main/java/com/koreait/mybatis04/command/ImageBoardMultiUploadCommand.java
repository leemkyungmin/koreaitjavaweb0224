package com.koreait.mybatis04.command;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.mybatis04.dao.ImageBoardDAO;

public class ImageBoardMultiUploadCommand implements ImageBoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		ImageBoardDAO iDAO = sqlSession.getMapper(ImageBoardDAO.class);
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) map.get("mr");
		
		String iWriter = mr.getParameter("iWriter");
		String iTitle = mr.getParameter("iTitle");
		String iContent = mr.getParameter("iContent");
		//MultipartFile files = mr.getFile("files");
		List<MultipartFile> fileList  = mr.getFiles("files");
		System.out.println(fileList.size());
		if( fileList !=null && fileList.size()>0 ) { //첨부가 있으면
			
			for(MultipartFile file :fileList) {
				
				if(!file.isEmpty()) {
					String originFilename=file.getOriginalFilename();
					String extName = originFilename.substring(originFilename.lastIndexOf(".") + 1);
					String saveFilename=null;
					try {
						saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
								   "_" +
								   System.currentTimeMillis() +
								   "." + extName;
						
						String realPath = mr.getSession().getServletContext().getRealPath("/resources/storage");
						
						// 2-2) /resources/storage 경로가 존재하지 않으면 필요한 경로(디렉토리)를 만든다.
						// new File(경로) : 경로로 디렉토리만 사용되면 디렉토리로 인식한다.
						File directory = new File(realPath);
						System.out.println(directory);
						if ( !directory.exists() ) {
							directory.mkdirs();  // mkdirs (하위 디렉토리를 모두 만든다.)
						}
						
						// 2-3) 서버에 저장할 파일을 만든다.
						File saveFile = new File(realPath, saveFilename);  // (경로, 파일명)
						
						// 2-4) 업로드한다.
						file.transferTo(saveFile);
						
						
						iDAO.imageBoardInsert(iWriter, iTitle, iContent, saveFilename);
						
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
			
		}
	}
	
	
}