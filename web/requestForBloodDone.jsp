<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
 String mobilenmber=request.getParameter("mobilenumber");
 System.out.println("Checking Mobile Number of Done:"+mobilenmber);
 try
 {
     Connection con=ConnectionProvider.getConnection();
     PreparedStatement ps=con.prepareStatement("update bloodrequest set status='complited'where req_id=?");
     ps.setString(1,mobilenmber.trim());
     ps.executeUpdate();
     response.sendRedirect("requestForBlood.jsp?msg=valid");
 }
 catch(Exception ex)
 {
     System.out.println("Error in Updating Status in Reuest Db:"+ex);
     ex.printStackTrace();
      response.sendRedirect("requestForBlood.jsp?msg=invalid");
 }
%>