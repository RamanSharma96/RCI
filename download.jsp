<%@ page import="java.sql.*,java.io.*" isErrorPage="true"%>
<%@ include file="index.jsp"%>
<%  
    if(session.getAttribute("session")==null)
      {
        System.out.println("Unauthorized access!");
%>
<jsp:forward page="home.jsp"/>
<%
      }
    else{
      System.out.println(session.getId());
    }
%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%    
		try{
			Connection con=(Connection)session.getAttribute("connection");
			PreparedStatement ps=con.prepareStatement("call export()");
			ps.executeUpdate();
			String dir="C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Data\\rci";	
    File fl = new File(dir);
    File[] files = fl.listFiles(new FileFilter() {          
        public boolean accept(File file) {
            return file.isFile();
        }
    });
    long lastMod = Long.MIN_VALUE;
    File choice = null;
    for (File file : files) {
        if (file.lastModified() > lastMod) {
            choice = file;
            lastMod = file.lastModified();
        }
    }
		response.setContentType("text/html");
		String s=(String)request.getParameter("name");
		PrintWriter outt = response.getWriter();
		String filename = (String)choice.getName();
		String filepath="C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Data\\rci\\";
		System.out.println(filepath+filename);
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment; filename=\""+ filename + "\"");
		FileInputStream fileInputStream = new FileInputStream(filepath+filename);
		int i;
		while ((i = fileInputStream.read()) != -1) {
			outt.write(i);
		}
		fileInputStream.close();
		outt.close();
		}
		catch(Exception e)
		{
		e.printStackTrace();
	}
%>   
