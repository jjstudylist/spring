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

	/** �ڹ� ���� �߼� 
	 * @throws MessagingException 
	 * @throws AddressException **/
	public void mailSender(MemberDTO member) throws AddressException, MessagingException {
		
		// ���̹��� ��� smtp.naver.com �� �Է��մϴ�.
		// Google�� ��� smtp.gmail.com �� �Է��մϴ�.
		String host = "smtp.naver.com";
		
		final String username = "dwal90_";       //���̹� ���̵� �Է����ּ���. @nave.com�� �Է����� ���ñ���.
		final String password = "037033zz";   //���̹� �̸��� ��й�ȣ�� �Է����ּ���.
		int port=465; //��Ʈ��ȣ
		 
		// ���� ����
		String recipient = member.getEmail();    //�޴� ����� �����ּҸ� �Է����ּ���.
		String subject = member.getName() + "�� ȸ�������� ���� �帳�ϴ�."; //���� ���� �Է����ּ���.
		
		// String vs StringBuilder ������
		// https://jeong-pro.tistory.com/85 ��������
		StringBuilder content = new StringBuilder();
		content.append("<html>");
		content.append("<body>");
		content.append("�ȳ��ϼ���. Sod Tour �Դϴ�.<br>");
		content.append(member.getName() + "�� ȸ�������� ���� �帳�ϴ�.<br>");
		content.append("���� Ȱ��ȭ�� ���� ������ �ʿ��մϴ�.<br>");
		content.append("���� ��ũ�� Ŭ���Ͽ� ���� ���� �ϼ���.<br>");
		content.append("<a href='http://localhost:8080/MemberConfirm?No=" + member.getNo() + "'>");
		content.append("Click Link!</a>");
		content.append("</body>");
		content.append("</html>");
		 
		Properties props = System.getProperties(); // ������ ��� ���� ��ü ����
		 
		// SMTP ���� ���� ����
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		   
		//Session ����
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username;
			String pw=password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); //for debug
		   
		MimeMessage mimeMessage = new MimeMessage(session); //MimeMessage ����
		try {
			mimeMessage.setFrom(new InternetAddress("dwal90_@naver.com", "Sod Tour"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} //�߽��� ���� , ������ ����� �̸����ּҸ� �ѹ� �� �Է��մϴ�. �̶��� �̸��� Ǯ �ּҸ� �� �ۼ����ּ���.
		
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //�����ڼ��� //.TO �ܿ� .CC(����) .BCC(��������) �� ����
		mimeMessage.setSubject(subject);  //�������
		mimeMessage.setContent(content.toString(), "text/html; charset=euc-kr");
		Transport.send(mimeMessage); //javax.mail.Transport.send() �̿�
		
	}
}
