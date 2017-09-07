<%@ page import="bean.LoginDAO,java.sql.*" errorPage="error.jsp"%>

<jsp:useBean id="log" class="bean.LoginBean"/>
<%
  Connection con=null;
  log.setUSERNAME((String)request.getParameter("USERNAME"));
  log.setPASSWORD((String)request.getParameter("PASSWORD"));
    con=LoginDAO.validate(log);
  String invno="";
  if(con!=null)
  {
    System.out.println("Successfull logged in!");
    session.setAttribute("username",request.getParameter("USERNAME"));
    session.setAttribute("session",true);
    session.setAttribute("connection",con);
    try{
        PreparedStatement ps=con.prepareStatement("select invno from user where username=?");
        ps.setString(1,(String)request.getParameter("USERNAME"));
        ResultSet rs=ps.executeQuery();
        rs.next();
        invno=rs.getString(1);
       session.setAttribute("invno",invno);
    }
    catch(Exception e)
    {
    e.printStackTrace();
    }
    String t=(String)request.getParameter("USERNAME");
    if(t.equals("Admin")){
    System.out.println("Admin logged in");
%>
  <jsp:forward page="welcome_admin.jsp"/>
<%
    }
    else{
%>
     <jsp:forward page="welcome.jsp"/>
<%
  }
  }
  else{
%>
  <jsp:forward page="error.jsp"/>
<%
  }
%>