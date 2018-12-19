package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class MemberDAO {
	
	
	
	public boolean create(MemberDTO dto){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into movie_member(id, psw, name, email, fname) "); 
		sql.append(" values(?, ?, ?, ?, ?) ");
		
		try {
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPsw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getFname());
			
			int cnt = pstmt.executeUpdate();
			if (cnt>0) flag = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
		
	}
	
	public boolean duplicateEmail(String email){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(email) ");
		sql.append(" from movie_member ");
		sql.append(" where email=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt>0) flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs,pstmt,con);		
	}
		return flag; 
		
	}
	
	public boolean duplicateId(String id){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) ");
		sql.append(" from movie_member ");
		sql.append(" where id=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt>0) flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs,pstmt,con);		
		} 
		
		
		return flag;
		
	}

	
	public String getGrade(String id) {
		String grade = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select grade from movie_member ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				grade = rs.getString("grade");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBClose.close(rs, pstmt, con);
		}
		
		return grade;
		
	}

	public boolean loginCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = (String)map.get("id");
		String psw = (String)map.get("psw");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from movie_member ");
		sql.append(" where id = ? ");
		sql.append(" and psw = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, psw);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt>0) flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}

	public MemberDTO read(String id) {
		MemberDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * from movie_member where id = ? ");
	
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPsw(rs.getString("psw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setFname(rs.getString("fname"));
				dto.setGrade(rs.getString("grade"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}

}
