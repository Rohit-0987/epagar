

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
                    <div class="col-md-12"><br>
                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='text-center' style='color:green'>Employee added successfully!</div>");
                                                    }
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='text-center' style='color:red'>Employee deleted successfully!</div>");
                                                    }
                                                    
                             }
                    catch(Exception e){}
                                    %>
                    </div>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">All Employees</label><a href="admin-employee-add.jsp" class="btn btn-primary pull-right btn-sm">Add Employee</a></center>
                                <hr style="margin: 5px">
                                <br>
                                <table class="table">
                                    <tr>
                                        <th>Sr.No.</th><th>Name</th><th>Address</th><th>Mobile no</th><th>Email ID</th><th>DOB</th><th>Department</th><th>Designation</th><th>Action</th>
                                    </tr>
                                    <%
                                    Database db=new Database();
                                    ResultSet rs=db.getEmployees();
                                    try{
                                        while(rs.next())
                                        {
                                            int branchid=rs.getInt("department_id");
                                            ResultSet branch= db.getDepartmentById(branchid);
                                            branch.next();
                                        %>
                                        <tr>
                                            <td><%=rs.getInt("id")%></td><td><%=rs.getString("name")%></td><td><%=rs.getString("address")%></td><td><%=rs.getString("mobile")%></td><td><%=rs.getString("email")%></td><td><%=rs.getString("dob")%></td><td><%=branch.getString("name")%></td><td><%=rs.getString("designation")%></td>
                                            <td>
                                                <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post">
                                                    <a href="admin-employee-edit.jsp?id=<%=rs.getInt("id")%>" class="btn btn-info btn-xs">Edit</a>
                                                        <input type="hidden" name="action" value="delete"/>
                                                        <input type="hidden" name="table" value="employee"/>
                                                        <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                        <button type="submit" class="btn btn-danger btn-xs" >Remove</button>
                                                    </form>
                                            </td>
                                        </tr>
                                        <%
                                        }
                                    }catch(Exception e){

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
