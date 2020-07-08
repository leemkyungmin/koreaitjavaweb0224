package com.koreait.projectE.command.board;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.ReviewDAO;

public class ReviewInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) map.get("mrequest");
		
		int rPoint = Integer.parseInt(mrequest.getParameter("rPoint"));
		String rTitle = mrequest.getParameter("rTitle");
		
		// 제목이 없으면 제목없음으로?
		
		String rContent = mrequest.getParameter("rContent");
		List<MultipartFile> fileList = mrequest.getFiles("rPoto");
		int cNo = Integer.parseInt(mrequest.getParameter("cNo"));
		String dSaup_no = mrequest.getParameter("dSaup_no");
		
		ReviewDAO rDAO = sqlSession.getMapper(ReviewDAO.class);
		
		String rPoto = ""; // 실제 DB에 들어가는 필드
		int count = 0;
		
		if (fileList != null && fileList.size() > 0) { // 파일첨부 O
			for (MultipartFile file : fileList) {
				if (!file.isEmpty()) {
					count++;
					String originFilename = file.getOriginalFilename();
					String extName = originFilename.substring(originFilename.lastIndexOf(".") + 1);
					String saveFilename = null;			
					
					try {
						saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) + 
								"_" +
								System.currentTimeMillis() +
								"." + extName;	
						
						if (count == fileList.size()) {
							rPoto += saveFilename;
						} else {
							rPoto += saveFilename + ",";
						}
						
						String realPath = mrequest.getSession().getServletContext().getRealPath("/resources/storage/review_img");
						
						File directory = new File(realPath);
						if (!directory.exists()) {
							directory.mkdirs();
						}
						
						File saveFile = new File(directory, saveFilename);
						file.transferTo(saveFile);
						
					} catch (Exception e) {

						e.printStackTrace();
					}
				}
			}
			rDAO.insertReview(rTitle, rContent, rPoint, rPoto, cNo, dSaup_no);	
		} else { // 파일첨부 X
			rDAO.insertReview(rTitle, rContent, rPoint, null, cNo, dSaup_no);
		}
	}

}
