<%@page import="java.sql.*"%>
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
    if("valid".equals(msg))
    {
        %>
        <center><font color="red" size="5">SecuessFully Updated </font></center>
        <%
            response.sendRedirect("donorLogin.jsp");
    }
if("invalid".equals(msg))
    {
        %>
        <center><font color="red" size="5">Some Went wrong try again ! </font></center>
        <%
    }
    %>
        
    <%
    int id=1;
    try
    {
        Connection conn=ConnectionProvider.getConnection();
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery("select max(id) from donor");
        if(rs.next())
        {
            id=rs.getInt(1);
            id=id+1;
        }%>
        <div class="container">
            <h1 style="color: red">Donor id: <%out.println(id); %></h1>
         
        <%
        System.out.println("Donar Id:"+id);
    }
catch(Exception ex)
{
System.out.println("Exception in Id:"+ex);
}
    
    %>
    <div class="container">
        <form action="daddAction.jsp"method="post">
            <input type="hidden"name="id" value=" <% out.println(id);%>" >
             <h2> Name</h2>
             <input type="text" name="name" placeholder="Enter Donor name"required>
            <hr>
             <h2>Father Name</h2>
            <input type="text" name="father" placeholder="Enter Father name"required>
            <hr>
            <h2>Mother Name</h2>
            <input type="text" name="mother" placeholder="Enter Mother name"required>
            <hr>
             <h2>Gender</h2>
            <select name="gender"required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
            <hr>
            <h2>Blood Group</h2>
            <select name="bloodgroup"required>
               <option value="A+">A+</option>
               <option value="A-">A-</option>
               <option value="B+">B+</option>
               <option value="B-">B-</option>
               <option value="O+">O+</option>
               <option value="O-">O-</option>
               <option value="AB+">AB+</option>
              <option value="AB-">AB-</option>
            </select>
            <hr>
            <h2>Date Of Birth</h2>
    <input type="date" id="birthday" name="birthday"placeholder="mm-dd-yyyy"required>
        
        
            <hr>
            <h2>Weight</h2>
            <input type="number" placeholder="Enter Weight" name="weight"required>
            <hr>
            <h2>Mobile Number</h2>
            <input type="tel" name="mobile" id="mobile" placeholder="Enter Mobile Number" pattern="[6789][0-9]{9}"required>
            <hr>
            <h2>Email</h2>
            <input  type="email"placeholder="Enter Email" name="email"required>
            <hr>  
            <h2>State</h2>
            <input type="text" placeholder="Enter State" name="state"required>
            <hr>
            <h2>City</h2>
            <input type="text" placeholder="Enter City" name="city"required>
            <hr>
            <h2>Pincode</h2>
            <input type="number" placeholder="Enter Pincode" name="pincode"required>
            <hr>
            <h2>Addresh</h2>
            <input type="text" placeholder="Enter Addresh" name="addresh"required>
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