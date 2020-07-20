package com.koreait.projectE.command.Login;

import java.io.File;
import java.util.List;
import java.util.Map;

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
		HttpSession session = mr.getSession();
		
		String dSeat = mr.getParameter("dSeat");
		String dSaup_no = (String) session.getAttribute("dSaup_no");
		String dPhone = mr.getParameter("dPhone");
		String dName = mr.getParameter("dName");
		String dAddress = mr.getParameter("dAddress");
		String dStart = mr.getParameter("dStart");
		String dEnd = mr.getParameter("dEnd");
		String dParking = mr.getParameter("dParking");
		String dType = mr.getParameter("dType");
		String dNo = mr.getParameter("dNo");
		String[] menu = mr.getParameterValues("menu");
		String[] price = mr.getParameterValues("price");
		
		dStart = (dStart.substring(0, 2) + dStart.substring(3,4)+1);
		dEnd = (dEnd.substring(0,2) + dEnd.substring(3,4)+1);
		
		lDAO.menuDelete(dSaup_no);
		
		
		List<MultipartFile> fileList = mr.getFiles("dPhoto");
		String saveFilename = "";
		String amuguna = "";
		if (fileList != null && fileList.size() > 0) {
			
			for (MultipartFile file : fileList) {
				if (!file.isEmpty()) {
					String originFilename = file.getOriginalFilename();
					
					String extName = originFilename.substring(originFilename.lastIndexOf(".") +1 );
					
					
					
					try {
						saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
								"_"+
								System.currentTimeMillis() + 
								"." + extName;
						if(amuguna == "") {
							amuguna = saveFilename;
						} else {
							amuguna += ","+saveFilename;
						}
						String realPath = mr.getSession().getServletContext().getRealPath("/resources/storage/department_img");
						
						File directory = new File(realPath);
						if (!directory.exists()) {
							directory.mkdirs();
						}
						
						File saveFile = new File(realPath, saveFilename);
						
						file.transferTo(saveFile);
						
						
						
					}catch (Exception e) {
						e.printStackTrace();
					}
					
				}
			}
			
		}
		
		int result = lDAO.goDb(dSaup_no);
		
		
		if (result > 0) {
			lDAO.departUpdate(dSeat, dSaup_no, dPhone, dName, dAddress, dStart, dEnd, dParking, dType, amuguna, dNo);
		} else {
			lDAO.departInsert(dSeat, dSaup_no, dPhone, dName, dAddress, dStart, dEnd, dParking, dType, amuguna);
		}
		
		for(int i = 0; i < menu.length; i++) {
			lDAO.menuInsert(menu[i], price[i], dSaup_no);
		}
		
	}
	
	
	
}
