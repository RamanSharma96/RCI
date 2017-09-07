<%@ page import="java.sql.*" errorPage="error.jsp"%>

<%
	Connection con=(Connection)session.getAttribute("connection");
	if(con!=null)
		con.close();
	if(session!=null)
		session.invalidate();


%>
<jsp:forward page="home.jsp"/>