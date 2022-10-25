package com.category.medel;

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

import com.chall.model.UserDTO;

public class CategoryDAO {
	Connection con = null;
	PreparedStatement st = null;
	ResultSet rs = null;
	String sql = null;

	private static CategoryDAO instance;
	private CategoryDAO() {  }  // 기본 생성자
	public static CategoryDAO getInstance() {

		if(instance == null) {
			instance = new CategoryDAO();
		}

		return instance;
	}

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
	public List<CategoryDTO> getCategoryList() {
		openConn();
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		try {
			sql = "select * from challenge_category order by category_name";
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCategory_num(rs.getInt("category_num"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setCategory_image(rs.getString("category_image"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, st, con);
		}
		return list;
	}
	public int deletecategory(int category_num) {
		int result = 0;
		openConn();
		try {
			sql = "delete from challenge_category where category_num = ?";
			st = con.prepareStatement(sql);
			st.setInt(1,category_num);
			result = st.executeUpdate();
			sql = "update challenge_category set category_num = category_num - 1 where category_num > ?";
			st = con.prepareStatement(sql);
			st.setInt(1,category_num);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, st, con);
		}
		return result;
	}
}
