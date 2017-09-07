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
    }
%>
<%
	String p=(String)request.getParameter("partno");
	String f=(String)request.getParameter("finvno");
	String t=(String)request.getParameter("tinvno");
	String d=(String)request.getParameter("dop");
	int q=Integer.parseInt(request.getParameter("qty"));
	try{
		Connection con=(Connection)session.getAttribute("connection");
		PreparedStatement ps=con.prepareStatement("select qty from main where invno=? and dop=? and partno=?");
		ps.setString(1,f);
		ps.setString(2,d);
		ps.setString(3,p);
		ResultSet rs=ps.executeQuery();
		rs.next();
		if(rs.getInt(1)<q)
			{
				out.println("<h2>Quantity is too much to be transferred</h2>");
			}
		else{
				ps=con.prepareStatement("call transfer(?,?,?,?,?)");
				ps.setString(1,p);
				ps.setString(2,d);
				ps.setString(3,f);
				ps.setString(4,t);
				ps.setInt(5,q);
				int c=ps.executeUpdate();
				if(c>0)
				out.println("<h1>Successfully transferred!</h1>");
				else
					out.println("<h1>Invalid details!</h1>");
				String a=(String)session.getAttribute("username");
			java.util.Date da=new java.util.Date();
			String l=da+" : Transfer of record by "+a+" of partno. "+p+" from inventory "+f+" into inventory "+t+" of quantity "+q+" with dop "+d+"----------";
	ps=con.prepareStatement("insert into log values(?)");
	ps.setString(1,l);
	ps.executeUpdate();
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.println("<h2>Invalid partno or dop!</h2>");
	}
%>
