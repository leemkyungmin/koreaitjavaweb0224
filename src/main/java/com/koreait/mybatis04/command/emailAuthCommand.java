package com.koreait.mybatis04.command;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

public class emailAuthCommand implements ImageBoardCommand {

	@Override
	public void execute(SqlSession sqlsession, Model model) {
		try {
			
			long authkey;
			Map<String,Object> map = model.asMap();
			String email = (String) map.get("email");
			JavaMailSender mailSender = (JavaMailSender) map.get("mailSender");
			
			
			//SimpleMailMessage 클래스가  이메일 내용을 작성한다. 
			
			SimpleMailMessage message =new SimpleMailMessage();
			
			//보내는 사람
			message.setFrom("admin@gmail.com");  // 보내는 사람의 메일 주소 
			
			//받는 사람
			message.setTo(email);
			
			//제목
			message.setSubject("인증메일입니다");
			
			//내용
			//인증키 생성
			authkey=(long)(Math.random()*10000000000l)+123456789;
			message.setText("다음 인증 번호를 입력하세요 ");
			message.setText("인증번호 : "+authkey);
			
			//mailSender 는  send()메소드로 이메일을 보낸다.
			
			mailSender.send(message);
			model.addAttribute("authkey", authkey);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
