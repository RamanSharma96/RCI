<%@ page import="java.sql.*,java.util.*"%>


<%
try
{
Connection con=(Connection)session.getAttribute("connection");
PreparedStatement ps=con.prepareStatement("call newinv(?,?,?)");
PreparedStatement ps1=con.prepareStatement("select * from user where username=? and invno=?");
ps1.setString(1,request.getParameter("username"));
ps1.setString(2,request.getParameter("invno"));
ps.setString(1,request.getParameter("username"));
ps.setString(2,request.getParameter("password"));
ps.setString(3,request.getParameter("invno"));
ResultSet rs=ps1.executeQuery();
if(rs.next()){
	System.out.println("User exists");
%>
	<jsp:include page="invform.jsp"/>
	<h3>Inventory already exists!</h3>
<%
}
else{
ps.execute();
System.out.println("Successfully Created a new inventory");
%>
<jsp:include page="invform.jsp"/>
<h3>Successfully Created</h3>
<%
}
}
catch(Exception e)
{
e.printStackTrace();
System.out.println("Some Error Has Occured");
}
%>