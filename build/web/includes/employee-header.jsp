                    <%
                        String uri = request.getRequestURI();
                        String pageName = uri.substring(uri.lastIndexOf("/")+1);
                    %>
                    
             <div class=""  style=" display: inline-block; width: 100%;     background-color: #fffde8;">
            <div class="col-md-4">
                <!--<center><img src="images/dte_logo.gif" style="width: 100px"/></center>-->
            </div>
            <div class="col-md-5">
                <center>
                    <h3><b>Online E-Pagar System</b></h3>
            </div>
            <div class="col-md-4"></div>
        </div>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li class='<% if(pageName.equals("employee-home.jsp")){ out.println("active"); } %>'><a href="employee-home.jsp">Home</a></li>
                    <li class='<% if(pageName.equals("employee-files.jsp")){ out.println("active"); } %>'><a href="employee-files.jsp">Files</a></li>
                    <li class='<% if(pageName.equals("employee-profile.jsp")){ out.println("active"); } %>'><a href="employee-profile.jsp">Profile</a></li>
                    <li class='<% if(pageName.equals("employee-notifications.jsp")){ out.println("active"); } %>'><a href="employee-notifications.jsp">Notifications</a></li>
                    <li class='<% if(pageName.equals("employee-attendance.jsp")){ out.println("active"); } %>'><a href="employee-attendance.jsp">Attendance</a></li>
                    <li class='<% if(pageName.equals("employee-payment.jsp")){ out.println("active"); } %>'><a href="employee-payment.jsp">Payment</a></li>
                    <li class=''><a href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </nav>
                   
                    
