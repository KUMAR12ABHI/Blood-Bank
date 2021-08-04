
<%@page import="in.abhi.bbs.pojo.acControl"%>
<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String id=request.getParameter("id");
int id1=Integer.parseInt(id.trim());
try
{
 Connection con=ConnectionProvider.getConnection();
 Statement st1=con.createStatement();
 st1.executeUpdate("delete from blood where id='"+id1+"'");
 Statement st=con.createStatement();
 st.executeUpdate("delete from donor where id='"+id1+"'");
 response.sendRedirect("deleteDonor.jsp?msg=deleted");
}
catch(Exception ex)
{
    System.out.println("Error In Deletd Db:"+ex);
    ex.printStackTrace();
    response.sendRedirect("deleteDonor.jsp?msg=invalid");
}
%>