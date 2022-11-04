package com.chall.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.model.UserDTO;

public class ChallJoinDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private static ChallJoinDAO instance;
		
	private ChallJoinDAO() {} 
	
	public static ChallJoinDAO getInstance() {
		if(instance == null) {
			instance = new ChallJoinDAO();
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
	
	
	// 기존 '임시' 상태 챌린지 삭제
	public void deleteExistingChall(int mem_num) {
		try {
			openConn();
			sql="delete from challenge_list where chall_creater_num = ? and chall_status = '임시'";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}	// deleteExistingChall() end
	
	
	// 첫번째 정보 입력(1-공개여부/2-챌린지 고유 번호/3-챌린지 상태/4-개설자 회원 번호)
	public int insertChall_1(String open, int mem_num) {

		int result = 0, count = 0;

		try {
			openConn();
			sql = "select max(chall_num) from challenge_list";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}
			sql = "insert into challenge_list values(?,?,'','','','','','','','','','','','','','','','','','',?,?,default,'','','','')";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, open);
			pstmt.setInt(2, count);
			pstmt.setString(3, "임시");
			pstmt.setInt(4, mem_num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // insertChall_1() end
	
	
	// 앞 페이지에서 개설하던 챌린지의 고유 번호 가져오기
	public int continueChallNum(int mem_num) {
		int count = 0;
		try {
			openConn();
			sql = "select max(chall_num) from challenge_list where chall_creater_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}	// continueChallNum() end
	
	
	// 두번째 정보 입력(1-제목/2-인증빈도/3-기간/4-시작일/5-인증방법/6-인증시작시간/7-인증종료시간/8-소개/9-인증성공이미지/10-인증실패이미지/11-소개이미지)
	public int updateChall_2(ChallJoinDTO dto) {
		
		int result = 0;
		
		try {
			openConn();
			sql = "update challenge_list set chall_title=?, chall_cycle=?,"
					+ "chall_duration=?, chall_startdate=?, chall_guide=?,"
					+ "chall_regitimestart=?, chall_regitimeend=?,"
					+ "chall_cont=?, chall_successimage=?, chall_failimage=?,"
					+ "chall_contimage=? where chall_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getChall_title());
			pstmt.setString(2, dto.getChall_cycle());
			pstmt.setString(3, dto.getChall_duration());
			pstmt.setString(4, dto.getChall_startDate());
			pstmt.setString(5, dto.getChall_guide());
			pstmt.setString(6, dto.getChall_regiTimeStart());
			pstmt.setString(7, dto.getChall_regiTimeEnd());
			pstmt.setString(8, dto.getChall_cont());
			pstmt.setString(9, dto.getChall_successImage());
			pstmt.setString(10, dto.getChall_failImage());
			pstmt.setString(11, dto.getChall_contImg());
			pstmt.setInt(12, dto.getChall_num());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // updateChall_2() end

	
	// 세번째 정보 입력(1-예치금(기본)/2-예치금(최대)/3-비공개 참여코드/4-최대 모집인원)
	public int updateChall_3(ChallJoinDTO dto) {
		int result = 0;
		
		try {
			openConn();
			sql = "update challenge_list set chall_depositDefault=?, chall_depositMax=?,"
					+ "chall_privateCode=?, chall_maxPeople=? where chall_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getChall_depositDefault());
			pstmt.setString(2, dto.getChall_depositMax());
			pstmt.setString(3, dto.getChall_privateCode());
			pstmt.setString(4, dto.getChall_maxPeople());
			pstmt.setInt(5, dto.getChall_num());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}	// updateChall_3() end
	
	
	// 카테고리 기본 메인 이미지 파일명 가져오기
	public String getCateDefaultImg(String categoryCode) {
		String img = "";
		try {
			openConn();
			sql = "select category_image from challenge_category where category_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, categoryCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				img = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return img;
	}	// getCateDefaultImg() end
	
	
	// 네번째 정보 입력(1-카테고리 코드/2-대표사진/3-키워드1/4-키워드2/5-키워드3)
		public int updateChall_4(ChallJoinDTO dto) {
			int result = 0;
			
			try {
				openConn();
				sql = "update challenge_list set chall_category_code_fk=?, chall_keyword1=?,"
						+ "chall_keyword2=?, chall_keyword3=?, chall_mainImage=?, chall_status='임시저장' where chall_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getChall_category_code_fk());
				pstmt.setString(2, dto.getChall_keyword1());
				pstmt.setString(3, dto.getChall_keyword2());
				pstmt.setString(4, dto.getChall_keyword3());
				pstmt.setString(5, dto.getChall_mainImage());
				pstmt.setInt(6, dto.getChall_num());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}	// updateChall_4() end
		
		
	public ChallJoinDTO getChallContent(int challNum) {
		ChallJoinDTO dto = new ChallJoinDTO();
		try {
			openConn();
			sql = "select * from challenge_list where chall_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, challNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setChall_open(rs.getString("chall_open"));
				dto.setChall_title(rs.getString("chall_title"));
				dto.setChall_mainImage(rs.getString("chall_mainImage"));
				dto.setChall_cycle(rs.getString("chall_cycle"));
				dto.setChall_duration(rs.getString("chall_duration"));
				dto.setChall_startDate(rs.getString("chall_startDate"));
				dto.setChall_guide(rs.getString("chall_guide"));
				dto.setChall_successImage(rs.getString("chall_successImage"));
				dto.setChall_failImage(rs.getString("chall_failImage"));
				dto.setChall_regiTimeStart(rs.getString("chall_regiTimeStart"));
				dto.setChall_regiTimeEnd(rs.getString("chall_regiTimeEnd"));
				dto.setChall_cont(rs.getString("chall_cont"));
				dto.setChall_contImg(rs.getString("chall_contImage"));
				dto.setChall_depositDefault(rs.getString("chall_depositDefault"));
				dto.setChall_depositMax(rs.getString("chall_depositMax"));
				dto.setChall_privateCode(rs.getString("chall_privateCode"));
				dto.setChall_maxPeople(rs.getString("chall_maxPeople"));
				dto.setChall_category_code_fk(rs.getString("chall_category_code_fk"));
				dto.setChall_ongoingPeople(rs.getInt("chall_ongoingPeople"));
				dto.setChall_creater_num(rs.getInt("chall_creater_num"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}	// getChallContent() end
	
	
	public UserDTO getMemInfo(int createrNum) {
		UserDTO dto = new UserDTO();
		try {
			openConn();
			sql = "select * from user_member where mem_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, createrNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setChallenge_made_count(rs.getInt("challenge_made_count"));
				dto.setChallenge_rating(rs.getInt("challenge_rating"));
				dto.setMem_img(rs.getString("mem_img"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}	// getMemInfo() end
	
	
	public int getMemMoney(int mem_num) {
		int mem_money = 0;
		try {
			openConn();
			sql = "select mem_money from user_member where mem_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mem_money=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return mem_money;
	}	// getMemMoney() end
}