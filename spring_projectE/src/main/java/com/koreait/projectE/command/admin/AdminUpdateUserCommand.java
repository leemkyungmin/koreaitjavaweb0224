package com.koreait.projectE.command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.adminDAO;
import com.koreait.projectE.dto.CustomerDTO;

public class AdminUpdateUserCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int cNo =Integer.parseInt(request.getParameter("cNo"));
		
		adminDAO aDao = sqlSession.getMapper(adminDAO.class);
		CustomerDTO cDTO = aDao.UpdateUserPage(cNo);
		model.addAttribute("cDTO", cDTO);
	}

}
