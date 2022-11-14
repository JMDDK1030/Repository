package board;

import java.sql.Connection;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class boardDAO {

	// 데이터베이스와 연결을 담당 하는 객체 저장 변수
	Connection con;

	// 자바코드로 작성한 동적쿼리문을 연결된 DBMS의 테이블에 전달하여
	// 실행할 역할의 객체를 저장할 변수
	PreparedStatement pstmt;

	// DB로부터 SELECT쿼리문의 결과를 임시로 저장할
	// ResultSet객체 메모리를 담을 변수
	ResultSet rs;

	// 쿼리문 저장할 변수
	String sql;

	// 커넥션풀을 생성하고 커넥션풀 내부에 미리연결을 맺은 Connection객체를 얻어 반환하느 메소드
	private Connection getConnection() throws Exception {
		// DB와 연결을 맺은 접속정보를 지닌 Connection객체를 저장할 변수
		Connection con = null;

		// 커넥션풀 얻기
		// 1. 자바의 네이밍 서비스(JNDI)에서 이름과 실제 객체를 연결 해주는 역할을 하는
		// InitialContext()객체를 생성 하여 저장
		// 이객체는 네이밍 서비스를 이용하기 위한 시작점입니다.
		// 이객체의 lookup()메서드에 이름을 건네 원하는 객체를 찾아올수 있습니다.
		Context initCtx = new InitialContext();
		// 2. "java:comp/env"경로를 얻은 InitialContext객체를 얻습니다.
		// 여기서 "java:comp/env"경로는 현재 웹프로젝트의 루트 디렉터리 경로라 생각하면 됩니다.
		// 즉~ 현재 웹프로젝트 내부에서 사용할수 있는 모든 자원은 "java:comp/env"아래에 위치합니다.
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		// 3. "java:comp/env"아래에 위치한 "dbcp_myoracle"자원을 얻어옵니다.
		// 이자원이 바로 앞서 설정한 DataSource(커넥션풀)입니다.
		// 여기서 "dbcp_myoralce"은 context.xml파일에 추가한
		// <RecourceLink>에 있는 name속성의 값입니다.
		DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");

		// 커넥션풀 내부에 저장되어 있는 커넥션 객체 얻기 (DB연결)
		con = source.getConnection();

		return con;
	}

	// 연결 해제
	// close메서드는 DB관련 작업 객체의 자원을 해제 하는 메소드 입니다.
	public void close() {

		try {
			if (rs != null)
				rs.close();
			{
			}
			if (pstmt != null)
				pstmt.close();
			{
			}
			if (con != null)
				con.close();
			{
			}
			System.out.println("커넥션풀 공간에 Connection객체 사용후 반납");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}// close메소드 끝

	
	//게시글 작성
	public int insertBoard(boardDTO dto, String fileRealName, String fileName) {

		try {
			con = getConnection();

			sql = "insert into board values(seq_board_num.nextVal,?,?,?,?,sysdate,0,?,?,0,0,0,0)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getPass());
			pstmt.setString(5, fileRealName);
			pstmt.setString(6, fileName);


			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return -1;
	}
	

	//게시글 목록
	public List boardList(Map<String, Object> map) {

		List<boardDTO> list = new ArrayList<boardDTO>();
		
		try {

			con = getConnection();
			sql = "select * from (" 
				    + "		SELECT Tb.*, rownum rNum FROM ( " 
					+ "			SELECT * FROM board ";	
				
				if(map.get("searchWord")  !=  null) {
					
					sql += " where " + map.get("searchField") +  " "
					     + " like '%" + map.get("searchWord") + "%'";				
				}
				
					sql += " 	ORDER BY num ASC "
						+  " ) Tb "	
						+ " ) "
						+ " WHERE rNum BETWEEN ? AND ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, (int)map.get("start"));
				pstmt.setInt(2, (int)map.get("end"));

			rs = pstmt.executeQuery();
			
			while( rs.next()  ) {
				
				boardDTO dto = new boardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setFilesource(rs.getString("filesource"));
				dto.setFilename(rs.getString("filename"));
				
				list.add(dto);
			}				
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			close();
		}
	
		return list;
	}

	//게시글 수정
	public int writemodifyUpdate(boardDTO  dto, String fileRealName, String fileName) {
			
		int check = 0;
		
			try {
			
				con = getConnection();
	
				sql = "select pass from board where num=?";
			
				pstmt = con.prepareStatement(sql);
		
				pstmt.setString(1,dto.getNum());
			
				rs = pstmt.executeQuery();
		
				if(rs.next()) {
				
					if(dto.getPass().equals( rs.getString("pass") ) ) {	
				
						
						
						sql = "update board set title=?, content=?, postdate=sysdate, filesource=?, filename=? where num=?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, dto.getTitle());
						pstmt.setString(2, dto.getContent());
						pstmt.setString(3, fileRealName);
						pstmt.setString(4, fileName);
						pstmt.setString(5, dto.getNum());
						
						check= pstmt.executeUpdate();
				}
				
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return check;
		}
	
	//게시글 삭제
	public int writeDelete(String num) {
		
		int check = 0;
		
		try {
		
			con = getConnection();
			
			sql = "delete from board where num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			check = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return check;
	}
	
	
	//검색 조건에 맞는 게시물
	public int selectCount(Map<String, Object>   map) {
		
		
		int totalCount = 0;
		
		try {
	
			con = getConnection();
		
			sql = "select count(*) from board";

			if(map.get("searchWord")  !=  null) {
				
				sql += " where " + map.get("searchField") +  " "
				     + " like '%" + map.get("searchWord") + "%'";		
			}
			
			pstmt = con.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			
			totalCount = rs.getInt(1);
			
		}catch(Exception e) {
			
			System.out.println("selectCount메소드 내부에서 SQL실행오류" + e);
			
		}finally {
			
			close();
		}

		return totalCount;
	}
	
	
	public boardDTO view(String num) {

		boardDTO dto = new boardDTO();

		try {
			con = getConnection();
			
			sql = "update board set visitcount=visitcount+1 where num=?";
			
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, num);
		
			pstmt.executeUpdate();
			

			sql = "select *  from member m inner join board b on m.id=b.id where num=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setFilesource(rs.getString("filesource"));
				dto.setFilename(rs.getString("filename"));
				
			}

		} catch (Exception e) {

		} finally {
			close();
		}

		return dto;

	}
	
	
//파일 다운로드 카운트
	public int downcount(String filename) {
		
		sql = "update board set downcount=downcount+1 where filename=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, filename);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}	
		return -1;
	}

//파일 다운로드 목록
	public List downloadSelect() {
		
		List<boardDTO> list = new ArrayList<boardDTO>();
		
		sql = "select * from board";
		
		try {
			 con = getConnection();
			 pstmt = con.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			
			 while(rs.next()) {
				 boardDTO dto = new boardDTO();
				 dto.setFilesource(rs.getString("filesource"));
				 dto.setFilename(rs.getString("filename"));
				 dto.setDowncount(rs.getInt("downcount"));
				 list.add(dto);
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}	
		return list;
	}
	
	
	
	
	public int insertReply(boardDTO dto) {
		
		try{
			 con = getConnection();
			
			//1) 부모글 정보 가져오기 (그룹번호, 들여쓰기, 글 순서) - select 문
			int ref=0, depth=0, step=0;
			sql = " SELECT ref, depth, step FROM board WHERE num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getNum());//부모글번호
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				//부모글번호를 가져와서 위의 세 개의 변수에 담기
				ref=rs.getInt("ref");				
				depth=rs.getInt("depth");				
				step=rs.getInt("step");				
			}//if end
				
			//2) 글순서 재조정하기 - update문 (sql 변수를 또 만들지 않고 다시 사용할 건데 1번에서 이미 사용 - 1. 초기화를 하거나 2. 수를 또 잡던가)
			//   1)에서 썼던 sql참조변수값을 초기화하고 update 쿼리문을 넣을 것
			sql = "";  //sql참조변수값 초기화
			
			sql = " UPDATE board SET step=step+1 WHERE (ref=? AND step>?)";
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, ref);
			pstmt.setInt(2, step);
			pstmt.executeUpdate();		
			
			//3) 답변글 추가하기 - insert문
			sql = "";  //sql참조변수값 초기화
			
			sql = " INSERT INTO board VALUES(seq_board_num.nextval,?,?,?,?,sysdate,0,?,?,0,?,?,?)";
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getPass());
			pstmt.setString(5, dto.getFilesource());
			pstmt.setString(6, dto.getFilename());
			pstmt.setInt(7, ref);					//부모글 그룹번호
			pstmt.setInt(8, depth+1);				//부모글 들여쓰기 +1
			pstmt.setInt(9, step+1);			//부모글 글순서+1
			
			return pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("답변 실패 : "+e);
		}finally {
			close();
		}
			
		return 0;
	}
	

}//끝
