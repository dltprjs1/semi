package com.chall.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chall.controller.OjdbcUrl;

public class ChallMoneyLogDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private static ChallMoneyLogDAO instance;
		
	private ChallMoneyLogDAO() {} 
	
	public static ChallMoneyLogDAO getInstance() {
		if(instance == null) {
			instance = new ChallMoneyLogDAO();
		}
		return instance;
	}
	
	OjdbcUrl oju = new OjdbcUrl();
	

// Connection을 가져오는 메서드
	public void openConn() {
	
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = oju.getUrl();
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
	
	
	public void insertMoneyLog(int memberNum, int chall_num, int depositMinus, int myDeposit) {
		try {
			openConn();
			sql = "insert into money_log values(?,?,?,'참가',sysdate,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNum);
			pstmt.setInt(2, chall_num);
			pstmt.setInt(3, depositMinus);
			pstmt.setInt(4, myDeposit);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}	// insertMoneyLog() end
}