package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//1. 자신의 객체를 담을 static 필드 선언
	private static MemberDao dao;
	
	//2. 외부에서 객체 생성이 불가 하도록 생성자의 접근 지정자를 private로 만듦.
	private MemberDao() {}
	
	//3. 자신의 참조값을 리턴해주는 public static 메소드 정의
	//사용법 MemberDao.getInstance() (new 하지 않는다.)
	public static MemberDao getInstance() {
		if(dao==null) {
			dao=new MemberDao();
		}
		return dao;
	}
	
	//회원 목록을 리턴해주는 메소드
	public List<MemberDto> getList(){
		
		//리턴해줄 ArrayList 객체 생성
		List<MemberDto> list=new ArrayList<MemberDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			//DbcpBean() 을 설계한다면 여기서 DB를 추출한다.
			//이걸 제외하고는 일반 Dao 작성법과 똑같음.
			conn=new DbcpBean().getConn();
			
			//Select 문 작성
			String sql="SELECT num,name,addr"
					+ " FROM member"
					+ " ORDER BY num DESC";
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩 할 게 있으면 여기서 바인딩 한다.
			
			//Select 문 수행하고 ResultSet 받아오기
			rs=pstmt.executeQuery();
			//while 문 혹은 if 문에서 ResultSet으로부터 data 추출
			//(row 가 1개면 if문, 여러개면 while 문)
			while(rs.next()) {
				//MemberDto 객체를 생성해서 회원 한명의 정보를 담아서
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//ArrayList 객체에 누적 시킨다.
				list.add(dto);
			}
			/*
			 * 1. while문이 10번 반복되면 MemberDto 객체가 10개 생긴다.
			 * 2. select문을 수행하고 얻은 결과 데이터를 ResultSet에 객체로 받아온다.
			 * 3. rs 객체의 데이터를 dto.set 메소드를 통해서 넣어준다.
			 * 4. dto를 arraylist 에 누적시켜준다.
			 * 
			 * rs.next() 는 더 이상 읽어올 데이터가 없을 때 false 를 리턴하고 while문이 끝나게 된다.
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {

			}
		}
		
		return list;
	}
	
	//회원 한명의 정보를 리턴하는 메소드
	public MemberDto getData(int num) {
		MemberDto dto=null;
		//dto 를 리턴하기 위해서 미리 선언해두기.
		//필드로 뺄 수도 있으나 다른 메소드에서 쓰지 않으므로 선언만 해도 충분하다.
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=new DbcpBean().getConn();
			//SELECT 문 작성
			String sql="SELECT name, addr"
					+ " FROM member"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩 할 게 있으면 여기서 바인딩 한다.
			pstmt.setInt(1, num);
			//SELECT 문 수행하고 ResultSet 받아오기
			rs=pstmt.executeQuery();
			//row 가 1개이기 때문에 if 사용
			if(rs.next()) {
				dto=new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {

			}
		}
		return dto;
	}
	
	//회원 정보를 저장해주는 메소드
	public boolean insert(MemberDto dto) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO member"
					+ " (num, name, addr)"
					+ " VALUES (member_seq.NEXTVAL, ?, ?)";
			
			//? 에 바인딩 할 게 있으면 여기서 바인딩 한다.
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//회원 정보를 수정해주는 메소드
	public boolean update(MemberDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		
		try {
			conn=new DbcpBean().getConn();
			//실행한 sql문 작성
			String sql="UPDATE member"
					+ " SET name=?, addr=?"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			//? 에 값을 바인딩할 게 있으면 여기서 한다.
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {

			}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//회원 정보를 삭제해주는 메소드
	public boolean delete(int num) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		
		try {
			conn=new DbcpBean().getConn();
			//실행할 insert, update, delete 문 구성
			String sql="DELETE FROM member"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
}
