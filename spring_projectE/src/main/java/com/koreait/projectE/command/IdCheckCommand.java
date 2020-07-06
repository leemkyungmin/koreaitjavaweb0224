package com.koreait.projectE.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;

public class IdCheckCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletRequest checkId = (HttpServletRequest)map.get("checkId");
		String cId = request.getParameter("cId");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		
		dao.idCheck(cId);
		
		
		
	}

}