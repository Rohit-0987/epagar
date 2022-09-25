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
        <%@ include file="includes/admin-header.jsp" %>
        
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br><br></div>
                    <div class="col-lg-7">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">Notifications</label></center>
                                <hr style="margin: 5px">
                                <br>
                                 <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='text-center' style='color:green'>Notification updated successfully!</div>");
                                                    }
                                                    if(status.equals("3"))
                                                    {
                                                        out.println("<div class='text-center' style='color:red'>Notification deleted successfully!</div>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                <table class="table">
                                    <tr>
                                        <th>Sr.No.</th><th>Title</th><th>Description</th><th>Action</th>
                                    </tr>
                                    <%
                                    Database db=new Database();
                                    ResultSet rs=db.getNotifications();
                                    while(rs.next())
                                    {
                                    %>
                                        <tr>
                                            <td><%=rs.getInt("id")%></td><td><%=rs.getString("title")%></td><td><%=rs.getString("description")%></td>
                                            <td>
                                                <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post">
                                                <a href="admin-notification-edit.jsp?id=<%=rs.getInt("id")%>" class="btn btn-info btn-xs">Edit</a>
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="table" value="notification"/>
                                                    <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                    <button type="submit" class="btn btn-danger btn-xs" >Remove</button>
                                                </form>
                                                
                                            </td>
                                        </tr>
                                    <%
                                    }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">Add Notification</label></center>
                                <hr style="margin: 5px">
                                
                                 <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='text-center' style='color:green'>Notification added successfully!</div>");
                                                    }
                             }
                    catch(Exception e){}
                                    %><br>
                                <form class="form-horizontal" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="addNotification"/>
                                        <div class="form-group"> 
                                          <label class="control-label col-sm-4">Title</label>
                                          <div class="col-sm-8"> 
                                              <input type="text" class="form-control" name="title" required="true"/>
                                          </div>
                                        </div>
                                        <div class="form-group"> 
                                          <label class="control-label col-sm-4">Write Description</label>
                                          <div class="col-sm-8"> 
                                              <textarea class="form-control" name="descr" required="true"></textarea>
                                          </div>
                                        </div>
                                        <div class="form-group"> 
                                          <div class=" col-sm-12 text-center">
                                            <button type="submit" class="btn btn-success">Submit</button>
                                            <button type="reset" class="btn btn-warning">Cancel</button>
                                          </div>
                                        </div>
                                    
                                      </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    <%@ include file="includes/footer.jsp" %>
    </body>
</html>
