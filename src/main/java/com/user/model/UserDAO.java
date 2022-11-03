package com.user.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private static UserDAO instance;
		
	private UserDAO() {} 
	
	public static UserDAO getinstance() {
		if(instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}
	

// Connection을 가져오는 메서드
	public void openConn() {
	
		String driver = "oracle.jdbc.driver.OracleDriver";

		String url = "jdbc:oracle:thin:@projectchallengers_high?TNS_ADMIN=C:/NCS/downroad/apache-tomcat-9.0.65/Wallet_ProjectChallengers/";

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
	
	// 회원인 지 체크하는 메소드.
	public int userCheck(String id, String pwd) {
		
		int result = 0;
		
		try {
			openConn();
			
			sql = "select * from user_member where mem_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				if(pwd.equals(rs.getString("mem_pwd"))) {
					// 회원인 경우
					result = 1;
				}else {
					// 회원 아이디는 맞으나 비밀번호가 틀린 경우
					result = -1;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}	// userCheck() 메소드 end
	
	// id에 해당하는 회원의 정보를 조회하는 메소드
	public UserDTO getMember(String id) {
		
		UserDTO dto = null;

		try {
			openConn();
			
			sql = "select * from user_member where mem_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();	
			
			if(rs.next()) {
				dto = new UserDTO();
				
				dto.setMem_num(rs.getInt("mem_num"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_age(rs.getInt("mem_age"));
				dto.setMem_phone(rs.getString("mem_phone"));
				dto.setMem_addr(rs.getString("mem_addr"));
				dto.setMem_xp(rs.getInt("mem_xp"));
				dto.setMem_level(rs.getString("mem_level"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setMem_money(rs.getInt("mem_money"));
				dto.setMem_reward(rs.getInt("mem_reward"));
				dto.setChallenge_count(rs.getInt("challenge_count"));
				dto.setChallenge_complete_count(rs.getInt("challenge_complete_count"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
		
	}	// getMember() 메소드 end
	
	// user_member 테이블에서 회원번호에 해당하는 회원의 정보를 가져오는 메소드
	public UserDTO getMemberInfo(int member_num) {
		
		UserDTO dto = null;
		
		try {
			openConn();
			
			sql = "select * from user_member where mem_num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, member_num);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new UserDTO();
				
				dto.setMem_num(rs.getInt("mem_num"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_age(rs.getInt("mem_age"));
				dto.setMem_phone(rs.getString("mem_phone"));
				dto.setMem_addr(rs.getString("mem_addr"));
				dto.setMem_xp(rs.getInt("mem_xp"));
				dto.setMem_level(rs.getString("mem_level"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setMem_money(rs.getInt("mem_money"));
				dto.setMem_reward(rs.getInt("mem_reward"));
				dto.setChallenge_count(rs.getInt("challenge_count"));
				dto.setChallenge_complete_count(rs.getInt("challenge_complete_count"));
				dto.setMem_report_count(rs.getInt("mem_report_count"));
				dto.setMem_email(rs.getString("mem_email"));
				dto.setMem_gender(rs.getString("mem_gender"));
				dto.setMem_img(rs.getString("mem_img"));
				dto.setChallenge_made_count(rs.getInt("challenge_made_count"));
				dto.setChallenge_rating(rs.getInt("challenge_rating"));
				dto.setMem_birth(rs.getString("mem_birth"));
				dto.setPostcode(rs.getInt("postcode"));
				dto.setRoadAddress(rs.getString("roadaddress"));
				dto.setJibunAddress(rs.getString("jibunaddress"));
				dto.setDetailAddress(rs.getString("detailaddress"));
				dto.setExtraAddress(rs.getString("extraaddress"));
				dto.setEmailId(rs.getString("emailid"));
				dto.setEmailDomain(rs.getString("emaildomain"));
				dto.setNationNo(rs.getString("nationno"));
				dto.setPhoneNo(rs.getString("phoneno"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}	// getMemberInfo() 메소드 end
	
	// 카카오 이메일로 DB에 존재하는 회원인지 확인하는 메소드.
	public String savedUserCheck(String email) {
		
		String savedUser = null;
		
		UserDTO dto = null;
		
		try {
			openConn();
			
			sql = "select * from user_member where mem_email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// 카카오에서 받아온 이메일을 가진 회원이 이미 있으면 yes
				savedUser = "yes";
			}else {
				savedUser = "no";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return savedUser;
		
	} // savedUserCheck() 메소드 end

	// user_member 테이블에 회원을 추가하는 메소드.
	public int insertMember(UserDTO dto) {
		
		int result = 0, count = 0;
		
		try {
			openConn();
			
			// 회원번호 최댓값 구하기
			sql = "select max(mem_num) from user_member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			// 생년월일로 나이 구하기
			
			sql = "insert into user_member (mem_num, mem_id, mem_pwd, mem_name, mem_age, mem_gender, mem_email, mem_phone, mem_addr, regdate, mem_birth, emailid, emaildomain, postcode, roadAddress, jibunAddress, detailAddress, extraAddress, nationNo , phoneNo) values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? )";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getMem_id());
			pstmt.setString(3, dto.getMem_pwd());
			pstmt.setString(4, dto.getMem_name());
			pstmt.setInt(5, dto.getMem_age());
			pstmt.setString(6, dto.getMem_gender());
			pstmt.setString(7, dto.getMem_email());
			pstmt.setString(8, dto.getMem_phone());
			pstmt.setString(9, dto.getMem_addr());
			pstmt.setString(10, dto.getMem_birth());
			pstmt.setString(11, dto.getEmailId());
			pstmt.setString(12, dto.getEmailDomain());
			pstmt.setInt(13, dto.getPostcode());
			pstmt.setString(14, dto.getRoadAddress());
			pstmt.setString(15, dto.getJibunAddress());
			pstmt.setString(16, dto.getDetailAddress());
			pstmt.setString(17, dto.getExtraAddress());
			pstmt.setString(18, dto.getNationNo());
			pstmt.setString(19, dto.getPhoneNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
		
	}	// insertMember() 메소드 end

	
}