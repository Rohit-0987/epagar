<%-- 
    Document   : index
    Created on : 13 Jan, 2020, 10:37:59 PM
    Author     : akshay
--%>

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
                                <center><label style="font-size: 20px; color:#000 ">My Salary</label></center>
                                <hr style="margin: 5px">
                               
                                <table class="table">
                                    <tr>
                                        <th>Sr.No.</th><th>Amount</th><th>Month</th><th>Date</th>
                                    </tr>
                                    <%
                                    Database db=new Database();
                                    String suselogid=(String)session.getAttribute("userlogin");
                                    ResultSet rs=db.getEmployeePayment(suselogid);
                                    int i=1;
                                    while(rs.next())
                                    {
                                    %>
                                    <tr>
                                        <td><%=i++%></td><td><%=rs.getString("amount")%></td><td><%=rs.getString("month")%></td>
                                        <td><%=rs.getString("date")%></td>
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
