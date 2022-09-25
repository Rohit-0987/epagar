

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Pagar</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
      <%@ include file="includes/employee-header.jsp" %>
        
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br><br></div>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">My Notifications</label></center>
                                <hr style="margin: 5px">
                               
                                <table class="table">
                                    <tr>
                                        <th>Sr.No.</th><th>Title</th><th>Description</th>
                                    </tr>
                                    <%
                                    Database db=new Database();
                                    String suselogid=(String)session.getAttribute("userlogin");
                                    ResultSet rs=db.getNotifications();
                                    int i=1;
                                    while(rs.next())
                                    {
                                    %>
                                    <tr>
                                        <td><%=i++%></td><td><%=rs.getString("title")%></td><td><%=rs.getString("description")%></td>
                                        
                                    </tr>
                                    <%
                                    }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                  
                </div>
            </div>
                    <%@ include file="includes/footer.jsp" %>
    </body>
</html>
