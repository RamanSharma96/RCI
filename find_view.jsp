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
      <td>Part name</td>
      <td>Manufacturer</td>
      <td>Currency</td>
      <td>Material</td>
      <td>Inventory</td>
      <td>Total qty.</td>
      <td>Quantity Avl.</td>
      <td>Consumed Amt.</td>
      <td>Price</td>
      <td>Status</td>
      <td>Location</td>
      <td>Remark</td>
    </tr>
  <%
    int c=1;
    try{
      Connection con=(Connection)session.getAttribute("connection");
      PreparedStatement ps=con.prepareStatement("call find(?)");
      ps.setString(1,(String)request.getParameter("find"));
      ResultSet rs2=ps.executeQuery();
            while(rs2.next()){
  %>
            <tr>
                      <td><input type="checkbox" name="partno<%=c%>" value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></td>
                      <td><input type="checkbox" name="dop<%=c%>" hidden checked value="<%=rs2.getString(10)%>"><%=rs2.getString(10)%></td>
                      <td><%=rs2.getString(2)%></td>
                      <td><%=rs2.getString(3)%></td>
                      <td><%=rs2.getString(4)%></td>
                      <td><%=rs2.getString(5)%></td>
                      <td><input type="checkbox" name="invno<%=c++%>" hidden checked value="<%=rs2.getString(6)%>"><%=rs2.getString(6)%></td>
                      <td><%=rs2.getInt(7)+rs2.getInt(13)%></td>
                      <td><%=rs2.getInt(7)%></td>
                       <td><%=rs2.getInt(13)%></td>
                      <td><%=rs2.getFloat(8)%></td>
                      <td><%=rs2.getString(9)%></td>
                      <td><%=rs2.getString(11)%></td>
                      <td><%=rs2.getString(12)%></td>
            </tr>
<%
        }
%> 
         <input type="submit" value="Update and Record" name="update">
        </form>
        </table>
<%
        }
        catch(Exception e)
        {
          e.printStackTrace();
      }
%>
 </body>
</html>