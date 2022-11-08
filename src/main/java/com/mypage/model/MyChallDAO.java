package com.mypage.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chall.model.ChallCategoryDTO;
import com.chall.model.ChallengeDTO;
import com.user.model.UserDTO;

public class MyChallDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private static MyChallDAO instance;
		
	private MyChallDAO() {} 
	
	public static MyChallDAO getinstance() {
		if(instance == null) {
			instance = new MyChallDAO();
		}
		return instance;
	}
	

	// Connection을 가져오는 메서드
	public void openConn() {
	
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@projectchallengers_high?TNS_ADMIN=C:/ncs/download/apache-tomcat-9.0.65/Wallet_ProjectChallengers/";
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
	
	
	// 회원이 참여중인 챌린지 테이블의 전체 게시물의 수를 확인하는 메소드
	public int getBoardCount(int member_num) {
		
		int count = 0;
		
		UserDTO dto = new UserDTO();
		
		try {
			openConn();
			
			// 1. 해당 회원이 참여하고 있는 챌린지를 조회.
			sql="select my_challenge1, my_challenge2, my_challenge3, my_challenge4, my_challenge5, my_challenge6, my_challenge7, my_challenge8, my_challenge9, my_challenge10 from user_member where mem_num=? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, member_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setMy_challenge1(rs.getInt("my_challenge1"));
				dto.setMy_challenge2(rs.getInt("my_challenge2"));
				dto.setMy_challenge3(rs.getInt("my_challenge3"));
				dto.setMy_challenge4(rs.getInt("my_challenge4"));
				dto.setMy_challenge5(rs.getInt("my_challenge5"));
				dto.setMy_challenge6(rs.getInt("my_challenge6"));
				dto.setMy_challenge7(rs.getInt("my_challenge7"));
				dto.setMy_challenge8(rs.getInt("my_challenge8"));
				dto.setMy_challenge9(rs.getInt("my_challenge9"));
				dto.setMy_challenge10(rs.getInt("my_challenge10"));
			}
			
			// my_challenge 컬럼 = 챌린지 고유 번호!
			Integer my_chall1 = dto.getMy_challenge1();
			Integer my_chall2 = dto.getMy_challenge2();
			Integer my_chall3 = dto.getMy_challenge3();
			Integer my_chall4 = dto.getMy_challenge4();
			Integer my_chall5 = dto.getMy_challenge5();
			Integer my_chall6 = dto.getMy_challenge6();
			Integer my_chall7 = dto.getMy_challenge7();
			Integer my_chall8 = dto.getMy_challenge8();
			Integer my_chall9 = dto.getMy_challenge9();
			Integer my_chall10 = dto.getMy_challenge10();
			
			Integer [] my_challenges = {my_chall1, my_chall2, my_chall3, my_chall4, my_chall5, my_chall6, my_chall7, my_chall8, my_chall9, my_chall10};
			
			// 2. 각 컬럼 값이 있다면 count 변수에 +1.
			for(int i=0 ; i<10; i++ ) {
				if(my_challenges[i] != null) {
					count += 1;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return count;
	}	// getBoardCount() 메소드 end	
	
	// 해당 회원이 참여하고 있는 챌린지 리스트를 반환하는 메소드.
	public List<ChallengeDTO> getOngoingChallList(int member_num) {
		
		UserDTO dto = new UserDTO();
		
		List<ChallengeDTO> list = new ArrayList<ChallengeDTO>();
		
		// 1. 해당 회원이 참여하고 있는 챌린지의 고유 번호 조회.
		sql="select my_challenge1, my_challenge2, my_challenge3, my_challenge4, my_challenge5, my_challenge6, my_challenge7, my_challenge8, my_challenge9, my_challenge10 "
				+ "from user_member where mem_num=? ";
		
		try {
			openConn();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setMy_challenge1(rs.getInt("my_challenge1"));
				dto.setMy_challenge2(rs.getInt("my_challenge2"));
				dto.setMy_challenge3(rs.getInt("my_challenge3"));
				dto.setMy_challenge4(rs.getInt("my_challenge4"));
				dto.setMy_challenge5(rs.getInt("my_challenge5"));
				dto.setMy_challenge6(rs.getInt("my_challenge6"));
				dto.setMy_challenge7(rs.getInt("my_challenge7"));
				dto.setMy_challenge8(rs.getInt("my_challenge8"));
				dto.setMy_challenge9(rs.getInt("my_challenge9"));
				dto.setMy_challenge10(rs.getInt("my_challenge10"));
			}
			
				// my_challenge 컬럼 = 챌린지 고유 번호!
				int my_chall1 = dto.getMy_challenge1();
				int my_chall2 = dto.getMy_challenge2();
				int my_chall3 = dto.getMy_challenge3();
				int my_chall4 = dto.getMy_challenge4();
				int my_chall5 = dto.getMy_challenge5();
				int my_chall6 = dto.getMy_challenge6();
				int my_chall7 = dto.getMy_challenge7();
				int my_chall8 = dto.getMy_challenge8();
				int my_chall9 = dto.getMy_challenge9();
				int my_chall10 = dto.getMy_challenge10();

				
				// row_number() 함수 사용
/*				sql = "select chall_num,CHALL_CATEGORY_CODE_FK,chall_status,chall_title,chall_duration,chall_mainImage from "
						+ "(select row_number() over(order by chall_num desc) rnum, "
						+ "b.* from "
						+ "(select * from challenge_list "
						+ "where chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ?) b) "
						+ "where rnum>= ? and rnum<=?";
				*/
				
				
				//sql = "select * from (select rownum as rnum , a.* from (select * from challenge_list where chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? order by chall_num desc) a where rownum <= ?) where rnum >= ?";
				
				sql = "select * from (select * from challenge_list where chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ? or chall_num = ?) where chall_status='진행중' order by chall_num desc";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, my_chall1);
				pstmt.setInt(2, my_chall2);
				pstmt.setInt(3, my_chall3);
				pstmt.setInt(4, my_chall4);
				pstmt.setInt(5, my_chall5);
				pstmt.setInt(6, my_chall6);
				pstmt.setInt(7, my_chall7);
				pstmt.setInt(8, my_chall8);
				pstmt.setInt(9, my_chall9);
				pstmt.setInt(10, my_chall10);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					ChallengeDTO challDto = new ChallengeDTO();
					
					challDto.setChall_num(rs.getInt("chall_num"));
					challDto.setChall_category_code_fk(rs.getString("CHALL_CATEGORY_CODE_FK"));
					challDto.setChall_status(rs.getString("chall_status"));
					challDto.setChall_title(rs.getString("chall_title"));
					challDto.setChall_duration(rs.getString("chall_duration"));
					challDto.setChall_mainimage(rs.getString("chall_mainImage"));
					
					list.add(challDto);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}
	
}
