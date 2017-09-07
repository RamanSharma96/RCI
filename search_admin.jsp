<%@ page import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="adminindex2.jsp"%>
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

 <%@ page import="java.util.*" errorPage="error.jsp"%>
<html>

<head>

  <title>Inventory Management</title>

  <link rel="stylesheet" href="css/search.css"/>

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
        <br><br><br>
        <form action="view_admin.jsp" method="post">
          <h2>Search <input type="text" name="search" required autofocus placeholder="keyword">
          <input type="submit" value="Go"/></h2>
        </form>
    </div>

  </div>

</body>

</html>