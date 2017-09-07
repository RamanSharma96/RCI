<%@ page import="java.sql.*" errorPage="error.jsp" %>
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
      System.out.println(request.getParameter("dop"));
    }
%>
<%
	try{
			Connection con=(Connection)session.getAttribute("connection");
			PreparedStatement ps=con.prepareStatement("call updatedata(?,?,?,?,?,?,?)");
			ps.setString(1,(String)request.getParameter("partno"));
			ps.setString(2,(String)request.getParameter("invno"));
			ps.setString(3,request.getParameter("dop"));
			ps.setString(4,request.getParameter("qty"));
			ps.setString(5,request.getParameter("cqty"));
			ps.setString(6,request.getParameter("status"));
			ps.setString(7,request.getParameter("loc"));
			int c2=ps.executeUpdate();
			if(c2>0){
			//for data into consumed table
			ps=con.prepareStatement("call consume(?,?,?,?,?,?,?)");
			ps.setString(1,request.getParameter("partno"));
			ps.setString(2,request.getParameter("dop"));
			ps.setString(3,request.getParameter("invno"));
			ps.setString(4,request.getParameter("doc"));
			ps.setString(5,request.getParameter("consumedby"));
			ps.setString(6,request.getParameter("purpose"));
			ps.setString(7,request.getParameter("cqty"));
			ps.executeUpdate();}
			//logging 
	String a=(String)session.getAttribute("username");
	String b=(String)request.getParameter("partno");
	String c=(String)request.getParameter("dop");
	String d=(String)session.getAttribute("invno");
	String e=(String)request.getParameter("cqty");
	java.util.Date date1=new java.util.Date();
	String l=date1+" : Updation of record by "+a+" of partno. "+b+" in inventory "+d+" with dop "+c+" and quantity consumed "+e+" ----------";
	ps=con.prepareStatement("insert into log values(?)");
	ps.setString(1,l);
	ps.executeUpdate();
	if(c2>0){
%>
		<jsp:include page="search.jsp"/>
		<h4>Successful updation!</h4>
<%
		}
		else{
%>
		<jsp:include page="search.jsp"/>
		<h4>Make sure quantity to be consumed is less than quantity avaialable!</h4>
<%
	}
		}
		catch(Exception e)
		{
		System.out.println("error in updation");
		e.printStackTrace();
%>
		<jsp:include page="search.jsp"/>
		<h3>Enter details for update correctly!</h3>
<%
		}	
%>