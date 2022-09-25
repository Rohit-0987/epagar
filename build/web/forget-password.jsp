

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
        <%@ include file="includes/header.jsp" %>
        
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br>
                    <%
                        
                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("0"))
                                                    {
                                                        out.println("<p style='color:red; text-align:center;'>Username/password invalid.</p>");
                                                    }
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<p style='color:red; text-align:center;'>Email id does not exist.</p>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-lg-5">
                        <div class="panel">
                            <div class="panel-body" style="border:1px solid #1a5ef5; color:#000; border-radius: 50px">
                                <center><label style="font-size: 20px; color:#000 ">Forget Password?</label></center>
                                <hr>
                                <form class="form-horizontal" method="post" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="forgetuser"/>
                               
                                <div class="form-group">
                                  <label class="control-label col-sm-2">Email:</label>
                                  <div class="col-sm-10">
                                      <input type="text" class="form-control" name="uname" placeholder="Enter email id">
                                  </div>
                                </div>
                                <div class="form-group"> 
                                  <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                    <button type="reset" class="btn btn-warning">Cancel</button>
                                  </div>
                                </div>
                              </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="panel">
                            <div class="panel-body" style="border:1px solid #1a5ef5 ; border-radius: 50px; color:#000;">
                                <center><label style="font-size: 20px; color:#000 ">Notifications</label></center>
                                <hr>
                                <marquee direction="up"  height="300px">
                                     <%
                                    Database db=new Database();
                                    ResultSet rs=db.getNotifications();
                                    while(rs.next())
                                    {
                                    %>
                                    <div class="col-md-12">
                                        <label><%=rs.getString("title")%></label>
                                        <p><%=rs.getString("description")%></p>
                                        <hr>
                                    </div>
                                   <%
                                    }
                                    %>
                                </marquee>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
    </body>
</html>
