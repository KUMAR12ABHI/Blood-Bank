<%@page import="java.sql.*"%>

<%@include file="html/test.html"%>
<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<style>
input[type="text"],input[type="tel"], input[type="password"],input[type="date"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
}
</style>
</head>
<body>
    <%
    String msg=request.getParameter("msg");
    String id=request.getParameter("id");
    int id1=Integer.parseInt(id.trim());
    String b_group="";
    int tempid=0;
    String name1="";
    %>
        
    <%
    try
    {
        Connection conn=ConnectionProvider.getConnection();
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery("select * from donor where id='"+id1+"'");
        if(rs.next())
        {
            tempid=rs.getInt(1);
            name1=rs.getString(2);
            b_group=rs.getString(6);
        }
        if(tempid!=id1)
        {
          response.sendRedirect("donating.jsp?msg=invalid");  
        }
    %>
        <div class="container">
            <h1 style="color: red">Donor id: <%out.println(id1); %></h1>
         
        <%
        System.out.println("Donar Id:"+id);
    }
catch(Exception ex)
{
System.out.println("Exception in donating action Id:"+ex);
}
    
    %>
    <div class="container">
        <form action="donatingAction1.jsp"method="post">
            <h2>Id</h2>
            <input type="text"name="id" value=" <% out.println(id);%>"readonly >
            <hr>
            <h2>Name</h2>
            <input type="text"name="name" value=" <% out.println(name1);%>"readonly >
            <hr>
            <h2>Blood Group</h2>
            <input type="text"name="bloodgroup" value=" <% out.println(b_group);%>"readonly>
            <hr>
             <h2>Date Of Donating</h2>
    <input type="date" id="birthday" name="birthday"placeholder="mm-dd-yyyy"required>
    <hr>
    <h2>Unit</h2>
            <input type="text" placeholder="Enter Unit" name="unit"required>
            <hr>
            <center><button type="submit"class="button">Save</button></center>
                
        </form>
    </div>
        





  </div>

<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @NITB ABHI :: 2021  </center></h3>

</body>
</html>