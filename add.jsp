<%@ page import="java.sql.*,java.util.*" errorPage="error.jsp" %>

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
      System.out.println(request.getParameter("remark"));
    }
%>
<%
	try{
	String p=request.getParameter("partno");
	System.out.println(p);
	Connection con=(Connection)session.getAttribute("connection");
	PreparedStatement ps=con.prepareStatement("call datainsert(?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,request.getParameter("partno"));
	ps.setString(2,request.getParameter("pname"));
	ps.setString(3,request.getParameter("mfg"));
	ps.setString(4,request.getParameter("currency"));
	ps.setString(5,request.getParameter("material"));
	String lm=(String)request.getParameter("material");
	
	ps.setString(6,(String)session.getAttribute("invno"));
	ps.setInt(7,new Integer(request.getParameter("qty")));
	ps.setFloat(8,new Float(request.getParameter("price")));
	ps.setString(9,request.getParameter("status"));
	ps.setString(10,request.getParameter("dop"));
	ps.setString(11,request.getParameter("loc"));
	ps.setString(12,request.getParameter("remark"));
	ps.execute();
	System.out.println("Successfully added partno "+p+" to database");
	String a=(String)session.getAttribute("username");
	String b=(String)request.getParameter("partno");
	String c=(String)request.getParameter("dop");
	String d=(String)session.getAttribute("invno");
	java.util.Date da=new java.util.Date();
	String l=da+" : Addition of a new record by "+a+" of partno. "+b+" into inventory "+d+" with dop "+c+"---------";
	ps=con.prepareStatement("insert into log values(?)");
	ps.setString(1,l);
	ps.executeUpdate();
	System.out.println(l);
%>
	<jsp:include page="welcome.jsp"/>
	<h1>successfully added</h1>
<%
	}
	catch(Exception e)
	{
		e.printStackTrace();
		System.out.println("Duplicate entry/in-correct form submission");
%>
	<jsp:include page="welcome.jsp"/>
	<h3>Incorrect submission/Duplicate entry!</h3>
<%
	}
%>
