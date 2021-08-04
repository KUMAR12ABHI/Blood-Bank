<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="html/test.html"%>
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
    String id=request.getParameter("id");
    System.out.println("Checking id is :"+id);
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
                <form action="updateDonorAction.jsp" method="post">
                    <h2>ID</h2>
                    <input type="text"name="id" value="<%=rs.getInt(1)%>"readonly>
                   <hr>
                    <h2> Name</h2>
                    <input type="text" name="name"value="<%=rs.getString(2)%>" placeholder="Enter Donor name"required>
            <hr>
             <h2>Father Name</h2>
            <input type="text" value="<%=rs.getString(3)%>"name="father" placeholder="Enter Father name"required>
            <hr>
            <h2>Mother Name</h2>
            <input type="text"value="<%=rs.getString(4)%>" name="mother" placeholder="Enter Mother name"required>
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
             <input type="date" id="birthday" name="birthday"value="<%=rs.getDate(7)%>"required>
            <hr>
            <h2>Weight</h2>
            <input type="number" value="<%=rs.getInt(8)%>" name="weight"required>
            <hr>
             <h2>Mobile Number</h2>
            <input type="tel" name="mobile" value="<%=rs.getString(9)%>"id="mobile" placeholder="Enter Mobile Number" pattern="[6789][0-9]{9}"required>
            <hr>
            <h2>Email</h2>
            <input  type="email"value="<%=rs.getString(10)%>"placeholder="Enter Email" name="email"required>
            <hr>
            <h2>State</h2>
            <input type="text" placeholder="Enter State" value="<%=rs.getString(11)%>" name="state"required>
            <hr>
            <h2>City</h2>
            <input type="text" placeholder="Enter City" value="<%=rs.getString(12)%>"name="city"required>
            <hr>
            <h2>Pincode</h2>
            <input type="number" placeholder="Enter Pincode"value="<%=rs.getInt(13)%>" name="pincode"required>
            <hr>
            <h2>Addresh</h2>
            <input type="text" value="<%=rs.getString(14)%>"placeholder="Enter Addresh" name="addresh"required>
            <hr>
            <center><button type="submit"class="button">Save</button></center>
                </form>
            </div>
            <%
        }
    }
catch(Exception ex)
{
System.out.println("Error in Updating Deltails Db:"+ex);
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