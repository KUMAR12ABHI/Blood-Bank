<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"],select
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:35%;
	padding:15px;
	width:33%;	
	border-radius: 25px;
}
</style>
</head>
<body>
<div class="header">
  <a href="#default" class="logo"><img class="logo" src="img/Logo1.png"></a>
  <div class="header-right">
    <a href="index.jsp">Home</a>
    <a class="active" href="findDonor.jsp">Find Donor</a>
  </div>
</div>
<body>
<div class="container">
<br>
	<br>
        <%
            String msg=request.getParameter("msg");
            if("invalid".equals(msg))
            {
                %>
                <center><font color="red" size="5">Invalid User name/Password<</center>
                <%
            }
        %>
            <div class="container">
        <form action="findDonorAction.jsp"method="post">
 
            <center> <h2>Select Blood Group</h2></center>
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
                <br>
            <center><h2>Select search Option</h2></center>
            <select name="searchoption"required>
               <option value="bc">Blood Group With City</option>
               <option value="bs">Blood Group With State</option>
               <option value="bp">Blood Group With PinCode</option>
               <option value="na">None Of The Above</option>
            </select>
                <br>
                <center><h2>Enter pinCode/City/State</h2></center>
                <input type="text" name="searchValue" placeholder="Enter pinCode/State/City"required>
                <br>
           
            <center><button type="submit"class="button">Find</button></center>
                
        </form>
    </div>
        
<br>
<br>
<br>
<h3><center>All Right Reserved @NITB ABHI :: 2021  </center></h3>
</body>
</html>
