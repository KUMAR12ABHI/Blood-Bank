<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="html/test.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
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
<br>
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
    
<center>
    <table id="customers">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Father Name</th>
            <th>Mother Name</th>
            <th>Gender</th>
            <th>Blood Group</th>
            <th>Date Of Birth</th>
            <th>Weight</th>
            <th>Mobile Number</th>
            <th>Email</th>
            <th>State</th>
            <th>City</th>
            <th>PinCode</th>
            <th>Addresh</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <tr>
            <%
             try
             {
                 Connection conn=ConnectionProvider.getConnection();
                 Statement st=conn.createStatement();
                 ResultSet rs=st.executeQuery("select * from donor");
                 while(rs.next())
                 {
                     System.out.println("While Lopp Checking");
                   %>
                   <td><%=rs.getInt(1) %></td>
                   <td><%=rs.getString(2)%></td>
                   <td><%=rs.getString(3)%></td>
                   <td><%=rs.getString(4)%></td>
                   <td><%=rs.getString(5)%></td>
                   <td><%=rs.getString(6)%></td>
                   <td><%=rs.getDate(7)%></td>
                   <td><%=rs.getInt(8)%></td>
                   <td><%=rs.getString(9)%></td>
                   <td><%=rs.getString(10)%></td>
                   <td><%=rs.getString(11)%></td>
                   <td><%=rs.getString(12)%></td>
                   <td><%=rs.getInt(13)%></td>
                   <td><%=rs.getString(14)%></td>
                   
                       <td><a href="updateDonor.jsp?id=<%=rs.getInt(1)%>">Edit</a></td>
                   <td><a href="deleteDonor.jsp?id=<%=rs.getInt(1)%>">Delete</a></td>
        </tr>
                   <%
                       }
             }
      catch(Exception ex)
{
System.out.println("Error in EditDelete Page :"+ex);
ex.printStackTrace();
}
            %>
                
       
    </table>
</center>





</table>
</center>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @NITB ABHI :: 2021  </center></h3>
</body>
</html>