package com.koreait.mybatis04.command;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mybatis04.dao.ImageBoardDAO;
import com.koreait.mybatis04.dto.ImageBoardDTO;

public class imageBoardListCommand implements ImageBoardCommand {

	@Override
	public void execute(SqlSession sqlsession, Model model) {
		
		ImageBoardDAO idao = sqlsession.getMapper(ImageBoardDAO.class);
		
		ArrayList<ImageBoardDTO> list =idao.selectimageBoardList();
		
		model.addAttribute("list", list);

	}

}
