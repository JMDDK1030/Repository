<%@page import="board.boardDAO"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<%
			request.setCharacterEncoding("UTF-8");

			String fileName = request.getParameter("file"); 

			String fileder = request.getParameter("folder");//filedownload 가져와

			String directory = application.getRealPath(fileder);

			File file = new File(directory+"/"+fileName);
			

			String mimeType = getServletContext().getMimeType( file.toString() );
			
			if(mimeType == null){

				response.setContentType("appliaction/octet-stream");
			}
			
		
			String downloadName = null;
			
			
			String header = request.getHeader("User-Agent");
		   
			
			if(header.contains("MSIE") || header.contains("Trident")){
				

				downloadName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+","%20");

			}else{
				
						downloadName = new String( fileName.getBytes("UTF-8") , "8859_1");
			}
			
			response.setHeader("Content-Disposition",
					           "attachment;filename=\"" + downloadName + "\";");
			
		
			FileInputStream fileInputStream = new FileInputStream(file);
			
			ServletOutputStream servletOutputStream = response.getOutputStream();

			out.clear();
			out = pageContext.pushBody();
			
		
			byte[] b = new byte[1048576];
			
			while(true){
				
			
				int count = fileInputStream.read(b);
				
				
				if(count == -1){
					break;
				}
				
				servletOutputStream.write(b, 0, count);
				
			}
			new boardDAO().downcount(fileName);
			

			servletOutputStream.flush();
			
			servletOutputStream.close();
			fileInputStream.close();
			
		%>