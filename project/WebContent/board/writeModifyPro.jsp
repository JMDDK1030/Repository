<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.boardDAO"%>
<%@page import="board.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%


request.setCharacterEncoding("utf-8");

//application내장객체는 전체 프로젝트에 대한 자원을 관리하는 객체 입니다.
//서버(톰캣)의 실제 프로젝트 경로에서 자원을 찾을때 가장 많이 사용합니다.

//업로드 할 실제 서버경로 얻기
String directory = application.getRealPath("/filedownload/");
//C:\02Workspace\MustHaveJSP\WebContent\ upload\ 	

//업로드할 수 있는 파일의 최대 사이즈 지정 1GB -> 1024MB
int maxSize = 1024 * 1024 * 1024;

//참고 : MultipartRequest클래스에 대한 객체 생성시..
//      생성자로 업로드할 정보를 전달해 저장시키면
//      자동으로 우리가 지정한 경로에 파일을 업로드 시킬 수 있다.

//실제 파일 업로드 당당하는 클래스는? cos.jar압축파일 내부에 존재하는 MultipartRequest클래스이다.
MultipartRequest multipartrequest;

//객체 생성시 생성자로 전달할 데이터들
//1. fileUpload.jsp의 form태그에 의해서 전달 받은 업로드할 파일의 정보를 가지고있는 request내장객체
//2. 업로드할 파일의 실제 서버 폴더 경로 -> \ upload\ 폴더 경로
//3. 업로드할 수 있는 파일의 최대 사이즈 지정
//4. 업로드하는 파일이름이 한글일 경우 깨져서 올라가게 되므로 인코딩 방식을 UTF-8로 설정하기 위해 전달
//5. 업로드되는 실제 서버 폴더 경로에 똑같은 이름의 파일을 업로드시..
//   파일명 끝에 1을 자동으로 붙여서 파일을 만들어주는 역할을 하는 
//   new DefaultFileRenamePolicy() 객체를 생성해서 전달 
multipartrequest = new MultipartRequest(request, 
										directory,
										maxSize,	
										"UTF-8",
										new DefaultFileRenamePolicy()
										); 

	//서버경로에 업로드할 파일의  업로드하기전의 원본파일명 얻기
	String fileName =  multipartrequest.getOriginalFileName("file");
	//서버경로에 업로드되어서 올라가 있는 실제 파일명 얻기
	String fileRealName = multipartrequest.getFilesystemName("file");


boardDTO dto = new boardDTO();
boardDAO dao = new boardDAO();

dto.setNum(multipartrequest.getParameter("num"));
dto.setId(multipartrequest.getParameter("id"));
dto.setPass(multipartrequest.getParameter("pass"));
dto.setTitle(multipartrequest.getParameter("title"));
dto.setContent(multipartrequest.getParameter("content"));


int check = new boardDAO().writemodifyUpdate(dto,fileRealName,fileName);

	if(check == 1){
%>    

	<script>
		alert("수정성공");
		location.href="board.jsp";
	</script>
    	
<%    	
    }else{
%>   	
	<script>
		alert("수정실패! 비밀번호가 다릅니다");
		history.back();
	</script>
<%    	
    }
%>
