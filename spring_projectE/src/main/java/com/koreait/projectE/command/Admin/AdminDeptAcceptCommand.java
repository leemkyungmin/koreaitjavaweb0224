package com.koreait.projectE.command.Admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.adminDAO;

public class AdminDeptAcceptCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String dSaup_no = request.getParameter("dSaup_no");
		
		adminDAO aDAO = sqlSession.getMapper(adminDAO.class);
		aDAO.deptAccept(dSaup_no);

	}

}
