package com.chall.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChallengeDAO {
	Connection con = null;
	PreparedStatement st = null;
	ResultSet rs = null;
	String sql = "";
	
	private static ChallengeDAO instance;
		
	private ChallengeDAO() {} 
	
	public static ChallengeDAO getinstance() {
		if(instance == null) {
			instance = new ChallengeDAO();
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
	public void closeConn(ResultSet rs, PreparedStatement st, Connection con) {
	
		try {
	
			if (rs != null) { rs.close(); }
			if (st != null) { st.close(); }
			if (con != null) { con.close(); }
	
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	public int getTotalRecord() {
		int result = 0;
		openConn();
		try {
			sql = "select count(*) from challenge_list";
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, st, con);
		}
		return result;
	}

	public List<ChallengeDTO> getChallengeList(int startNo, int lastNo) {
		List<ChallengeDTO> list = new ArrayList<ChallengeDTO>();
		openConn();
		try {
			sql = "select * from (select rownum as rnum , a.* from (select * from challenge_list order by chall_num)a where rownum <= ?) where rnum >= ?";
			st = con.prepareStatement(sql);
			st.setInt(1,lastNo);
			st.setInt(2,startNo);
			rs = st.executeQuery();
			while(rs.next()) {
				ChallengeDTO dto = new ChallengeDTO();
				dto.setChall_open(rs.getString("chall_open"));
				dto.setChall_num(rs.getInt("chall_num"));
				dto.setChall_title(rs.getString("chall_title"));
				dto.setChall_mainimage(rs.getString("chall_mainimage"));
				dto.setChall_cycle(rs.getString("chall_cycle"));
				dto.setChall_duration(rs.getString("chall_duration"));
				dto.setChall_startdate(rs.getString("chall_startdate"));
				dto.setChall_guide(rs.getString("chall_guide"));
				dto.setChall_successimage(rs.getString("chall_successimage"));
				dto.setChall_failmage(rs.getString("chall_failimage"));
				dto.setChall_regitimestart(rs.getString("chall_regitimestart"));
				dto.setChall_regitimeend(rs.getString("chall_regitimeend"));
				dto.setChall_cont(rs.getString("chall_cont"));
				dto.setChall_depositdefault(rs.getInt("chall_depositdefault"));
				dto.setChall_depositmax(rs.getString("chall_depositmax"));
				dto.setChall_privatecode(rs.getString("chall_privatecode"));
				dto.setChall_maxpeople(rs.getString("chall_maxpeople"));
				dto.setChall_category_code_fk(rs.getString("chall_category_code_fk"));
				dto.setChall_subcategory(rs.getString("chall_subcategory"));
				dto.setAdmin_id_fk(rs.getString("admin_id_fk"));
				dto.setChall_status(rs.getString("chall_status"));
				dto.setChall_creater_num(rs.getInt("chall_creater_num"));
				dto.setChall_ongoingpeople(rs.getInt("chall_ongoingpeople"));
				dto.setChall_contimage(rs.getString("chall_contimage"));
				dto.setChall_keyword1(rs.getString("chall_keyword1"));
				dto.setChall_keyword1(rs.getString("chall_keyword2"));
				dto.setChall_keyword1(rs.getString("chall_keyword3"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, st, con);
		}
		return list;
	}

	public ChallengeDTO getChallengeContent(int chall_num) {
		ChallengeDTO dto = null;
		openConn();
		try {
			sql = "select * from challenge_list where chall_num = ?";
			st = con.prepareStatement(sql);
			st.setInt(1,chall_num);
			rs = st.executeQuery();
			if(rs.next()) {
				dto = new ChallengeDTO();
				dto.setChall_open(rs.getString("chall_open"));
				dto.setChall_num(rs.getInt("chall_num"));
				dto.setChall_title(rs.getString("chall_title"));
				dto.setChall_mainimage(rs.getString("chall_mainimage"));
				dto.setChall_cycle(rs.getString("chall_cycle"));
				dto.setChall_duration(rs.getString("chall_duration"));
				dto.setChall_startdate(rs.getString("chall_startdate"));
				dto.setChall_guide(rs.getString("chall_guide"));
				dto.setChall_successimage(rs.getString("chall_successimage"));
				dto.setChall_failmage(rs.getString("chall_failimage"));
				dto.setChall_regitimestart(rs.getString("chall_regitimestart"));
				dto.setChall_regitimeend(rs.getString("chall_regitimeend"));
				dto.setChall_cont(rs.getString("chall_cont"));
				dto.setChall_depositdefault(rs.getInt("chall_depositdefault"));
				dto.setChall_depositmax(rs.getString("chall_depositmax"));
				dto.setChall_privatecode(rs.getString("chall_privatecode"));
				dto.setChall_maxpeople(rs.getString("chall_maxpeople"));
				dto.setChall_category_code_fk(rs.getString("chall_category_code_fk"));
				dto.setChall_subcategory(rs.getString("chall_subcategory"));
				dto.setAdmin_id_fk(rs.getString("admin_id_fk"));
				dto.setChall_status(rs.getString("chall_status"));
				dto.setChall_creater_num(rs.getInt("chall_creater_num"));
				dto.setChall_ongoingpeople(rs.getInt("chall_ongoingpeople"));
				dto.setChall_contimage(rs.getString("chall_contimage"));
				dto.setChall_keyword1(rs.getString("chall_keyword1"));
				dto.setChall_keyword1(rs.getString("chall_keyword2"));
				dto.setChall_keyword1(rs.getString("chall_keyword3"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, st, con);
		}
		return dto;
	}
}