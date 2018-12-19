package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class NoticeDAO {

	public boolean create(NoticeDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into notice(ntno, nttitle, ntdate, ntcontent) ");
		sql.append(" values((SELECT NVL(MAX(ntno), 0) + 1 as ntno FROM notice), "); 
		sql.append(" ?, sysdate, ?) ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getNttitle());
			pstmt.setString(2, dto.getNtcontent());
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

	public boolean delete(int ntno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from notice where ntno= ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, ntno);
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

	public List<NoticeDTO> list(Map map) {
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select ntno, nttitle, to_char(ntdate,'yyyy-mm-dd') ntdate, ntcontent, viewcnt, r ");
		sql.append(" from(select ntno, nttitle, ntdate, ntcontent, viewcnt, rownum as r ");
		sql.append(" from(select ntno, nttitle, ntdate, ntcontent, viewcnt ");
		sql.append(" from notice ");
		if(word.trim().length()>0)
			sql.append(" where " +col+" like '%'||?||'%' "); 
		sql.append(" ORDER BY ntno DESC)) ");
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
				NoticeDTO dto = new NoticeDTO();
				dto.setNtno(rs.getInt("ntno"));
				dto.setNttitle(rs.getString("nttitle"));
				dto.setNtdate(rs.getString("ntdate"));
				dto.setNtcontent(rs.getString("ntcontent"));
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

	public NoticeDTO read(int ntno) {
		NoticeDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs = null;
		sql.append(" select ntno, nttitle, ntdate, ntcontent, viewcnt " );
		sql.append(" from notice where ntno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, ntno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new NoticeDTO();
				dto.setNttitle(rs.getString("nttitle"));
				dto.setNtdate(rs.getString("ntdate"));
				dto.setNtcontent(rs.getString("ntcontent"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}

	public int total(Map map) {
		int total =0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from notice ");
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

	public boolean update(NoticeDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update notice set nttitle=?, ntcontent=?  ");
		sql.append(" where ntno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getNttitle());
			pstmt.setString(2, dto.getNtcontent());
			pstmt.setInt(3, dto.getNtno());
		
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} DBClose.close(pstmt, con);
		
		return flag;
		
	}

	public void upViewcnt(int ntno) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" UPDATE notice " );
		sql.append(" SET viewcnt = viewcnt + 1 " );
		sql.append(" WHERE ntno=? " );
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, ntno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		
	}

}
