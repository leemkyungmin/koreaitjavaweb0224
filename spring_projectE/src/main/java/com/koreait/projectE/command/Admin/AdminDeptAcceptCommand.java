package com.koreait.projectE.command.Admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.AdminDAO;

public class AdminDeptAcceptCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int dNo = Integer.parseInt(request.getParameter("dNo"));
		
		AdminDAO aDAO = sqlSession.getMapper(AdminDAO.class);
		aDAO.deptAccept(dNo);

	}

}
