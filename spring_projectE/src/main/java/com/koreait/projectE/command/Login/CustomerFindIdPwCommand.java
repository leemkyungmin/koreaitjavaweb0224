package com.koreait.projectE.command.Login;

import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

public class CustomerFindIdPwCommand {

	public String execute(SqlSession sqlSession, Model model) {
		
		String authKey = "";	
		String randomnum ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"; 
		try {
				
			Map<String, Object> map = model.asMap();
			JavaMailSender mailSender = (JavaMailSender)map.get("mailSender");
						
			String cEmail =(String) map.get("cEmail");
			String type =(String) map.get("type");
			// SimpleMailMessage 클래스가 이메일 내용을 작성한다. 
			SimpleMailMessage message = new SimpleMailMessage();
			
			message.setFrom("koreaplate@gmail.com");  // 보내는 사람의 메일 주소
			message.setTo(cEmail); // 받는 사람의 메일 주소
			if(type =="id") {
				
				message.setSubject((String)map.get("cName") + "님 아이디 입니다.");
				message.setText((String)map.get("cName") +"님의 아이디는 ");
				message.setText((String)map.get("cId") + "입니다.");
			}else if(type=="pw") {
				for(int i=0; i<10; i++) {
					authKey+=randomnum.charAt((int) (Math.random() * randomnum.length())); 
					//randomnum 에서 랜덤으로 가져오기 
				}
				message.setSubject((String)map.get("cId") + "님 임시 비밀번호입니다.\n");
				message.setText((String)map.get("cId") + "님\n" +
						"임시 비밀번호는 : " +authKey +" 입니다.\n" +
						"로그인후 비밀번호를 변경해주세요.\n");
			}

			mailSender.send(message);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		return authKey;
	}

}
