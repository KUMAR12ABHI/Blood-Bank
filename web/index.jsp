<head>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<style>
.mySlides {display:none;}

input[type="text"],select,input[type="email"],input[type="tel"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:2%;
	padding:15px;	
}
</style>
</head>
<body>

<div class="header">
    <a href="#default" class="logo"><img class="logo" src="img/Logo1.png"></a>
  <div class="header-right">
    <a class="active" href="index.jsp">Home</a>
    <a href="findDonor.jsp">Find Donor</a>
    
    <a href="adminLogin.jsp">Admin Login</a>
    <a href="donorLogin.jsp">Donor Login</a>
  </div>
</div>

<div style="max-width:100%">
    <img class="mySlides"  src="img/slide1.jpg" >
    <img class="mySlides"  src="img/slide2.png" >
</div>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>


<body>
  <br>
  <%
  String msg=request.getParameter("msg");
  if("valid".equals(msg))
  {
     %>
<center><font color="red" size="5">Form Submited Secuessfully.you will get notifed will be 24hrs</center>
<%
  }
else
{
%>
<center><font color="red" size="5">Invalid Data Try again</center>
<%
}
 %>
      
<center><h1>Enter Your Details To Request For Blood</h1></center>
<form action="indexFormAction.jsp" method="post">
    <center>
        <input type="text" name="name" placeholder="Enter Name"required>
        <input type="tel" name="mobilenumber" placeholder="Enter Mobile No" pattern="[6789][0-9]{9}"required>
        <input type="email" name="email" placeholder="Entere Email"required>
        <select name="bloodgroup" required>
               <option value="A+">A+</option>
               <option value="A-">A-</option>
               <option value="B+">B+</option>
               <option value="B-">B-</option>
               <option value="O+">O+</option>
               <option value="O-">O-</option>
               <option value="AB+">AB+</option>
              <option value="AB-">AB-</option>
            </select>
        
        <button class="button1"><span>Submit</span></button>
    </center>           
        
</form> 
 
 
 
 
  <br>
  <br>
  </div>
</div>

<div class="row1"> 
<div class="container"> 
<br>         
<br>
    </tbody>
  </table>
</div>
</div>
<h3><center>All Right Reserved @ NITB ABHI :: 2021  </center></h3>

</body>
</html>

