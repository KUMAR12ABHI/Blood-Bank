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
if("invalid".equals(msg))
    {
        %>
        <center><font color="red" size="5">Id is Not Found Please Enter Correct Id ! </font></center>
        <%
    }
if("invalid1".equals(msg))
    {
        %>
        <center><font color="red" size="5">Some Problem In Server ! </font></center>
        <%
    }
if("valid".equals(msg))
    {
        %>
        <center><font color="green" size="5">SuccessFully Insert  </font></center>
        <%
    }
    %>
        
   
    <div class="container">
        <form action="donatingAction.jsp"method="post">
            <h2>Donar Id</h2>
            <input type="text"name="id"placeholder="Enter Donar Id"required >
            <hr>
            <center><button type="submit"class="button">Search</button></center>
                
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