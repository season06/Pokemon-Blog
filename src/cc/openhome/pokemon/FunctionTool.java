package cc.openhome.pokemon;

import java.io.*;
import java.util.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.mail.*;
import javax.mail.internet.*;

public class FunctionTool
{
	public static String Encrypt(String password)
	{
		char[] hexDigest = new char[]{'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = password.getBytes();
			md.update(bytes);
			byte[] newBytes = md.digest();
			
			char[] result = new char[newBytes.length*2];
			for(int i = 0, j = 0; i < newBytes.length; i++)
			{
				byte c = newBytes[i];
				result[j++] = hexDigest[c >>> 4 & 0xf];
				result[j++] = hexDigest[c & 0xf];
			}
			return new String(result);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public static void SendMail(String to, String type) throws MessagingException, AddressException, IOException
	{
		String mailHost = "smtp.gmail.com";
		String mailPort = "465";
		String username = "mimi871006";
		String password = "season1006";
		String from = "mimi871006@gmail.com";
		String title = "PokemonBlog ";
		String content = "";
		if(type == "register")
		{
			title += "register sucess" ;
			content = "Welcome to join PokemonBlog~";
		}
		else if(type == "forget password")
		{
			title += "change password sucess" ;
			content = "Please remember your password next time~";
		}

	    Properties props;
        props = new Properties();
        props.put("mail.smtp.host", mailHost);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", mailPort);
        props.setProperty("mail.smtp.socketFactory.port", mailPort);
        props.setProperty("mail.smtp.auth", "true");
        
		Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password); }} );
	
		MimeMessage message = new MimeMessage(session);  
        message.setFrom(new InternetAddress(from));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to)); 
        message.setSubject(title);
        message.setText(content);
        message.setSentDate(new Date());
        System.out.println("6");
        
        Transport.send(message);
        System.out.println("7");
        
	}
}
