<%@ page isErrorPage="true"%>
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
  <link rel="stylesheet" href="css/error.css"/>
  <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
</head>
<body>
    <div id="page">
      <table id="tab" >
        <div id="nav">
          <tr>
         <td align="center" valign="center" id="img1"><div>
           <img src="rci.png" alt="ntg" width="75px" height="75px"/>
         </div>
       </td>
       <td id="heading">
          <div>
           <h1>Research Center Imarat</h1> 
         </div>
        </td>
        <td id="img2">
         <div>
           <img src="g.png" width="75px" height="75px" alt="asdasdasd"/>
         </div>
       </td>
      </tr>
    </div>
      </table>
        <center>
          <br><br><br><br><br><h2>Sorry! Some error has occured.</h2>
        </center>
    </div>
</body>
</html>