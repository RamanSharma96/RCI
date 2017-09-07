<%@ page import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="adminindex.jsp"%>
<%  
    if(session.getAttribute("session")==null)
      {
        System.out.println("Unauthorized access!");
%>
<jsp:forward page="home.jsp"/>
<%
      }
    else{
      System.out.println("At welcome_admin jsp page");
    }
%>
<html>
<head>
  <title>Inventory Management</title>
  <link rel="stylesheet" href="css/welcome.css"/>
  <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
</head>
<body>
    <div id="page">
      <table id="tab" >
        <div id="nav">
          <tr>
         <td align="center" valign="center" id="img1"><div>
           <img src="images/rci.png" alt="ntg" width="75px" height="75px"/>
         </div>
       </td>
       <td id="heading">
          <div>
           <h1>Research Center Imarat</h1> 
         </div>
        </td>
        <td id="img2">
         <div>
           <img src="images/g.png" width="75px" height="75px" alt="asdasdasd"/>
         </div>
       </td>
      </tr>
    </div>
      </table><br><Br>
<%
    try{
      Connection con=(Connection)session.getAttribute("connection");
      PreparedStatement ps=con.prepareStatement("select distinct(invno) from user where invno!=0");
      ResultSet rs=ps.executeQuery();
      while(rs.next()){
%>
        <h3>Inventory <a href="inventory.jsp?invno=<%=rs.getString(1)%>"><%=rs.getString(1)%></a><br></h3>
<%
      }
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
%>
    </div>
</body>
</html>