package com.user.util;

import java.security.MessageDigest;

public class SHA256 {
		// 이메일(input)을 입력하면 해시를 적용한 값을 반환하여 이용하도록 해주는 메소드.
		public static String getSHA256(String input) {
			StringBuffer result = new StringBuffer();
			
			try {
				// 사용자가 입력한 값을 SHA-256으로 알고리즘 적용할 수 있도록 하기.
				MessageDigest digest = MessageDigest.getInstance("SHA-256");
				// 해킹 방지를 위해 단순 SHA-256값이 아닌 솔트값을 적용.
				byte[] salt = "Hello! This Salt".getBytes();	
				digest.reset();
				digest.update(salt);
				byte[] chars = digest.digest(input.getBytes("UTF-8"));
				for(int i=0; i<chars.length; i++) {
					String hex = Integer.toHexString(0xff & chars[i]);
					if(hex.length() == 1) result.append("0");
					result.append(hex);
					
				}
			} catch (Exception e) {
				e.printStackTrace(); // 오류 발생 시 출력
			}
			return result.toString();	// 결과를 반환
			
		}
}
