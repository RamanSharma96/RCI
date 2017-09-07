<%@ page import="java.sql.*" errorPage="error.jsp" %>
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
<html>
<head>
  <title>Inventory Management</title>
  <link rel="stylesheet" href="css/view.css"/>
  <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
 <!-- <script type="text/javascript">
function f1() {
  // body...
  onclick=if confirm('Do you really want to submit the form? you are about to update inventory database.')
    commentDelete(1);
    return false;;

}-->
</script>
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
      <!-- to display -->
  <br><br>
 <br>
    <form action="updateform_admin.jsp">
         <table width="100%" border="4">  
    <tr>
      <td>Part No.</td>
      <td>Date of Purchase/Date Item Received</td>
      <td>Inventory</td>
      <td>Date of Consumption</td>
      <td>Consumed by</td>
      <td>Quantity Consumed</td>
      <td>Remark/Purpose</td>
    </tr>
  <%
  	System.out.println(request.getParameter("partno"));
  	System.out.println(request.getParameter("invno"));
  	System.out.println(request.getParameter("dop"));
  	try{
      Connection con=(Connection)session.getAttribute("connection");
      PreparedStatement ps=con.prepareStatement("select *from consumed where partno=? and dop=? and invno=?");
      ps.setString(1,(String)request.getParameter("partno"));
      ps.setString(2,(String)request.getParameter("dop"));
      ps.setString(3,(String)request.getParameter("invno"));
      ResultSet rs2=ps.executeQuery();
            while(rs2.next()){
  %>
            <tr>
                      <td><%=rs2.getString(1)%></td>
                      <td><%=rs2.getString(2)%></td>
                      <td><%=rs2.getString(3)%></td>
                      <td><%=rs2.getString(4)%></td>
                      <td><%=rs2.getString(5)%></td>
                      <td><%=rs2.getString(7)%></td>
                      <td><%=rs2.getString(6)%></td>
            </tr>
<%
        }
%> </table>
<%
        }
        catch(Exception e)
        {
          e.printStackTrace();
      }
%>
 </body>
</html>