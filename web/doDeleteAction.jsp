
<%@page import="in.abhi.bbs.pojo.acControl"%>
<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
window.alert("Hellow")
</script>

    </head>
    <body>
        <%
int id1=ConnectionProvider.getId();
try
{
 Connection con=ConnectionProvider.getConnection();
 Statement st1=con.createStatement();
 st1.executeUpdate("delete from blood where id='"+id1+"'");
 Statement st=con.createStatement();
 st.executeUpdate("delete from donor where id='"+id1+"'");
 %>
 <script type="text/javascript">
window.alert("Hellow");
</script>
<%
      response.sendRedirect("donorLogin.jsp");
 }
catch(Exception ex)
{
    System.out.println("Error In Deletd Db:"+ex);
    ex.printStackTrace();
    response.sendRedirect("deleteDonor.jsp?msg=invalid");
}
%>
    </body>
</html>
