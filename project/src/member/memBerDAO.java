package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memBerDAO {

	//데이터베이스와 연결을 담당 하는 객체 저장 변수
	Connection con;
	
	//자바코드로 작성한 동적쿼리문을 연결된 DBMS의 테이블에 전달하여 
	//실행할 역할의 객체를 저장할 변수 
	PreparedStatement pstmt;
	
	//DB로부터 SELECT쿼리문의 결과를 임시로 저장할 
	//ResultSet객체 메모리를 담을 변수 
	ResultSet rs;
	
	//쿼리문 저장할 변수
	String sql;
	
	//커넥션풀을 생성하고 커넥션풀 내부에 미리연결을 맺은 Connection객체를 얻어 반환하느 메소드
		private Connection getConnection() throws Exception {
			//DB와 연결을 맺은 접속정보를 지닌 Connection객체를 저장할 변수
			Connection con = null;
			
			//커넥션풀 얻기
			//1. 자바의 네이밍 서비스(JNDI)에서 이름과 실제 객체를 연결 해주는 역할을 하는
			//   InitialContext()객체를 생성 하여 저장
			//   이객체는 네이밍 서비스를 이용하기 위한 시작점입니다.
			//   이객체의 lookup()메서드에 이름을 건네 원하는 객체를 찾아올수 있습니다.
			Context initCtx = new InitialContext();
			//2. "java:comp/env"경로를 얻은 InitialContext객체를 얻습니다.
			//여기서 "java:comp/env"경로는 현재 웹프로젝트의 루트 디렉터리 경로라 생각하면 됩니다.
			//즉~ 현재 웹프로젝트 내부에서 사용할수 있는 모든 자원은 "java:comp/env"아래에 위치합니다.
			Context ctx = (Context)initCtx.lookup("java:comp/env");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
			//3. "java:comp/env"아래에 위치한 "dbcp_myoracle"자원을 얻어옵니다.
			//   이자원이 바로 앞서 설정한 DataSource(커넥션풀)입니다.
			//여기서 "dbcp_myoralce"은 context.xml파일에 추가한 
			//<RecourceLink>에 있는 name속성의 값입니다.
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			
			//커넥션풀 내부에 저장되어 있는 커넥션 객체 얻기 (DB연결)
			con = source.getConnection();
			
			return con;
		}
		
		//연결 해제
		//close메서드는 DB관련 작업 객체의 자원을 해제 하는 메소드 입니다.
		public void close() {
			
			try {
				if (rs != null)rs.close(); {}
				if (pstmt != null)pstmt.close();{}
				if (con != null)con.close();{}
				System.out.println("커넥션풀 공간에 Connection객체 사용후 반납");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}//close메소드 끝
	
		
		//회원 가입
		public int insert(memBerDTO dto) {
			
			try {
			
				con = getConnection();
				
				sql = "insert into member values(?,?,?,?,?,?,sysdate)";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPass());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getEmail());
				pstmt.setString(5, dto.getHp());
				pstmt.setString(6, dto.getAddress());
				
				return pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return 0;
		}
		
		
		//아이디 중복체크
		public int idCheck(String id) {
			
			int check = 0;
			
			try {
				con= getConnection();
				sql = "select * from member where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()){
					check=1;
				}else{
					check=0;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return check;
			
			
		}
		
		
		//로그인
		public int userCheck(String id, String pass) {
			
			int check = -1; 
			
			try {
				con = getConnection();
				
				sql = "select * from member where id=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
					if (pass.equals(rs.getString("pass"))) {
						check = 1;
					}else {
						check = 0;
					}
					
				}else {
					check = -1;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return check;
		}

		//회원정보 조회
		public memBerDTO modify(String id) {
		
			memBerDTO dto = new memBerDTO();
			
		try {
			sql = "select * from member where id=?";
			
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setAddress(rs.getString("address"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
		
	}

		//회원정보 수정
		public int modifyPro(memBerDTO dto) {
			
			try {
				con = getConnection();
				
				sql = "update member set pass=?,name=?,email=?,hp=?,address=?,regidate=sysdate where id=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getPass());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getEmail());
				pstmt.setString(4, dto.getHp());
				pstmt.setString(5, dto.getAddress());
				pstmt.setString(6, dto.getId());
				
				return pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
		
			
			
			return 0;
		}
		
		
		//회원탈퇴
		public void deletemodify(String id) {
			
			try {
			
				con = getConnection();
				
				sql = "delete from member where id=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
			
			}finally {
				close();
			}
			
		}
		
		
		
		
}
