package com.koreait.projectE.command;

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
		String rContent = mrequest.getParameter("rContent");
		List<MultipartFile> fileList = mrequest.getFiles("rPoto");
		
		ReviewDAO rDAO = sqlSession.getMapper(ReviewDAO.class);
		
		if (fileList != null && fileList.size() > 0) {
			for (MultipartFile file : fileList) {
				if (!file.isEmpty()) {
					String originFilename = file.getOriginalFilename();
					String extName = originFilename.substring(originFilename.lastIndexOf(".") + 1);
					String saveFilename = null;
					
					try {
						saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) + 
								"_" +
								System.currentTimeMillis() +
								"." + extName;
						
						String realPath = mrequest.getSession().getServletContext().getRealPath("/resources/storage");
						
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
		}
		
		rDAO.insertReview(rTitle, rContent, rPoint,"11111");
	}

}
