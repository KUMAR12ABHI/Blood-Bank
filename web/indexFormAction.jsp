<%@page import="in.abhi.bbs.conn.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%
    String name=request.getParameter("name");
    String mobno=request.getParameter("mobilenumber");
    String email=request.getParameter("email");
    String bgroup=request.getParameter("bloodgroup");
    String status="pending";
    String id="DRE";
    try
    {
        Connection conn=ConnectionProvider.getConnection();
        PreparedStatement pst = conn.prepareStatement("select donar_req_seq.NEXTVAL from dual");
        ResultSet rs=pst.executeQuery();
        if(rs.next())
            id=id+rs.getInt(1);
        PreparedStatement ps=conn.prepareStatement("insert into bloodrequest values(?,?,?,?,?,?)");
        ps.setString(1,name);
        ps.setString(2,mobno);
        ps.setString(3,email);
        ps.setString(4,bgroup);
        ps.setString(5,status);
        ps.setString(6,id);
        ps.executeUpdate();
        response.sendRedirect("index.jsp?msg=valid");
        
    }
    catch(Exception ex)
    {
        response.sendRedirect("index.jsp?msg=invalid");
        System.out.println("Error in Inserting Db:"+ex);
    }


%>