<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
 String mobilenmber=request.getParameter("mobilenumber");
 try
 {
     Connection con=ConnectionProvider.getConnection();
    Statement st=con.createStatement();
    st.executeUpdate("delete from bloodrequest where req_id='"+mobilenmber+"'");
    
     response.sendRedirect("requestForBlood.jsp");
 }
 catch(Exception ex)
 {
     System.out.println("Error in Updating Status in Reuest Db:"+ex);
     ex.printStackTrace();
      response.sendRedirect("requestForBlood.jsp");
 }
%>