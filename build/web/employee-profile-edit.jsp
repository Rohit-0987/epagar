

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
         <%@ include file="includes/employee-header.jsp" %>
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
        String uselogid=(String)session.getAttribute("userlogin");
        Database db=new Database();
                    ResultSet res=db.getEmployeeById(Integer.parseInt(uselogid));
                    if(res.next()){
        %>
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br><br></div>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">Update Profile</label></center>
                                <form class="form-horizontal" action="includes/WebService.jsp">
                                <input type="hidden" value="edit-employee-profile" name="action"/>
                                <input type="hidden" value="<%=uselogid%>" name="efid"/>
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
                                    <input type="text" class="form-control" name="mobno" value="<%=res.getString("mobile")%>" minlength="10" maxlength="10" required="true" style="margin-bottom:5px;"/>
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
                                
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px;  margin-bottom: 10px;">
                                    <b>Bank Details</b>
                                </div><br><br>
                                
                                <div class="col-md-3">
                                    <label>Bank Name</label>
                                    <input type="text" class="form-control" value="<%=res.getString("bank_name")%>" name="bank_name" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Account Number</label>
                                    <input type="number" class="form-control" value="<%=res.getString("acc_no")%>" name="acc_no" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>IFSC Code</label>
                                    <input type="text" class="form-control" value="<%=res.getString("ifsc_code")%>" name="ifsc_code" required="true" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-12">
                                    <br><br>
                                    <div class="form-group"> 
                                          <div class=" col-sm-12 text-center">
                                            <button type="submit" class="btn btn-success">Update</button>
                                            <button type="reset" class="btn btn-warning">Cancel</button>
                                          </div>
                                        </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
                    <%@ include file="includes/footer.jsp" %>
    </body>
</html>
