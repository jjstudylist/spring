package com.erp.app.service;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.stereotype.Service;
import com.erp.app.dto.MemberDTO;

/**
 * Common
 */
@Service
public class CommonService {

	/** 자바 메일 발송 
	 * @throws MessagingException 
	 * @throws AddressException **/
	public void mailSender(MemberDTO member) throws AddressException, MessagingException {
		
		// 네이버일 경우 smtp.naver.com 을 입력합니다.
		// Google일 경우 smtp.gmail.com 을 입력합니다.
		String host = "smtp.naver.com";
		
		final String username = "dwal90_";       //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요.
		final String password = "037033zz";   //네이버 이메일 비밀번호를 입력해주세요.
		int port=465; //포트번호
		 
		// 메일 내용
		String recipient = member.getEmail();    //받는 사람의 메일주소를 입력해주세요.
		String subject = member.getName() + "님 회원가입을 축하 드립니다."; //메일 제목 입력해주세요.
		
		// String vs StringBuilder 차이점
		// https://jeong-pro.tistory.com/85 설명참조
		StringBuilder content = new StringBuilder();
		content.append("<html>");
		content.append("<body>");
		content.append("안녕하세요. Sod Tour 입니다.<br>");
		content.append(member.getName() + "님 회원가입을 축하 드립니다.<br>");
		content.append("계정 활성화를 위한 인증이 필요합니다.<br>");
		content.append("다음 링크를 클릭하여 계정 인증 하세요.<br>");
		content.append("<a href='http://localhost:8080/MemberConfirm?No=" + member.getNo() + "'>");
		content.append("Click Link!</a>");
		content.append("</body>");
		content.append("</html>");
		 
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성
		 
		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		   
		//Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username;
			String pw=password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); //for debug
		   
		MimeMessage mimeMessage = new MimeMessage(session); //MimeMessage 생성
		try {
			mimeMessage.setFrom(new InternetAddress("dwal90_@naver.com", "Sod Tour"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
		
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
		mimeMessage.setSubject(subject);  //제목셋팅
		mimeMessage.setContent(content.toString(), "text/html; charset=euc-kr");
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
		
	}
}
