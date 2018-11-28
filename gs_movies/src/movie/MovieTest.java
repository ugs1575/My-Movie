package movie;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MovieTest {

	public static void main(String[] args) {
		MovieDAO dao = new MovieDAO();
		//create(dao);
		//delete(dao);
		list(dao);
		//read(dao);
		//update(dao);
	}

	private static void update(MovieDAO dao) {
		MovieDTO dto = new MovieDTO();
		dto.setNo(3);
		dto.setTitle("updated title");
		
		if(dao.update(dto)) {
			p("update 성공");
		} else {
			p("update 실패");
		}
		
	}

	private static void read(MovieDAO dao) {
		MovieDTO dto = dao.read(2);
		p(dto);
		p("-------------------------------------");
	
	}

	private static void list(MovieDAO dao) {
		List<MovieDTO> list = dao.list();
		Iterator iter = list.iterator();
		while(iter.hasNext()) {
			MovieDTO dto = (MovieDTO) iter.next();
			p(dto);
			p("-------------------------------------");
		}
		
	}

	private static void p(MovieDTO dto) {
		p("번호: " + dto.getNo());
		p("제목: " + dto.getTitle());
		p("개봉년도: " + dto.getRyear());
		p("국가: " + dto.getCountry());
		p("내용: " + dto.getContent());
	}

	private static void delete(MovieDAO dao) {
		if(dao.delete(1)) {
			p("delete 성공");
		} else {
			p("delete 실패");
		}
	}

	private static void create(MovieDAO dao) {
		MovieDTO dto = new MovieDTO();
		dto.setTitle("너의 결혼식");
		dto.setRyear("2018");
		dto.setDirector("이석근");
		dto.setCountry("Republic of Korea");
		dto.setContent("너의결혼식내용");
		
		if(dao.create(dto)) {
			p("create 성공");
		} else {
			p("create 실패");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
