<%@ page import="java.sql.*" %>
 <center><table  border="1px" width="100%" cellpadding="5px" id="tab2">
        <tr>
          <td><b>ID</b></td>
          <td><b>NAME</b></td>
          <td><b>PRICE</b></td>
        </tr>
        <% int i;
            Connection con=(Connection)session.getAttribute("connection");
            if(con!=null)
              System.out.println("raman");
            PreparedStatement ps=con.prepareStatement("select name from t3 where id=?");
            ResultSet rs;
          for(i=1;i<=4;i++)
            {
              ps.setInt(1,i);
              rs=ps.executeQuery();
              rs.next();
        %>
          <tr>
              <td><%=rs.getString("name")%></td>
          </tr>
        <%
            }
        %>
      </table></center>