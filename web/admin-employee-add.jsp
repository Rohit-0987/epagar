
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%
Database db=new Database();
%>
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
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">Add Employee</label></center>
                                  <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='text-center' style='color:green'>Employee added successfully!</div>");
                                                    }
                                                    
                             }
                    catch(Exception e){}
                                    %>
                                <form class="form-horizontal" action="includes/WebService.jsp">
                                <input type="hidden" value="add-employee" name="action"/>
                                <hr style="margin: 5px">
                                <br>
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px;  margin-bottom: 10px;">
                                    <b>Personal Details</b>
                                </div><br><br>
                                
                                <div class="col-md-3">
                                    <label>Name</label>
                                    <input type="text" class="form-control" name="name" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Address</label>
                                    <input type="text" class="form-control" name="address" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Mobile no</label>
                                    <input type="text" class="form-control" name="mobno" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Email ID</label>
                                    <input type="email" class="form-control" name="email" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px; margin-bottom: 10px;">
                                    <b>Other Details</b>
                                </div><br><br>
                                <div class="col-md-2">
                                    <label>DOB</label>
                                    <input type="date" class="form-control" name="dob" required="true" style="margin-bottom:5px;"/>
                                </div>
                                <div class="col-md-3">
                                    <label>Department</label>
                                    <select class="form-control" required="true" name="department">
                                        <option value="">Select Department</option>
                                        <%
                                        ResultSet res=db.getDepartments();
                                        while(res.next()){
                                        %>
                                        <option value="<%=res.getInt("id")%>"><%=res.getString("name")%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                    
                                 <div class="col-md-2">
                                    <label>Designation</label>
                                   <input type="text" class="form-control" name="designation" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Password</label>
                                    <input type="password" class="form-control" required="true" name="password" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-12">
                                    <br><br>
                                    <div class="form-group"> 
                                          <div class=" col-sm-12 text-center">
                                            <button type="submit" class="btn btn-success">Submit</button>
                                          </div>
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
