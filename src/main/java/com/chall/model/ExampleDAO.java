package com.chall.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ExampleDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private static ExampleDAO instance;
		
	private ExampleDAO() {} 
	
	public static ExampleDAO getinstance() {
		if(instance == null) {
			instance = new ExampleDAO();
		}
		return instance;
	}
	

// Connection을 가져오는 메서드
	public void openConn() {
	
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@projectchallengers_high?TNS_ADMIN=C:/NCS/downroad/apache-tomcat-9.0.65/Wallet_ProjectChallengers";
		String user = "ADMIN";
		String password = "WelcomeTeam2";
	
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
	
		} catch(Exception e){
			e.printStackTrace();
		}
	} // openConn() END
	
	
// 사용한 자원을 반환하는 메서드
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
	
		try {
	
			if (rs != null) { rs.close(); }
			if (pstmt != null) { pstmt.close(); }
			if (con != null) { con.close(); }
	
		}catch(SQLException e){
			e.printStackTrace();
		}
	} // closeConn() END
	
	
	// DB에 연결하여 challenge_category 테이블의 값을 가져올 수 있는지 테스트하는 메서드
	public String testDB() {
	
		String result = "";
	
		try {
	
			openConn();
	
			sql ="select * from challenge_category";
			pstmt = con.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
	
			if(rs.next()) {
				result = rs.getString(1);
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
	
		return result;
	
	} // testDB() END
	
}