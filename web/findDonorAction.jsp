<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="fd.jsp"%>
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
            <th>Donor Name</th>
            <th>Blood Group</th>
            <th>Email</th>
            <th>Contact No</th>
            <th>State</th>
            <th>PinCode</th>
            
        </tr>
        <tr>
            <%
                String bgrp=request.getParameter("bloodgroup");
                String ip=request.getParameter("searchValue");
                String cond=request.getParameter("searchoption");
                bgrp=bgrp.trim();
                ip=ip.trim();
                cond=cond.trim();
                String query="";
                if(cond.equals("bc"))
                    query="select * from donor where b_group='"+bgrp+"' and city='"+ip+"'";
                else if(cond.equals("bs"))
                    query="select * from donor where b_group='"+bgrp+"' and state='"+ip+"'";
                else if(cond.equals("bp"))
                    query="select * from donor where b_group='"+bgrp+"' and pincode='"+ip+"'";
                else if(cond.equals("na"))
                    query="select * from donor where b_group='"+bgrp+"'";
             try
             {
                Connection con=ConnectionProvider.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery(query);
                 while(rs.next())
                 {
                     System.out.println("While Lopp Checking");
                   %>
                   <td><%=rs.getString(2) %></td>
                   <td><%=rs.getString(6)%></td>
                   <td><%=rs.getString(10)%></td>
                   <td><%=rs.getString(9)%></td>
                   <td><%=rs.getString(11)%></td>
                   <td><%=rs.getInt(13)%></td>
        </tr>
                   <%
                       }
   %>
   <%
             }
      catch(Exception ex)
{
System.out.println("Error in Find  donor Action :"+ex);
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