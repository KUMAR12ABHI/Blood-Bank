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
    System.out.println("date is:"+dob);
     String tk[]=dob.split("-");
     String dt=tk[2]+"/"+tk[1]+"/"+tk[0];
     System.out.println("New Date is"+dt);
     SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
			java.util.Date d1=sdf.parse(dt);
			long ms=d1.getTime();
			java.sql.Date d2=new java.sql.Date(ms);
    Connection conn=ConnectionProvider.getConnection();
    PreparedStatement ps=conn.prepareStatement("insert into donor values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
   System.out.println("id of String is:"+id);
    int kp=Integer.parseInt(id.trim());
    System.out.println("Id of testing is:"+kp);
    ps.setInt(1,kp);
    ps.setString(2,name);
    ps.setString(3,father);
    ps.setString(4,mother);
    ps.setString(5,gender);
    ps.setString(6,bloodgroup);
    ps.setDate(7,d2);
    ps.setInt(8,Integer.parseInt(weight.trim()));
    ps.setString(9,mobile);
    ps.setString(10,email);
    ps.setString(11,state);
    ps.setString(12,city);
    ps.setInt(13,Integer.parseInt(pincode.trim()));
    ps.setString(14,addreshp);
   
    System.out.println("Addresh is Checking:"+addreshp);
    ps.executeUpdate();
    response.sendRedirect("dsignup.jsp?msg=valid");
}
catch(Exception ex)
{
    response.sendRedirect("dsignup.jsp?msg=invalid");
    System.out.println("Error in Add Donor :"+ex);
    ex.printStackTrace();
}
%>