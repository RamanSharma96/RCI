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
    }
%>
<%
		int c=1,k=0;
		String s[]=new String[50];
		String d[]=new String[50];
		while((String)request.getParameter("dop"+c)!=null)
		{		
				if((String)request.getParameter("partno"+c)!=null)
				{
					s[k]=(String)request.getParameter("partno"+c);
					d[k++]=(String)request.getParameter("dop"+c);
				}
				System.out.println("hi");
				c++;
		}
		try{
		Connection con=(Connection)session.getAttribute("connection");
		PreparedStatement ps=null;
		c=0;
		for(int i=0;i<k;i++)
		{
			System.out.println(s[i]+" "+d[i]);
			ps=con.prepareStatement("delete from main where partno=? and dop=? and invno=?");
			ps.setString(1,s[i]);
			ps.setString(2,d[i]);
			ps.setString(3,(String)session.getAttribute("invno"));
			c+=ps.executeUpdate();
		}	
		if(c>0){
		out.println("<h2>Successfully deleted "+c+" row(s)</h2>");
		String a=(String)session.getAttribute("username");
		String invno=(String)session.getAttribute("invno");
		java.util.Date da=new java.util.Date();
		String l=da+" : Deletion of "+c+" record(s) by "+a+" from inventory "+invno+"----------";
		ps=con.prepareStatement("insert into log values(?)");
		ps.setString(1,l);
		ps.executeUpdate();
		}
		else
		out.println("<h2>Select a row to delete!</h2>");
		}
		catch(Exception e)
		{
		e.printStackTrace();
		out.println("Some error in deletion");
	}
%>
