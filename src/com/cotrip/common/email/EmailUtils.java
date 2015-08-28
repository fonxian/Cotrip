package com.cotrip.common.email;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.cotrip.bean.User;

public class EmailUtils {

	private static final String FROM = "cotrip@163.com";// 邮箱名，如：123@qq.com

	/**
	 * 注册成功后,向用户发送帐户激活链接的邮件
	 * 
	 * @param user
	 *            未激活的用户
	 */
	public static boolean sendAccountActivateEmail(String baseUrl,
			String email, String randomCode) {
		boolean flag = false;
		Session session = getSession();
		MimeMessage message = new MimeMessage(session);
		try {
			message.setSubject("Co-Trip帐户激活邮件");
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress(FROM));
			message.setRecipient(RecipientType.TO, new InternetAddress(email));
			message.setContent(
					"<a href='"
							+ GenerateLinkUtils.generateActivateLink(baseUrl,
									email, randomCode) + "'>点击激活帐户</a>",
					"text/html;charset=utf-8");
			// 发送邮件
			Transport.send(message);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 发送重设密码链接的邮件
	 */
	public static boolean sendResetPasswordEmail(String baseUrl, String email,
			String randomCode) {
		boolean flag = false;
		Session session = getSession();
		MimeMessage message = new MimeMessage(session);
		try {
			message.setSubject("找回您的帐户与密码");
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress(FROM));
			message.setRecipient(RecipientType.TO, new InternetAddress(email));
			message.setContent(
					"要使用新的密码, 请使用以下链接启用密码:<br/><a href='"
							+ GenerateLinkUtils.generateResetPwdLink(baseUrl,
									email, randomCode) + "'>点击重新设置密码</a>",
					"text/html;charset=utf-8");
			// 发送邮件
			Transport.send(message);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static Session getSession() {
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", "smtp.163.com");
		props.setProperty("mail.smtp.port", "25");
		props.setProperty("mail.smtp.auth", "true");
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				String password = "cotripchenzude";
//				InputStream is = EmailUtils.class
//						.getResourceAsStream("password.dat");
//				byte[] b = new byte[1024];
//				try {
//					int len = is.read(b);
//					System.out.println("len:"+len);
//					password = new String(b, 0, len);
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
				return new PasswordAuthentication(FROM, password);
			}

		});
		return session;
	}
}
