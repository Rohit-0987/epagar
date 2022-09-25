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
                    <div class="col-md-12"><br></div>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">My Profile</label></center>
                                <%
                                    String uselogid=(String)session.getAttribute("userlogin");
                                    Database db=new Database();
                                    ResultSet rs=db.getEmployeeById(Integer.parseInt(uselogid));
                                    if(rs.next())
                                    {
                                        int branchid=rs.getInt("department_id");
                                        ResultSet branch= db.getDepartmentById(branchid);
                                        branch.next();
                                    %>
                                <hr style="margin: 5px">
                                <br>
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px;  margin-bottom: 10px;">
                                    <b>Personal Details</b>
                                </div><br><br>
                                
                                <div class="col-md-3">
                                    <label>Name</label>
                                    <p><%=rs.getString("name")%></p>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Address</label>
                                    <p><%=rs.getString("address")%></p>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Mobile no</label>
                                    <p><%=rs.getString("mobile")%></p>
                                </div>
                                
                                
                                
                                <div class="col-md-3">
                                    <label>Email ID</label>
                                    <p><%=rs.getString("email")%></p>
                                </div>
                                
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px; margin-bottom: 10px;">
                                    <b>Professional Details</b>
                                </div><br><br>
                                <div class="col-md-3">
                                    <label>DOB</label>
                                    <p><%=rs.getString("dob")%></p>
                                </div>
                                <div class="col-md-3">
                                    <label>Department</label>
                                    <p><%=branch.getString("name")%></p>
                                </div>
                               
                                
                                <div class="col-md-3">
                                    <label>Designation</label>
                                    <p><%=rs.getString("designation")%></p>
                                </div>
                                 <%
                                    }
                                    %>
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px; margin-bottom: 10px;">
                                    <b>Change Password</b>
                                </div><br>
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
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <form class="form-horizontal" method="post" action="includes/WebService.jsp">
                                        <input type="hidden" value="changefacpass" name="action"/>
                                        <div class="form-group"> 
                                          <label class="control-label col-sm-2">Current Password:</label>
                                          <div class="col-sm-10"> 
                                              <input type="password" class="form-control" name="currpass" required="true" placeholder="Enter current password">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <label class="control-label col-sm-2">New Password:</label>
                                          <div class="col-sm-10"> 
                                            <input type="password" class="form-control"  name="newpass" required="true" placeholder="Enter new password">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <label class="control-label col-sm-2">Confirm Password:</label>
                                          <div class="col-sm-10"> 
                                            <input type="password" class="form-control" name="confpass" required="true" placeholder="Enter confirm password">
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
