package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class ReviewDAO {
	public boolean create(ReviewDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into review ");
		sql.append(" (rno, rtitle, writer, rdate, rcontent, passwd, rate) ");
		sql.append(" values((SELECT NVL(MAX(rno), 0) + 1 as rno FROM review), "); 
		sql.append(" ?, ?, sysdate, ?, ?, ?) ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getRtitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getRcontent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getRate());
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
	
	public List<ReviewDTO> list(Map map) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select rno, rtitle, writer, rdate, rcontent, viewcnt, r ");
		sql.append(" from(select rno, rtitle, writer, rdate, rcontent, viewcnt, rownum as r ");
		sql.append(" from(select rno, rtitle, writer, to_char(rdate, 'yyyy-mm-dd') as rdate, rcontent, viewcnt ");
		sql.append(" from review ");
		if(word.trim().length()>0)
			sql.append(" where " +col+" like '%'||?||'%' "); 
		sql.append(" ORDER BY rno DESC)) ");
		sql.append(" where r>=? and r<=? ");
		
		int i=0;
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length()>0)
				pstmt.setString(++i, word);
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setRno(rs.getInt("rno"));
				dto.setRtitle(rs.getString("rtitle"));
				dto.setWriter(rs.getString("writer"));
				dto.setRdate(rs.getString("rdate"));
				dto.setRcontent(rs.getString("rcontent"));
				dto.setViewcnt(rs.getInt("viewcnt"));
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

	public ReviewDTO read(int no) {
		ReviewDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs = null;
		sql.append(" select rtitle, writer, rdate, rcontent, viewcnt, rate, passwd " );
		sql.append(" from review where rno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new ReviewDTO();
				dto.setRtitle(rs.getString("rtitle"));
				dto.setWriter(rs.getString("writer"));
				dto.setRdate(rs.getString("rdate"));
				dto.setRcontent(rs.getString("rcontent"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setRate(rs.getInt("rate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}
	
	public boolean update(ReviewDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update review set rtitle=?, rcontent=?, passwd=?, rate=?  ");
		sql.append(" where rno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getRtitle());
			pstmt.setString(2, dto.getRcontent());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setInt(4, dto.getRate());
			pstmt.setInt(5, dto.getRno());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} DBClose.close(pstmt, con);
		
		return flag;
		
	}
	
	public boolean delete(int no) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from review where rno= ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
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

	public int total(Map map) {
		int total =0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from review ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like  '%'||?||'%'");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
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
	
	public void upViewcnt(int rno) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" UPDATE review " );
		sql.append(" SET viewcnt = viewcnt + 1 " );
		sql.append(" WHERE rno=? " );
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, rno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		
	}
	public boolean passCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rno = (Integer) map.get("rno");
		String passwd = (String) map.get("passwd");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(rno) as cnt " );
		sql.append(" FROM review " );
		sql.append("WHERE rno=? AND passwd=? " );
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, rno);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			if (cnt>0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return flag;
		
	}
	
	

}
