package com.spring.main.util;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.*;

public class EmailTest {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
   public String gmailtest(String email, String authNum) throws Exception{
        
        // 메일 관련 정보
        final String username="";	//google 이메일 아이디를 기재합니다.
    	final String password="";  //google 이메일 비밀번호를 기재합니다.
        
         
        Properties props = System.getProperties();
          
          
        props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", "25"); 
		props.put("mail.debug", "true"); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.starttls.enable","true"); 
		props.put("mail.smtp.EnableSSL.enable","true");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
		props.setProperty("mail.smtp.socketFactory.fallback", "false");   
		props.setProperty("mail.smtp.port", "465");   
		props.setProperty("mail.smtp.socketFactory.port", "465"); 
	
		Session session = Session.getInstance(props, 
		 new javax.mail.Authenticator() { 
		protected PasswordAuthentication getPasswordAuthentication() { 
		return new PasswordAuthentication(username, password); 
		}});
		System.out.println("??");
		try{
			Message message = new MimeMessage(session); 
			message.setFrom(new InternetAddress(""));// //google 이메일 주소를 기재합니다.
			message.setRecipients(Message.RecipientType.TO,
 InternetAddress.parse(email)); 
			message.setSubject("SGM 인증번호입니다.");//제목
			message.setText("인증번호[ "+authNum+" ]");//내용 
			
 //message.setContent("내용","text/html; charset=utf-8");//글내용을 html타입 charset설정
			
			System.out.println("send!!!");
			Transport.send(message);
			System.out.println("SEND");
			
		} catch(Exception e){
			e.printStackTrace();
		}
		return "인증번호가 보내졌습니다.";
 
    }
}