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
 Connection con=null;
    ResultSet rs=null;
    try{
      con=(Connection)session.getAttribute("connection");
      PreparedStatement ps=con.prepareStatement("select distinct(dop) from main order by dop desc");
       rs=ps.executeQuery();
      }
      catch(Exception e)
      {
      e.printStackTrace();
    }
%>
    <br><br>
    <form id="form2" action="transferprocess.jsp" method="POST">
    <div id="add">
    <label for="partno"><b>Part Number</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" autofocus name="partno" required><br><br>
    <b> Date of Purchase</b>
          <select name="dop">
          <%
              while(rs.next()){
          %>
            <option><%=rs.getString(1)%></option>
          <%  
              }
          %>
          </select><br><br>
    <label for="mfg"><b>From inventory</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="finvno"><br><br>
    <label for="currency"><b>To inventory</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input required type="text" name="tinvno"><br><br>
    <label for="material"><b>Quantity be to transfered</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="qty" required ><br><br>
    <input type="submit" value="Transfer">
    </div>
</form>
   <input type="hidden" id="refreshed" value="no">
    <script type="text/javascript">
    onload=function(){
      var e=document.getElementById("refreshed");
      if(e.value=="no")
        e.value="yes";
      else{
        e.value="no";
        location.reload();
      }
    }
  </script>
 </body>
</html>