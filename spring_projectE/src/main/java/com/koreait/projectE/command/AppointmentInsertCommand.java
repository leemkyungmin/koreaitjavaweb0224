package com.koreait.projectE.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.AppointmentDAO;

public class AppointmentInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String aDate_day = request.getParameter("aDate_day"); // yyyy년 MM월 dd일
		String aDate_hour = request.getParameter("aDate_hour"); // hh:mm
		String aDate = aDate_day + " " + aDate_hour;
		int aP_count = Integer.parseInt(request.getParameter("aP_count")); // 예약인원
		int cNo = Integer.parseInt(request.getParameter("cNo")); // 고객번호
		String dSaup_no = request.getParameter("dSaup_no"); // 사업자번호
		
		AppointmentDAO aDAO = sqlSession.getMapper(AppointmentDAO.class);
		
		aDAO.insertAppointment(aDate, aP_count, cNo, dSaup_no);
	}
	
}
