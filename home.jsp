<%@ page import="java.util.*" errorPage="error.jsp"%>

<html style="background-image: url(images/r2.png)">

<head>

  <title>Inventory Management</title>

  <link rel="stylesheet" href="css/home.css"/>

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

      <div id="login">

        <marquee id="mar" scrollamount=4>Welcome to RCI</marquee>

        <form action="loginprocess.jsp" method="post">

          <h2 id="sign">SIGN IN</h2>

          <input id="us" type="text" name="USERNAME" autofocus placeholder="Username" requried/><br/>

          <input id="pass" type="password" name="PASSWORD" placeholder="password" required/><br/>

          <input id="sub" type="submit" value="Submit"/>

        </form>

      </div>

    </div>

  </div>

</body>

</html>