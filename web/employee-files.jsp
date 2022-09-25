
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
                    
                     <div class="panel panel-default">
                            <div class="panel-body">
                            <center><label style="font-size: 20px; color:#000 ">Received Files</label></center>
                            <hr>
                            <div class="col-md-12">
                               <table class="table">
                                    <tr>
                                        <th>Sr.No.</th><th>File</th>
                                    </tr>
                                    <%
                                    Database db=new Database();
                                    String suselogid=(String)session.getAttribute("userlogin");
                                    ResultSet rs=db.getEmployeeFiles(suselogid);
                                    int i=1;
                                    while(rs.next())
                                    {
                                    %>
                                    <tr>
                                        <td><%=i++%></td><td><a href="uploads/<%=rs.getString("file")%>" target="_blank"><%=rs.getString("file")%></a></td>
                                       
                                    </tr>
                                    <%
                                    }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-1"></div>
                </div>
            </div>
                    <%@ include file="includes/footer.jsp" %>
    </body>
</html>