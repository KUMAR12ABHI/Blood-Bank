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
    
<center>
    <table id="customers">
        <tr>
            <th>Id</th>
            <th>Blood Group</th>
            <th>Unit</th>
            <th>Date Of Donating</th>
        </tr>
        <tr>
            <%
             try
             {
                 Connection conn=ConnectionProvider.getConnection();
                 Statement st=conn.createStatement();
                 ResultSet rs=st.executeQuery("select * from blood");
                 while(rs.next())
                 {
                     System.out.println("While Lopp Checking");
                   %>
                   <td><%=rs.getInt(1) %></td>
                   <td><%=rs.getString(2)%></td>
                   <td><%=rs.getInt(3)%></td>
                   <td><%=rs.getDate(4)%></td>
        </tr>
                   <%
                       }
             }
      catch(Exception ex)
{
System.out.println("Error in Blood donate Deatils :"+ex);
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