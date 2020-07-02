package com.koreait.mybatis04.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface ImageBoardCommand {

	public void execute(SqlSession sqlsession,Model model);
}
