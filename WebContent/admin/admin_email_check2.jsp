<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" errorPage="/errFolder/errPage.jsp" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@page import="javax.mail.Authenticator" %>
<%@page import="javax.mail.PasswordAuthentication" %>
<%@page import="java.util.Properties" %>
<%

  // 받아온 변수...
  String sResult = "OK";
  try{
      String st = request.getParameter("email");// 받는 사람

      String sbj = "Challenger "+request.getParameter("name")+"회원님의 임시 비밀번호입니다.";
      String sf = "dltprjs1@naver.com";   // 보내는 사람(인증 정보와 동일한 email 주소여야 함!!)
      String sMsg = request.getParameter("key");

      Properties p = new Properties(); // 정보를 담을 객체
      p.put("mail.smtp.ssl.protocols", "TLSv1.2");
      p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP

      p.put("mail.smtp.port", "465");
      // p.put("mail.smtp.starttls.enable", "false");   // 이부분은 true,false든 일단 제외시키니깐 정상작동되네...
      p.put("mail.smtp.auth", "true");
      p.put("mail.smtp.debug", "true");
      p.put("mail.smtp.socketFactory.port", "465");
      p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      p.put("mail.smtp.socketFactory.fallback", "false");


      //Get the Session object.
      try {

        Session mailSession = Session.getInstance(p,
                new javax.mail.Authenticator() {
                  protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("dltprjs1","@@tprjs1822216");    // 네이버 메일 ID / PWD
                  }
                });

        mailSession.setDebug(true);

        // Create a default MimeMessage object.
        Message message = new MimeMessage(mailSession);

        // Set From: header field of the header.
        message.setFrom(new InternetAddress(sf));

        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(st));

        // Set Subject: header field
        message.setSubject(sbj);

        // Now set the actual message
        message.setContent(sMsg, "text/html;charset=utf-8"); // 내용과 인코딩

        // Send message
        Transport.send(message);

        // System.out.println("Sent message successfully....");
        // sResult = "Sent message successfully....";

      } catch (MessagingException e) {
        e.printStackTrace();
        System.out.println("Error: unable to send message...." + e.toString());
        sResult = "ERR";
      }
  }catch (Exception err){
    System.out.println(err.toString());
    sResult = "ERR";
  }finally {
    // dbhandle.close(dbhandle.con);
  }
%>
<% out.clear(); %><%=sResult%>
<%
	PrintWriter outer = response.getWriter();
	if (sResult.equals("OK")) {
		outer.println("<script>");
		outer.println("alert('이메일을 성공적으로 발송했습니다.')");
		outer.println("location.href='admin_login.do'");
		outer.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>