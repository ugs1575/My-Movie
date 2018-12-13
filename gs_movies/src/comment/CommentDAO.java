package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class CommentDAO {
	
	public boolean create(CommentDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into rcomment(rcno, rccontent, rcdate, id, rno) ");
	    sql.append(" values((select nvl(max(rcno),0)+1 from rcomment),"); 
		sql.append(" ?, sysdate, ?, ?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getRccontent());
			pstmt.setString(2, dto.getId());
			pstmt.setInt(3, dto.getRno());
			int cnt= pstmt.executeUpdate();
			if (cnt>0) flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	
	public List<CommentDTO> list(Map map) {
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		int rno = (Integer)map.get("rno");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append( " select rcno, rccontent, to_char(rcdate,'yyyy-mm-dd') rcdate, "
				+ "id, rno, r ");
		sql.append( " FROM( ");
		sql.append(" select rcno, rccontent, rcdate, id, rno, rownum r ");
		sql.append(" FROM( ");
		sql.append(" select rcno, rccontent, rcdate, id, rno ");
		sql.append(" from rcomment ");
		sql.append(" where rno = ? ");
	
		sql.append(" ORDER BY rcno DESC)) ");
		sql.append(" where r>=? and r<=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, rno);
			pstmt.setInt(2, sno);
			pstmt.setInt(3, eno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setRcno(rs.getInt("rcno"));
				dto.setRccontent(rs.getString("rccontent"));
				dto.setRcdate(rs.getString("rcdate"));
				dto.setId(rs.getString("id"));
				dto.setRno(rs.getInt("rno"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return list;	
	}

	public CommentDTO read(int no) {
		CommentDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs = null;
		sql.append(" select * from rcomment ");
		sql.append(" where rcno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new CommentDTO();
				dto.setRcno(rs.getInt("rcno"));
				dto.setRccontent(rs.getString("rccontent"));
				dto.setRcdate(rs.getString("rcdate"));
				dto.setId(rs.getString("id"));
				dto.setRno(rs.getInt("rno"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}
	
	public boolean update(CommentDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update rcomment ");
		sql.append(" set rccontent = ? ");
		sql.append(" where rcno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getRccontent());
			pstmt.setInt(2, dto.getRcno());
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} DBClose.close(pstmt, con);
		
		return flag;
		
	}
	
	public boolean delete(int rno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from rcomment where rcno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, rno);
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}

	public int total(int rno) {
		int total =0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from rcomment ");
		sql.append(" where rno = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, rno);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		
		return total;
	}
	

}
