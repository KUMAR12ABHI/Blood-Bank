<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="html/test.html"%>
<html>
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

#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 55%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
    <div class="container">
        <br>
         <%
        String msg=request.getParameter("msg");
        if("invalid".equals(msg))
        {
            %>
            <center><font color="green" size="5">Somthing Went Wrong and try again!</center>
            <%
        }
  if("valid".equals(msg))
        {
            %>
            <center><font color="green" size="5">SecuessFully Updated</center>
            <%
        }
if("insuf".equals(msg))
        {
            %>
            <center><font color="green" size="5">Insufisent units/amount </center>
            <%
        }
    %>
            <form action="manageStockAction.jsp"method="post">
                <div class="form-group">
                    <center><h2>Select Blood Group</h2></center>
                    <select name="bloodgroup">
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select>
                    <center><h2>Select Quantity/Amount</h2></center>
                    <select name="quamt">
                        <option value="qunt">Quantity</option>
                        <option value="amt">Amount</option>
                    </select>
                    <center><h2>Select Increase/Decrease</h2></center>
                    <select name="incdec">
                        <option value="inc">Increase</option>
                        <option value="dec">Decrease</option>
                    </select>
                    <center><h2>Units</h2></center>
                    <input type="text"placeholder="Enter Increase/Decrease Value" name="units"required>
                    <center><button type="submit" class="button">Save</button></center>
            </form>
    </div>
                <br>
                <center>
                    <table id="customers">
                        <tr>
                            <th>Blood Group</th>
                            <th>Units</th>
                            <th>Price</th>
                        </tr>
                        <tr>
                            <%
                             try
                             {
                                Connection con=ConnectionProvider.getConnection();
                                Statement st=con.createStatement();
                                ResultSet rs=st.executeQuery("select * from stock");
                                while(rs.next())
                                {
                                    %>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getInt(2)%></td>
                                    <td><%=rs.getInt(3)%></td>
                        </tr>
                                    <%
                                }
                                
                             }
                             catch(Exception ex)
                             {
                                System.out.println("Error in Stock Db:"+ex);
                                 ex.printStackTrace();
                             }
                            %>
                        </tr>
                    </table>
                </center>
        

 
</table>
</center>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ NITB ABHI :: 2021  </center></h3>
</body>
</html>