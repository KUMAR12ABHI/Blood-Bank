<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="test2.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"],input[type="date"], select,input[type="number"],input[type="tel"]
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
if("valid".equals(msg))
{
        %>
<center><font color="green" size="5">SuccesesFully Updated</font></center>
<%
        }
    if("invalid".equals(msg))
{
        %>
<center><font color="green" size="5">Something Went wrong try again !</font></center>
<%
        }
if("deleted".equals(msg))
{
        %>
<center><font color="green" size="5">SuccesesFully Deleted</font></center>
<%
        }
%>
<%
    int id=ConnectionProvider.getId();
    try
    {
        Connection con=ConnectionProvider.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from donor where id='"+id+"'");
        //System.out.println("Id of Updating =:"+id);
        while(rs.next())
        {
            %>
            <div class="container">
                <form action="test1.jsp" method="post">
                    <h2>ID</h2>
                    <input type="text"name="id" value="<%=rs.getInt(1)%>"readonly>
                   <hr>
                    <h2> Name</h2>
                    <input type="text" name="name"value="<%=rs.getString(2)%>"readonly>
            <hr>
             <h2>Father Name</h2>
             <input type="text" value="<%=rs.getString(3)%>"name="father"readonly>
            <hr>
            <h2>Mother Name</h2>
            <input type="text"value="<%=rs.getString(4)%>" name="mother"readonly>
            <hr>
            <h2>Gender</h2>
            <input type="text"value="<%=rs.getString(5)%>" name="gender"readonly>
            <hr>
            <h2>Blood Group</h2>
            <input type="text"value="<%=rs.getString(6)%>" name="bgroup"readonly>
            <hr>
             <h2>Date Of Birth</h2>
            <input type="text"value="<%=rs.getDate(7)%>" name="dob"readonly>
            <hr>
            <h2>Weight</h2>
            <input type="number" value="<%=rs.getInt(8)%>" name="weight"readonly>
            <hr>
             <h2>Mobile Number</h2>
             <input type="tel" name="mobile" value="<%=rs.getString(9)%>"id="mobile"readonly>
            <hr>
            <h2>Email</h2>
            <input  type="email"value="<%=rs.getString(10)%>"name="email"readonly>
            <hr>
            <h2>State</h2>
            <input type="text"value="<%=rs.getString(11)%>" name="state"readonly>
            <hr>
            <h2>City</h2>
            <input type="text"value="<%=rs.getString(12)%>"name="city"readonly>
            <hr>
            <h2>Pincode</h2>
            <input type="number"value="<%=rs.getInt(13)%>" name="pincode"readonly>
            <hr>
            <h2>Addresh</h2>
            <input type="text" value="<%=rs.getString(14)%>"name="addresh"readonly>
            <hr>
            <center><button type="submit"class="button">Close</button></center>
                </form>
            </div>
            <%
        }
    }
catch(Exception ex)
{
System.out.println("Error in Donor Profile Db:"+ex);
ex.printStackTrace();
}
    %>




<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ NITB ABHI :: 2021  </center></h3>

</body>
</html>