package com.koreait.projectE.command.Login;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;

public class DepartmentUpdateCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		
		Map<String, Object> map = model.asMap();
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) map.get("mr");
		
		String dSeat = mr.getParameter("dSeat");
		String dPhone = mr.getParameter("dPhone");
		String dName = mr.getParameter("dName");
		String dAddress = mr.getParameter("dAddress");
		String dStart = mr.getParameter("dStart");
		String dEnd = mr.getParameter("dEnd");
		String dParking = mr.getParameter("dParking");
		String dType = mr.getParameter("dType");
		HttpSession session = mr.getSession();
		String dNo = mr.getParameter("dNo");
		System.out.println(session.getAttribute("dSaup_no"));
		
		
		
		dStart = dStart.substring(0, 1) + dStart.substring(3, 4);
		
		
		dEnd = dEnd.substring(0,1) + dEnd.substring(3,4);
		
		
		List<MultipartFile> fileList = mr.getFiles("dPhoto");
		
		if (fileList != null && fileList.size() > 0) {
			
			for (MultipartFile file : fileList) {
				if (!file.isEmpty()) {
					String originFilename = file.getOriginalFilename();
					
					String extName = originFilename.substring(originFilename.lastIndexOf(".") +1 );
					
					String saveFilename = null;
					
					try {
						saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
								"_"+
								System.currentTimeMillis() + 
								"." + extName;
					
						String realPath = mr.getSession().getServletContext().getRealPath("/resources/storage");
						
						File directory = new File(realPath);
						if (!directory.exists()) {
							directory.mkdirs();
						}
						
						File saveFile = new File(realPath, saveFilename);
						
						file.transferTo(saveFile);
						
						lDAO.departUpdate(dSeat, dPhone, dName, dAddress, dStart, dEnd, dParking, dType);
						
						
					}catch (Exception e) {
						e.printStackTrace();
					}
					
				}
			}
			
		}
		
		
	}

}
