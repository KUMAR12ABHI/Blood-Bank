<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String father=request.getParameter("father");
String mother=request.getParameter("mother");
String gender=request.getParameter("gender");
String bloodgroup=request.getParameter("bloodgroup");
String dob=request.getParameter("birthday");
String weight=request.getParameter("weight");
String mobile=request.getParameter("mobile");
String email=request.getParameter("email");
String state=request.getParameter("state");
String city=request.getParameter("city");
String pincode=request.getParameter("pincode");
String addreshp=request.getParameter("addresh");
try
{
    String tk[]=dob.split("-");
     String dt=tk[2]+"/"+tk[1]+"/"+tk[0];
     System.out.println("New Date is"+dt);
     SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
			java.util.Date d1=sdf.parse(dt);
			long ms=d1.getTime();
			java.sql.Date d2=new java.sql.Date(ms);
    Connection con=ConnectionProvider.getConnection();
    PreparedStatement ps=con.prepareStatement("update donor set name=?,father=?,mother=?,gender=?,b_group=?,dob=?,weight=?,mob_no=?,email=?,state=?,city=?,pincode=?,addresh=? where id=?");
    ps.setString(1,name);
    ps.setString(2,father);
    ps.setString(3,mother);
    ps.setString(4,gender);
    ps.setString(5,bloodgroup);
    ps.setDate(6,d2);
    ps.setInt(7,Integer.parseInt(weight.trim()));
    ps.setString(8,mobile);
    ps.setString(9,email);
    ps.setString(10,state);
    ps.setString(11,city);
    ps.setInt(12,Integer.parseInt(pincode.trim()));
    ps.setString(13,addreshp);
    ps.setInt(14,Integer.parseInt(id.trim()));
    ps.executeUpdate();
    response.sendRedirect("editDonr.jsp?msg=valid");
    
}   
  
catch(Exception ex)
{
    System.out.println("Error In Updating Db :"+ex);
    ex.printStackTrace();
    response.sendRedirect("editDonr.jsp?msg=valid");
}
%>
    