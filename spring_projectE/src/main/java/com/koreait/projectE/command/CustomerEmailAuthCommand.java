package com.koreait.projectE.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;

public class CustomerEmailAuthCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		try {
			
			long authKey = 0;	
				
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			JavaMailSender mailSender = (JavaMailSender)map.get("mailSender");
			
			// SimpleMailMessage 클래스가 이메일 내용을 작성한다. 
			SimpleMailMessage message = new SimpleMailMessage();
			
			message.setFrom("admin@gmail.com");  // 보내는 사람의 메일 주소
			message.setTo(request.getParameter("email")); // 받는 사람의 메일 주소
			message.setSubject("인증메일입니다."); // 제목
			authKey = (long)(Math.random() * 1000000000) + 12345678; // 자유롭게 인증키 생성
			message.setText("다음 인증 번호를 입력하세요."); // 내용
			message.setText("인증번호 : " + authKey); // 내용 
			
			// mailSender 는 send() 메소드로 이메일을 보낸다.
			
			mailSender.send(message);
			
			// authKey 를 emailAuthConfirm.jsp 로 보낸다.
			model.addAttribute("authKey", authKey); // 값을 보내줘야 기억하고 비교를 한다.
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		
	}

}
