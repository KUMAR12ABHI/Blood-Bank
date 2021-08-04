<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%
String id=request.getParameter("id");
String bloodgroup=request.getParameter("bloodgroup");
String dob=request.getParameter("birthday");
String unit=request.getParameter("unit");
int id1=Integer.parseInt(id.trim());
int units=Integer.parseInt(unit.trim());

try
{
    System.out.println("date is:"+dob);
     String tk[]=dob.split("-");
     String dt=tk[2]+"/"+tk[1]+"/"+tk[0];
     System.out.println("New Date is"+dt);
     SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
			java.util.Date d1=sdf.parse(dt);
			long ms=d1.getTime();
			java.sql.Date d2=new java.sql.Date(ms);
    Connection conn=ConnectionProvider.getConnection();
    PreparedStatement ps=conn.prepareStatement("insert into blood values(?,?,?,?)");
   System.out.println("id of String is:"+id);
    int kp=Integer.parseInt(id.trim());
    System.out.println("Id of testing is:"+kp);
    ps.setInt(1,kp);
    ps.setString(2,bloodgroup);
    ps.setInt(3,units);
    ps.setDate(4,d2);
    ps.executeUpdate();
    response.sendRedirect("donating.jsp?msg=valid");
}
catch(Exception ex)
{
    response.sendRedirect("donating.jsp?msg=invalid1");
    System.out.println("Error in Add Donating Details :"+ex);
    ex.printStackTrace();
}
%>