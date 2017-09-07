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
      System.out.println(session.getId());
    }
%>
<html>
<head>
  <title>Inventory Management</title>
  <link rel="stylesheet" href="css/addform.css"/>
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
      </table>
    </div>
<%
    int c=1;
    while(request.getParameter("dop"+c)!=null)
    {
      if(request.getParameter("partno"+c)!=null)
        break;
      c++;
  }
    Connection con=null;
    ResultSet rs=null;
    try{
      con=(Connection)session.getAttribute("connection");
      PreparedStatement ps=con.prepareStatement("select *from main where partno=? and invno=? and dop=?");
      ps.setString(1,request.getParameter("partno"+c));
      ps.setString(2,(String)request.getParameter("invno"+c));
      ps.setString(3,request.getParameter("dop"+c));
      rs=ps.executeQuery();
      boolean q=rs.next();
      if(q!=true)
      {
%>  
        out.println("<h1>Incorrect fields</h1>");
        <jsp:forward page="search_admin.jsp"/>
<%
    }
  }
  catch(Exception e)
  {
    e.printStackTrace();
  }
%><br><br>
  <form action="consumed_record_admin.jsp">
       <b>To View Record</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="text" hidden name="partno" value=<%=rs.getString(1)%> >
       <input type="text" hidden name="invno" value=<%=rs.getString(6)%> >
       <input type="text" hidden name="dop" value=<%=rs.getString(10)%> >
       <input type="submit" value="View Record" name="record">
    </form><hr>
 <form action="update_admin.jsp" method="post" align="left">
    <br>
    <label for="partno"><b>Part Number</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly name="partno" value=<%=rs.getString(1)%>><br><br>
    <label for="invno"><b>Inventory</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly name="invno" value=<%=rs.getString(6)%>><br><br>
    <label for="dop"><b>Date of Purchase</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly name="dop" value=<%=rs.getString(10)%>><br><br>
    <label for="qty"><b>Quantity Available</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="qty" readonly value=<%=rs.getString(7)%>><br><br>
    ----------Update the following----------<br><br>
    <label for="consumed"><b>Quantity to be Consumed</b></label>&nbsp;&nbsp;&nbsp;<input type="text"  name="cqty"><br><br>
    <label for="status"><b>Date of consumption</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="doc"><br><br>
    <label for="status"><b>Consumed by</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="consumedby"><br><br>
     <label for="status"><b>Purpose/Remark</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="purpose"><br><br>
     <label for="status"><b>Status</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value=<%=rs.getString(9)%> name="status"><br><br>
     <label for="status"><b>Location</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value=<%=rs.getString(11)%> name="loc"><br><br>
     <input type="submit" action="update_admin.jsp" value="update">
</form>
 </body>
</html>