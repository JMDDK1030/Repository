package mail;

import java.util.Map;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class NaverSMTP {
	
	private final Properties serverInfo;
	private final Authenticator auth;
	
	public NaverSMTP() {
		
		serverInfo = new Properties();
		serverInfo.put("mail.smtp.host"	, "smtp.naver.com");
		serverInfo.put("mail.smtp.port", "465");
		serverInfo.put("mail.smtp.starttls.enable", "true");
		serverInfo.put("mail.smtp.auth", "true");
		serverInfo.put("mail.smtp.debug", "true");
		serverInfo.put("mail.smtp.socketFactory.port", "465");
		serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		serverInfo.put("mail.smtp.socketFactory.fallback", "false");
		
		auth = new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("guswo0807", "zhddl1030#");	
			
			}
		
		};
	
	}
	
	public void emailSending(Map<String, String> email) throws MessagingException {
		
		Session session = Session.getInstance(serverInfo, auth);
		session.setDebug(true);
		
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(email.get("from")));
		msg.addRecipient(Message.RecipientType.TO,new InternetAddress(email.get("to")));
		msg.setSubject(email.get("subject"));
		msg.setContent(email.get("content"),email.get("format"));
		
		Transport.send(msg);
		
	}
		
		
}	
	
	