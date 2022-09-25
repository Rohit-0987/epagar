

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
                    <div class="col-md-12"><br>
                     <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='text-center' style='color:green'>Password Changed successfully!</div>");
                                                    }
                                                    if(status.equals("0"))
                                                    {
                                                        out.println("<div class='text-center' style='color:red'>Current Password Not Exist</div>");
                                                    }
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='text-center' style='color:red'>Confirm password not match.</div>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                    </div>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px; margin-bottom: 10px;">
                                    <b>Change Password</b>
                                </div><br><br>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                    <form class="form-horizontal" action="includes/WebService.jsp">
                                        <input type="hidden" value="changepass" name="action"/>
                                        <div class="form-group"> 
                                          <label class="control-label col-sm-2">Current Password:</label>
                                          <div class="col-sm-10"> 
                                              <input type="password" class="form-control" required="true" name="currpass" placeholder="Enter current password">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <label class="control-label col-sm-2">New Password:</label>
                                          <div class="col-sm-10"> 
                                            <input type="password" class="form-control" required="true" name="newpass" placeholder="Enter password">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <label class="control-label col-sm-2">Confirm Password:</label>
                                          <div class="col-sm-10"> 
                                            <input type="password" class="form-control" required="true" name="confpass" placeholder="Enter confirm password">
                                          </div>
                                        </div>
                                        <div class="form-group"> 
                                          <div class="col-sm-offset-2 col-sm-10 text-center">
                                            <button type="submit" class="btn btn-success">Update</button>
                                            <button type="reset" class="btn btn-warning">Cancel</button>
                                          </div>
                                        </div>
                                    
                                      </form>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    <%@ include file="includes/footer.jsp" %>
    </body>
</html>
