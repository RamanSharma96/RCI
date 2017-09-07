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

           <img src="
           images/g.png" width="75px" height="75px" alt="asdasdasd"/>

         </div>

       </td>

      </tr>

    </div>

      </table>

    </div>

  </div>
  <br><br><br><br>
  <form id="invform" action="create_inv.jsp">
   <label for="username"><b>Username</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="username" required><br><br>
    <label for="status"><b>Password</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="password" required><br><br>
     <label for="status"><b>Inventory</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="invno" required><br><br>
     <input type="submit"  value="Create">
 </form>
</body>

</html>