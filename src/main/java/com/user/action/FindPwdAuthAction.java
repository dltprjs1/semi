package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.util.Gmail;
import com.user.util.SHA256;

public class FindPwdAuthAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 비밀번호 찾기 폼 페이지에서 입력한 정보와 일치하는 정보가 DB에 있는 지 확인 후 
		// 있으면 인증번호를 보내주고 인증번호 입력 뷰 페이지로 이동시키는 비즈니스 로직.
		
		String name = (String)request.getParameter("name");
		String id = (String)request.getParameter("id");
		String email = (String)request.getParameter("email");

		// 입력한 정보와 일치하는 정보가 DB에 있는 지 확인하는 메소드 호출.
		UserDAO dao = UserDAO.getinstance();
		String host = "http://localhost:8282/Semi_Challengers/";
		String from = "coya0319@gmail.com";	// 보내는 구글 이메일 계정
		String to = "wltndi319@naver.com";	// 받는 이메일 계정
		String subject = "인증 메일입니다.";	// 메일 제목
		String content = "다음 링크에 접속하여 이메일 인증을 진행하세요."
					+ "<a href='" + host + "findPwdAuthCheck.jsp?code=" 
					+ new SHA256().getSHA256(to)+"'>이메일 인증하기</a>"; // 메일 내용
		Properties p = new Properties();
		p.put("mail.smtp.user", from);	
		p.put("mail.smtp.host", "smtp.gmail.com"); // 구글에서 제공하는 smtp 서버
		p.put("mail.smtp.port", "465");	// 구글이 제공하는 포트
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 코드
		p.put("mail.smtp.ssl.enable", "true");  // 추가된 코드
		
		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			// MimeMessage : 실제로 메일 보내는 객체
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);							// 메일 제목
			Address fromAddr = new InternetAddress(from);		// 보내는 사람 정보
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);			// 받는 사람 정보
			msg.addRecipient(Message.RecipientType.TO, toAddr);	
			msg.setContent(content, "text/html;charset=UTF8");	// 메일 내용
			Transport.send(msg); 								// 실제로 메세지를 전송.
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('오류가 발생했습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		
		// 이메일 인증 페이지로 이동
		forward.setPath("member_findPwdAuth.do");
			
		return forward;
	}

}
