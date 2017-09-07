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
      System.out.println(session.getAttribute("invno"));
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
    <br><br>
    <form id="form2" action="admin_add.jsp" method="POST">
    <div id="add">
    <label for="partno"><b>Part Number</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" autofocus name="partno" required><br><br>
    <label for="pname"><b>Part Name</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" required name="pname"><br><br>
    <label for="mfg"><b>Manufacturer</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mfg"><br><br>
    <label for="currency"><b>Currency</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="currency">
  <option value="INR">INR</option>
  <option value="USD">USD</option>
  <option value="EURO">EURO</option>
  <option value="AUD/USD">Australian Dollar</option>
</select><br><br>
    <label for="material"><b>Material Type</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="material">
  <option value="consumable">Consumable</option>
  <option value="non-consumable">Non-consumable</option>
</select><br><br>
    <label for="invno"><b>Inventory Number</b></label><input type="text" readonly="true" name="invno" placeholder= <%=(String)session.getAttribute("invno")%>><br><br>
    <label for="qty"><b>Quantity</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input required type="text" name="qty"><br><br>
    <label for="price"><b>Price</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" required name="price"><br><br>
    <label for="status"><b>Status</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" required name="status"><br><br>
    <label for="dop"><b>Date Of Purchase</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" required name="dop"><br><br>
    <label for="loc"><b>Location</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input required type="text" name="loc"><br><br>
     <label for="loc"><b>Remark</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="25" rows="5" name="remark"></textarea><br><br>
    <input type="submit" value="Submit">
    
    </div>
</form>
  
 </body>
</html>