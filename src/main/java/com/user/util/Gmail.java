package com.user.util;

import javax.mail.PasswordAuthentication;

import com.sun.net.httpserver.Authenticator;

public class Gmail extends javax.mail.Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication(){
		// 관리자 계정 정보(계정,앱비밀번호)
		return new PasswordAuthentication("coya0319@gmail.com", "alxusktmnmnalibs");
	}
}
