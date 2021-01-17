package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	//static 필드
	private static CafeDao dao;
	//생성자
	private CafeDao() {}
	//public static 메소드
	public static CafeDao getInstance() {
		if(dao == null) {
			dao=new CafeDao();
		}
		return dao;
	}
	
	//카페 글 전체 목록 리턴하기
	public List<CafeDto> getList(CafeDto dto){
		List<CafeDto> list=new ArrayList<CafeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();//DbcpBean()을 설계한다면 여기서 DB를 추출한다. 이거 빼고는 Dao 작성법과 똑같음. 
			//select 문 작성
			String sql = "SELECT num, writer, title, viewCount, regdate"
					+ " FROM board_cafe"
					+ " ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 게 있으면 여기서 바인딩 한다.

			//select 문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet으로부터 data 추출
			/*
			 * 로우가 1개면 if문
			 * 여러개면 while문
			 */
			while (rs.next()) {
				CafeDto dto1=new CafeDto();
				dto1.setNum(rs.getInt("num"));
				dto1.setWriter(rs.getString("writer"));
				dto1.setTitle(rs.getString("title"));
				dto1.setViewCount(rs.getInt("viewCount"));
				dto1.setRegdate(rs.getString("regdate"));
				list.add(dto1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {

			}
		}
		return list;
	}
}
