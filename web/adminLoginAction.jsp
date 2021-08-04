<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String username=request.getParameter("username");
String pwd=request.getParameter("password");
String uname="";
String pass="";
try
{
    Connection conn=ConnectionProvider.getConnection();
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery("select * from admin where username='"+username+"'");
        if(rs.next())
        {
         uname=rs.getString(1);
         pass=rs.getString(2);
        }
   System.out.println("username :"+uname);
   System.out.println("Password:"+pass);
            
}
catch(Exception ex)
{
    System.out.println("Exception in Admin Login db:"+ex);
    ex.printStackTrace();
}
if(username.equals(uname)&&pwd.equals(pass))
{
    response.sendRedirect("home.jsp");
}
else
{
    response.sendRedirect("adminLogin.jsp?msg=invalid");
}
%>
    