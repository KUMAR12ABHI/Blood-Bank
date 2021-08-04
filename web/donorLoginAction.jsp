<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String id=request.getParameter("did");
id=id.trim();
String pwd=request.getParameter("password");
pwd=pwd.trim();
String uname="";
String pass="";
String username="";
try
{
    System.out.println("Form Checking");
    System.out.println("Html from username:"+id);
    System.out.println("Html from Mobile No:"+pwd);
    Connection conn=ConnectionProvider.getConnection();
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery("select id,mob_no,name from donor where id='"+id+"'");
        if(rs.next())
        {
         uname=""+rs.getInt(1);
         pass=rs.getString(2);
         username=rs.getString(3);
        }
   System.out.println("username :"+uname);
   System.out.println("Password:"+pass);
   System.out.println("Donor Name=:"+username);
            
}
catch(Exception ex)
{
    System.out.println("Exception in Donor Login db:"+ex);
    ex.printStackTrace();
}
if(id.equals(uname)&&pwd.equals(pass))
{
    ConnectionProvider.setId(Integer.parseInt(uname));
    ConnectionProvider.setUsername(username);
   response.sendRedirect("test1.jsp");
   
}
else
{
    response.sendRedirect("donorLogin.jsp?msg=invalid");
}
%>
    