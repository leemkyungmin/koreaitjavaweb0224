
package com.koreait.projectE.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.ListDAO;
import com.koreait.projectE.dto.DepartmentDTO;

public class SearchCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();		
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
		HttpServletResponse response = (HttpServletResponse) map.get("response");		
		String query = request.getParameter("main-search");		
		ListDAO lDAO = sqlSession.getMapper(ListDAO.class);		
		ArrayList<DepartmentDTO> list = lDAO.search_list(query);		
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
		
		/*Cookie[] cookies = request.getCookies();
		String addr="";
		JSONObject obj =new JSONObject();
		for(Cookie cook :cookies) {
			if(cook.getName().equals("query")) {
				System.out.println(cook.getValue());
				obj.put("query", cook.getValue()) ;
			}else {
				obj.put("query",query);
			}
		}
		
		

		System.out.println(obj);
		Cookie setCookie = new Cookie("query", obj.toString());
		setCookie.setMaxAge(60*60*24*7); 
		response.addCookie(setCookie);*/

	}

}
