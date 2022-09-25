

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Feedback System</title>
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
                    
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">Update Notification</label></center>
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
                    String id=request.getParameter("id");
                    Database db=new Database();
                    ResultSet res=db.getNotificationById(Integer.parseInt(id));
                    if(res.next()){
                    
                                    %><br>
                                    <form class="form-horizontal" method="post" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="editNotification"/>
                                    <input type="hidden" name="id" value="<%=id%>"/>
                                        <div class="form-group"> 
                                          <label class="control-label col-sm-4">Title</label>
                                          <div class="col-sm-8"> 
                                              <input type="text" class="form-control" name="title" value="<%=res.getString("title")%>" required="true"/>
                                          </div>
                                        </div>
                                        <div class="form-group"> 
                                          <label class="control-label col-sm-4">Write Description</label>
                                          <div class="col-sm-8"> 
                                              <textarea class="form-control" name="descr" required="true"><%=res.getString("description")%></textarea>
                                          </div>
                                        </div>
                                        <div class="form-group"> 
                                          <div class=" col-sm-12 text-center">
                                            <button type="submit" class="btn btn-success">Update</button>
                                          </div>
                                        </div>
                                    
                                      </form>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    <%@ include file="includes/footer.jsp" %>
    </body>
</html>
