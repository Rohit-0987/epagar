
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
                    <div class="col-md-12"><br></div>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">Update Employee Details</label></center>
                                  <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='text-center' style='color:green'>Employee details updated successfully!</div>");
                                                    }
                                                    
                             }
                    catch(Exception e){}
                    
String id=request.getParameter("id");
                    ResultSet res=db.getEmployeeById(Integer.parseInt(id));
                    if(res.next()){
                                    %>
                                
                                <form class="form-horizontal" action="includes/WebService.jsp">
                                <input type="hidden" value="edit-employee" name="action"/>
                                <input type="hidden" value="<%=id%>" name="efid"/>
                                <hr style="margin: 5px">
                                <br>
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px;  margin-bottom: 10px;">
                                    <b>Personal Details</b>
                                </div><br><br>
                                
                                <div class="col-md-3">
                                    <label>Name</label>
                                    <input type="text" class="form-control" value="<%=res.getString("name")%>" name="name" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Address</label>
                                    <input type="text" class="form-control" value="<%=res.getString("address")%>" name="address" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Mobile no</label>
                                    <input type="text" class="form-control" name="mobno" value="<%=res.getString("mobile")%>" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Email ID</label>
                                    <input type="email" class="form-control" name="email" value="<%=res.getString("email")%>" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px; margin-bottom: 10px;">
                                    <b>Other Details</b>
                                </div><br><br>
                                <div class="col-md-2">
                                    <label>DOB</label>
                                    <input type="date" class="form-control" name="dob" value="<%=res.getString("dob")%>" required="true" style="margin-bottom:5px;"/>
                                </div>
                                <div class="col-md-3">
                                    <label>Department</label>
                                    <select class="form-control" required="true" name="department">
                                        <option value="">Select Department</option>
                                        <%
                                            int branchid=res.getInt("department_id");
                                        ResultSet ress=db.getDepartments();
                                        while(ress.next()){
                                            int brid=ress.getInt("id");
                                        
                                        %>
                                        <option value="<%=ress.getInt("id")%>" <% if(branchid==brid) out.println("selected");  %>><%=ress.getString("name")%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                               
                                    
                                 <div class="col-md-2">
                                    <label>Designation</label>
                                   <input type="text" class="form-control" name="designation" value="<%=res.getString("designation")%>" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Password</label>
                                    <input type="password" class="form-control" required="true" value="<%=res.getString("password")%>" name="password" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-12">
                                    <br><br>
                                    <div class="form-group"> 
                                          <div class=" col-sm-12 text-center">
                                            <button type="submit" class="btn btn-success">Update</button>
                                          </div>
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
