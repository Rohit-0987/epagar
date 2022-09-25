

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
                    <div class="col-md-5">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">Add Salary</label></center>
                                <hr style="margin: 5px">
                                
                                 <%
 Database db=new Database();
                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='text-center' style='color:green'>Salary added successfully!</div>");
                                                    }
                             }
                    catch(Exception e){}
                                    %><br>
                                <form class="form-horizontal" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="addSalary"/>
                                         <div class="form-group"> 
                                          
                                          <div class="col-sm-12"> 
                                          <label class="control-label">Employee</label>
                                          <select class="form-control" name="employee" id="employee" required="true">
                                                  <option value="">Select employee</option>
                                                  <%
                                                    ResultSet resy=db.getEmployees();
                                                    while(resy.next()){
                                                    %>
                                                    <option value="<%=resy.getInt("id")%>"><%=resy.getString("name")%></option>
                                                    <%
                                                        }
                                                    %>
                                              </select>
                                        </div>
                                              <div class="col-sm-12 bankdetails">
                                                  
                                              </div>
                                         </div>
                                              <div class="col-sm-12"> 
                                        <div class="form-group"> 
                                          <label class="control-label">Select Month</label>
                                          <select class="form-control" name="month" required>
                                              <option value="January">January</option>
                                              <option value="February">February</option>
                                              <option value="March">March</option>
                                              <option value="April">April</option>
                                              <option value="May">May</option>
                                              <option value="June">June</option>
                                              <option value="July">July</option>
                                              <option value="August">August</option>
                                              <option value="September">September</option>
                                              <option value="October">October</option>
                                              <option value="November">November</option>
                                              <option value="December">December</option>
                                          </select>
                                        </div>
                                              </div>
                                         <div class="col-sm-12"> 
                                        <div class="form-group"> 
                                          <label class="control-label">Select Date</label>
                                          <input type="date" class="form-control" name="date" required>
                                        </div>
                                              </div>
                                               <div class="col-sm-12"> 
                                        <div class="form-group"> 
                                          <label class="control-label">Amount</label>
                                          <input type="text" class="form-control" name="amount" required>
                                        </div>
                                              </div>
                                               <div class="col-sm-12"> 
                                        <div class="form-group"> 
                                          <label class="control-label">Deduction</label>
                                          <input type="text" class="form-control" name="deduction" required>
                                        </div>
                                              </div>
                                          <div class="col-sm-12"> 
                                        <div class="form-group"> 
                                          <label class="control-label">Salary</label>
                                          <input type="text" class="form-control" name="salary" required>
                                        </div>
                                              </div>
                                        <div class="form-group"> 
                                          <div class=" col-sm-12 text-center">
                                            <button type="submit" class="btn btn-success">Submit</button>
                                            <button type="reset" class="btn btn-warning">Reset</button>
                                          </div>
                                        </div>
                                         
                                    
                                      </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">Employee Payments</label></center>
                                <hr style="margin: 5px">
                                 <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='text-center' style='color:red'>Complaint deleted successfully!</div>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                <table class="table">
                                    <tr>
                                        <th>Sr.No.</th><th>Employee Name</th><th>Month</th><th>Date</th><th>Amount</th><th>Deduction</th>
                                        <th>Salary</th>
                                    </tr>
                                    <%
                                    ResultSet rs=db.getEmployeePayments();
                                    int i=1;
                                    while(rs.next())
                                    {
                                        int brid=rs.getInt("employee_id");
                                        ResultSet employee= db.getEmployeeById(brid);
                                        if(employee.next()){
                                    %>
                                    <tr>
                                        <td><%=i++%></td><td><%=employee.getString("name")%> </td><td><%=rs.getString("month")%></td><td><%=rs.getString("date")%></td><td><%=rs.getString("amount")%></td>
                                        <td><%=rs.getString("deduction")%></td><td><%=rs.getString("salary")%></td>
                                    </tr>
                                    <%
                                        }
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
<script>
    $("#employee").change(function(){
        $.ajax({
                url:"includes/WebService.jsp",
                method:"POST",
                data:{"action":"getbankdetails","empid":this.value},
                success:function(res){
                    console.log(res);
                    $(".bankdetails").html(res);
                },
                error:function(res){
                    console.log(res);
                }
            });
    });
    </script>