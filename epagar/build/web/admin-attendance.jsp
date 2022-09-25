<%-- 
    Document   : index
    Created on : 13 Jan, 2020, 10:37:59 PM
    Author     : akshay
--%>

<%@page import="database.Database"%>
<%@page import="java.sql.ResultSet"%>
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
                <div class="">
                    <div class="col-md-12">
                        <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='text-center' style='color:green'>Attendance added successfully!</div>");
                                                    }
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='text-center' style='color:red;'>Attendance deleted successfully!</div>");
                                                    }
                                                    
                             }
                    catch(Exception e){}
                                    %>
                        <form action="includes/WebService.jsp" method="POST">
                            <input type="hidden" name="action" value="setempattendance"/>
                        <center><label style="font-size: 20px; color:#000 ">Attendance</label></center>
                                <hr style="margin: 5px">
                                <div class="col-sm-2"></div>
                               
                                        <div class="col-sm-2 text-center">
                                            <lable>Employee</lable>
                                            <select class="form-control" id="employee" name="employee">
                                             <option value="">Select Employee</option>
                                            <%
                                                Database db=new Database();
                                            ResultSet resy=db.getEmployees();
                                            while(resy.next()){
                                            %>
                                            <option value="<%=resy.getInt("id")%>"><%=resy.getString("name")%></option>
                                            <%
                                                }
                                            %>
                                            </select>
                                        </div>
                                        <div class="col-sm-2 text-center">
                                            <lable>Select date</lable>
                                            <input type="date" class="form-control" name="date" required/>
                                        </div>
                                        <div class="col-sm-2 text-center">
                                            <lable>Select status</lable>
                                            <select class="form-control" name="status" required>
                                                <option value="Present">Present</option>
                                                <option value="Absent">Absent</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-2 text-center">
                                            <br>
                                            <button type="submit" class="btn btn-success">Submit</button>
                                        </div>
                        </form>
                                    </div>
                            <div class="col-md-12">
                                <br>
                                <table class="table">
                                    <tr>
                                        <th>Sr.No.</th><th>Employee name</th><th>Date</th><th>Status</th><th>Action</th>
                                    </tr>
                                     <%
                                         int i=1;
                                    ResultSet rs=db.getAttendance();
                                    while(rs.next())
                                    {
                                        int employee_id=rs.getInt("employee_id");
                                        ResultSet employee= db.getEmployeeById(employee_id);
                                        employee.next();
                                    %>
                                    <tr>
                                        <td><%=i++%></td><td><%=employee.getString("name")%></td><td><%=rs.getString("date")%></td><td><%=rs.getString("status")%></td>
                                    <td>
                                            <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post">
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="table" value="attendence"/>
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
            </div>
            <%@ include file="includes/footer.jsp" %>
    </body>
</html>
