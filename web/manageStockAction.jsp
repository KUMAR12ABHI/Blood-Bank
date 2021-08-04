<%@page import="in.abhi.bbs.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String bloodgroup=request.getParameter("bloodgroup");
String quamt=request.getParameter("quamt");
String incdec=request.getParameter("incdec");
String units=request.getParameter("units");
int units1=Integer.parseInt(units.trim());
try
{
    System.out.println("Bgroup:"+bloodgroup);
    System.out.println("Selection in amt/unit :"+quamt);
    System.out.println("Increase/decrease :"+incdec);
    System.out.println("Units:"+units);
    Connection con=ConnectionProvider.getConnection();
    Statement st=con.createStatement();
   if(quamt.equals("amt"))
   {
       if(incdec.equals("inc"))
    {
        st.executeUpdate("update stock set amount=amount+'"+units1+"'where b_group='"+bloodgroup+"'");
    }
    else
    {
        ResultSet rs=st.executeQuery("select amount from stock where b_group='"+bloodgroup+"'");
        rs.next();
        int amt=rs.getInt(1);
        if(amt<units1)
         response.sendRedirect("manageStock.jsp?msg=insuf");
        else
        st.executeUpdate("update stock set amount=amount-'"+units1+"'where b_group='"+bloodgroup+"'");
    }
    response.sendRedirect("manageStock.jsp?msg=valid");
   }
   else
   {
    if(incdec.equals("inc"))
    {
        st.executeUpdate("update stock set units=units+'"+units1+"'where b_group='"+bloodgroup+"'");
    }
    else
    {
        ResultSet rs=st.executeQuery("select units from stock where b_group='"+bloodgroup+"'");
        rs.next();
        int unt=rs.getInt(1);
        if(unt<units1)
         response.sendRedirect("manageStock.jsp?msg=insuf");
        else
        st.executeUpdate("update stock set units=units-'"+units1+"'where b_group='"+bloodgroup+"'");
    }
    response.sendRedirect("manageStock.jsp?msg=valid");
   }
}
catch(Exception ex)
{
    System.out.println("Error in Updateing Stock Db:"+ex);
    ex.printStackTrace();
    //response.sendRedirect("manageStock.jsp?msg=invalid");
}
%>