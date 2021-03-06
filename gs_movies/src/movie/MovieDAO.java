package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class MovieDAO {
	
	public boolean create(MovieDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into movie(no, mainPoster, poster, "
				+ "title, ryear, viewLevel, director, "
				+ "country, content, viewer, genre) " );
		sql.append(" values ((SELECT NVL(MAX(no), 0) + 1 as no FROM movie), "
				+ "?, ?, ?, ?, "
				+ "?, ?, ?, ?, ?, ?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMainPoster());
			pstmt.setString(2, dto.getPoster());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getRyear());
			pstmt.setString(5, dto.getViewLevel());
			pstmt.setString(6, dto.getDirector());
			pstmt.setString(7, dto.getCountry());
			pstmt.setString(8, dto.getContent());
			pstmt.setString(9, dto.getViewer());
			pstmt.setString(10, dto.getGenre());
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
	
	public List<MovieDTO> list(Map map) {
		List<MovieDTO> list = new ArrayList<MovieDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select no, poster, title, content, r");
		sql.append(" from (select no, poster, title, content, rownum as r ");
		sql.append(" from(select no, poster, title, content ");
		sql.append(" from movie ");
	
		if(word.trim().length()>0)
			sql.append(" where " +col+" like '%'||?||'%' "); 
		sql.append(" ORDER BY no DESC)) ");
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
				MovieDTO dto = new MovieDTO();
				dto.setNo(rs.getInt("no"));
				dto.setPoster(rs.getString("poster"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
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

	public MovieDTO read(int no) {
		MovieDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs = null;
		sql.append(" select no, mainPoster, poster, title, viewLevel, ryear, director, country, content, genre, viewer " );
		sql.append(" from movie where no = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new MovieDTO();
				dto.setNo(rs.getInt("no"));
				dto.setMainPoster(rs.getString("mainPoster"));
				dto.setPoster(rs.getString("poster"));
				dto.setTitle(rs.getString("title"));
				dto.setViewLevel(rs.getString("viewLevel"));
				dto.setRyear(rs.getString("ryear"));
				dto.setDirector(rs.getString("director"));
				dto.setCountry(rs.getString("country"));
				dto.setContent(rs.getString("content"));
				dto.setGenre(rs.getString("genre"));
				dto.setViewer(rs.getString("viewer"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}
	
	public boolean update(MovieDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update movie set title=?, ryear=?, viewLevel=?, director=?, country=?, content=?, genre=?, viewer=?, mainPoster=?, poster=?  ");
		sql.append(" where no = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getRyear());
			pstmt.setString(3, dto.getViewLevel());
			pstmt.setString(4, dto.getDirector());
			pstmt.setString(5, dto.getCountry());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getGenre());
			pstmt.setString(8, dto.getViewer());
			pstmt.setString(9, dto.getMainPoster());
			pstmt.setString(10, dto.getPoster());
			pstmt.setInt(11, dto.getNo());
			
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
		sql.append(" delete from movie where no= ? ");
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
		sql.append(" select count(*) from movie ");
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
	
}
