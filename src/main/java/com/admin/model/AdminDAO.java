package com.admin.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	Connection con = null;
	PreparedStatement st = null;
	ResultSet rs = null;
	String sql = null;

	private static AdminDAO instance;
	private AdminDAO() {  }  // 기본 생성자
	public static AdminDAO getInstance() {

		if(instance == null) {
			instance = new AdminDAO();
		}

		return instance;
	}

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

	public void closeConn(ResultSet rs,
			PreparedStatement st, Connection con) {

		try {
			if(rs != null) rs.close();

			if(st != null) st.close();

			if(con != null) con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}

	}  // closeConn() 메서드 end
	public int getAdminlogin(String admin_id, String admin_pwd) {
		int result = 0;
		openConn();
		try {
			sql = "select * from admin_member where admin_id = ?";
			st = con.prepareStatement(sql);
			st.setString(1,admin_id);
			rs = st.executeQuery();
			if(rs.next()) {
				if(rs.getString("admin_pwd").equals(admin_pwd)) {
					result = 1;
				}else {
					result = -1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, st, con);
		}
		return result;
	}
	public AdminDTO getAdmin(String admin_id) {
		AdminDTO dto = null;
		openConn();
		try {
			sql = "select * from admin_member where admin_id = ?";
			st = con.prepareStatement(sql);
			st.setString(1,admin_id);
			rs = st.executeQuery();
			if(rs.next()) {
				dto = new AdminDTO();
				dto.setAdmin_num(rs.getInt("admin_num"));
				dto.setAdmin_id(rs.getString("admin_id"));
				dto.setAdmin_pwd(rs.getString("admin_pwd"));
				dto.setAdmin_name(rs.getString("admin_name"));
				dto.setAdmin_age(rs.getInt("admin_age"));
				dto.setAdmin_addr(rs.getString("admin_addr"));
				dto.setAdmin_phone(rs.getString("admin_phone"));
				dto.setAdmin_regdate(rs.getString("admin_regdate"));
				dto.setAdmin_email(rs.getString("admin_email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, st, con);
		}
		return dto;
	}
	public int adminJoin(AdminDTO dto) {
		int result = 0,count =0;
		openConn();
		try {
			sql = "select max(admin_num) from admin_member";
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1)+1;
			}
			sql = "insert into admin_member values(?,?,?,?,?,?,?,sysdate,?)";
			st = con.prepareStatement(sql);
			st.setInt(1,count);
			st.setString(2,dto.getAdmin_id());
			st.setString(3,dto.getAdmin_pwd());
			st.setString(4,dto.getAdmin_name());
			st.setInt(5,dto.getAdmin_age());
			st.setString(6,dto.getAdmin_addr());
			st.setString(7,dto.getAdmin_phone());
			st.setString(8,dto.getAdmin_email());
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, st, con);
		}
		return result;
	}
	public List<AdminDTO> getAdminList() {
		List<AdminDTO> list = new ArrayList<AdminDTO>();
		openConn();
		sql = "select * from admin_member";
		try {
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			while(rs.next()) {
				AdminDTO dto = new AdminDTO();
				dto.setAdmin_num(rs.getInt("admin_num"));
				dto.setAdmin_id(rs.getString("admin_id"));
				dto.setAdmin_pwd(rs.getString("admin_pwd"));
				dto.setAdmin_name(rs.getString("admin_name"));
				dto.setAdmin_age(rs.getInt("admin_age"));
				dto.setAdmin_addr(rs.getString("admin_addr"));
				dto.setAdmin_phone(rs.getString("admin_phone"));
				dto.setAdmin_regdate(rs.getString("admin_regdate"));
				dto.setAdmin_email(rs.getString("admin_email"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, st, con);
		}
		return list;
	}
	public AdminDTO getAdminContent(String admin_name) {
		AdminDTO dto = null;
		openConn();
		try {
			sql = "select * from admin_member where admin_name = ? ";
			st = con.prepareStatement(sql);
			st.setString(1,admin_name);
			rs = st.executeQuery();
			if(rs.next()) {
				dto = new AdminDTO();
				dto.setAdmin_num(rs.getInt("admin_num"));
				dto.setAdmin_id(rs.getString("admin_id"));
				dto.setAdmin_pwd(rs.getString("admin_pwd"));
				dto.setAdmin_name(rs.getString("admin_name"));
				dto.setAdmin_age(rs.getInt("admin_age"));
				dto.setAdmin_addr(rs.getString("admin_addr"));
				dto.setAdmin_phone(rs.getString("admin_phone"));
				dto.setAdmin_regdate(rs.getString("admin_regdate"));
				dto.setAdmin_email(rs.getString("admin_email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, st, con);
		}
		return dto;
	}
	public int makingpwd(String admin_name, String admin_id, String key) {
		int result = 0;
		openConn();
		try {
			sql = "select * from admin_member where admin_id = ?";
			st = con.prepareStatement(sql);
			st.setString(1,admin_id);
			rs = st.executeQuery();
			if(rs.next()) {
				if(rs.getString("admin_name").equals(admin_name)) {
					sql = "update admin_member set admin_pwd = ?";
					st = con.prepareStatement(sql);
					st.setString(1,key);
					result = st.executeUpdate();
				}else {
					result = -1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
