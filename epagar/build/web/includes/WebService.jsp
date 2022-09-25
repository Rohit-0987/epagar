<%-- 
    Document   : WebService
    Created on : Jan 26, 2018, 10:30:10 AM
    Author     : Brothers
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.InputStream"%>
<%
    Database db=new Database();
//    sendSMS sms=new sendSMS();
    String action=request.getParameter("action");
    System.out.println(action);
    switch(action){
        case "loginuser":
            try{
            String username=request.getParameter("uname");
            String password=request.getParameter("pass");       
            
                String stch=db.checkEmployeeLogin(username, password);
                if(stch.equals("0")){
                   response.sendRedirect("../index.jsp?status=0");
                }else{
//                    session.setAttribute("usertype","employee");
                    session.setAttribute("userlogin",stch);
                    response.sendRedirect("../employee-home.jsp"); 
                }
            }
            catch(Exception e){
                response.sendRedirect("../index.jsp?status=0");
            }
            break;
        case "adminlogin":
            String username1=request.getParameter("uname");
            String password1=request.getParameter("pass");            
            boolean resuser1=db.checkAdminLogin(username1, password1);
            if(resuser1){
                session.setAttribute("adminlogin","admin");
                response.sendRedirect("../admin-home.jsp");
            }else{
                
                response.sendRedirect("../admin-login.jsp?status=0");
            }
            break;
        case "addNotification":
            String title=request.getParameter("title");
            String descr=request.getParameter("descr"); 
            boolean resuserpro=db.addNotification(title,descr);
            if(resuserpro){
                response.sendRedirect("../admin-notifications.jsp?status=1");
            }else{
                response.sendRedirect("../admin-notifications.jsp?status=0");
            }
            break;
        case "editNotification":
            String etitle=request.getParameter("title");
            String edescr=request.getParameter("descr");
            String edid=request.getParameter("id");
            boolean eresuserpro=db.editNotification(Integer.parseInt(edid),etitle,edescr);
            if(eresuserpro){
                response.sendRedirect("../admin-notifications.jsp?status=2");
            }else{
                response.sendRedirect("../admin-notifications.jsp?status=0");
            }
            break;
        case "addSalary":
            int employee=Integer.parseInt(request.getParameter("employee"));
            String month=request.getParameter("month");
            String sadate=request.getParameter("date");
            String amount=request.getParameter("amount");
            String deduction=request.getParameter("deduction");
            String salary=request.getParameter("salary");
            boolean fresuserpro=db.addSalary(employee,month,sadate,amount,deduction,salary);
            if(fresuserpro){
                response.sendRedirect("../admin-payment.jsp?status=1");
            }else{
                response.sendRedirect("../admin-payment.jsp?status=0");
            }
            break;
        case "editFacNotification":
            String fetitle=request.getParameter("title");
            String fedescr=request.getParameter("descr");
            String fedid=request.getParameter("id");
            boolean feresuserpro=db.editNotification(Integer.parseInt(fedid),fetitle,fedescr);
            if(feresuserpro){
                response.sendRedirect("../faculty-notifications.jsp?status=2");
            }else{
                response.sendRedirect("../faculty-notifications.jsp?status=0");
            }
            break;
        case "delete":
            String table=request.getParameter("table");
            String did=request.getParameter("id");
            boolean dreds=db.delete(table,Integer.parseInt(did));
            if(dreds){
                if(table.equals("notification")){
                    response.sendRedirect("../admin-notifications.jsp?status=3");
                }else if(table.equals("attendence")){
                    response.sendRedirect("../admin-attendance.jsp?status=2");
                }else if(table.equals("employee")){
                    response.sendRedirect("../admin-employees.jsp?status=2");
                }else if(table.equals("files")){
                    response.sendRedirect("../admin-files.jsp?status=2");
                }
                
            }else{
                response.sendRedirect("../admin-notifications.jsp?status=0");
            }
            break;
          case "getfacultybybranch":
            String branchid=request.getParameter("branchid");
            ResultSet resbf=db.getFacultyByBranchId(Integer.parseInt(branchid));
            String ot="<option value=''>Select option</option>";
            while(resbf.next()){
                ot+="<option value='"+resbf.getString("id")+"'>"+resbf.getString("name")+"</option>";
            }
            out.println(ot);
            break;
          case "addfacultysubject":
            String yearsem1=request.getParameter("yearsem");
            String brid=request.getParameter("branch");
            String faculty_id=request.getParameter("faculty");
            String subject=request.getParameter("subject");
            boolean rr=db.addfacultysubject(Integer.parseInt(yearsem1),Integer.parseInt(brid),Integer.parseInt(faculty_id),subject);
            if(rr){
                response.sendRedirect("../admin-faculty-subjects.jsp?status=1");
            }else{
                response.sendRedirect("../admin-faculty-subjects.jsp?status=0");
            }
            break;
          case "deleteall":
            String atable=request.getParameter("table");
            String adid=request.getParameter("id");
            boolean adreds=db.delete(atable,Integer.parseInt(adid));
            if(adreds){
                if(atable.equals("complaints")){
                    response.sendRedirect("../admin-complaints.jsp?status=2");
                }
                else if(atable.equals("notification")){
                    response.sendRedirect("../faculty-notifications.jsp?status=3");
                }
                
            }else{
                response.sendRedirect("../admin-notifications.jsp?status=0");
            }
            break;
          case "setempattendance":
            int atemployeeid=Integer.parseInt(request.getParameter("employee"));
            String atdate=request.getParameter("date");
            String atstatus=request.getParameter("status");
            
            boolean sres=db.addAttendance(atemployeeid,atdate,atstatus);
            if(sres){
                response.sendRedirect("../admin-attendance.jsp?status=1");
            }else{
                response.sendRedirect("../admin-attendance.jsp?status=0");
            }
            break;
          case "edit-student":
            String esname=request.getParameter("name");
            String eaddress=request.getParameter("address");
            String emobno=request.getParameter("mobno");
            String eemail=request.getParameter("email");
            String edob=request.getParameter("dob");
            String ebranch=request.getParameter("branch");
            String eyearsem=request.getParameter("yearsem");
            String eenrollno=request.getParameter("enrollno");
            String eses=request.getParameter("session");
            String uspassword=request.getParameter("password");
            int esid=Integer.parseInt(request.getParameter("esid"));
            
            boolean esres=db.udpateStudent(esid,esname,eaddress,emobno,eemail,edob,ebranch,eyearsem,eenrollno,eses,uspassword);
            if(esres){
                response.sendRedirect("../admin-student-edit.jsp?status=1&id="+esid);
            }else{
                response.sendRedirect("../admin-student-edit.jsp?status=0&id="+esid);
            }
            break;
          case "add-employee":
            String fsname=request.getParameter("name");
            String faddress=request.getParameter("address");
            String fmobno=request.getParameter("mobno");
            String femail=request.getParameter("email");
            String fdob=request.getParameter("dob");
            String fbranch=request.getParameter("department");
            String fdesignation=request.getParameter("designation");
            String fpass=request.getParameter("password");
            
            boolean fres=db.addEmployee(fsname,faddress,fmobno,femail,fdob,fbranch,fdesignation,fpass);
            if(fres){
                response.sendRedirect("../admin-employees.jsp?status=1");
            }else{
                response.sendRedirect("../admin-employee-add.jsp?status=0");
            }
            break;
          case "edit-employee":
            String efsname=request.getParameter("name");
            String efaddress=request.getParameter("address");
            String efmobno=request.getParameter("mobno");
            String efemail=request.getParameter("email");
            String efdob=request.getParameter("dob");
            String efbranch=request.getParameter("department");
            String efdesignation=request.getParameter("designation");
            String efpass=request.getParameter("password");
            int efid=Integer.parseInt(request.getParameter("efid"));
            
            boolean efres=db.updateEmployee(efid,efsname,efaddress,efmobno,efemail,efdob,efbranch,efdesignation,efpass);
            if(efres){
                response.sendRedirect("../admin-employee-edit.jsp?status=1&id="+efid);
            }else{
                response.sendRedirect("../admin-employee-edit.jsp?status=0&id="+efid);
            }
            break;
        case "changepass":
            String currpass=request.getParameter("currpass"); 
            String npwd=request.getParameter("newpass");
            String confpass=request.getParameter("confpass");
            if(confpass.equals(npwd)){
                int userpro=db.update_delete("update admin set password='"+npwd+"' where password='"+currpass+"'");
                if(userpro==1){
                    response.sendRedirect("../admin-password.jsp?status=1");
                }else{
                    response.sendRedirect("../admin-password.jsp?status=0");
                }
            }else{
                response.sendRedirect("../admin-password.jsp?status=2");
            }
           
            break;
          case "changestudpass":
            String scurrpass=request.getParameter("currpass"); 
            String snpwd=request.getParameter("newpass");
            String sconfpass=request.getParameter("confpass");
            String suselogid=(String)session.getAttribute("userlogin");
                if(sconfpass.equals(snpwd)){
                int userpro=db.update_delete("update student set password='"+snpwd+"' where password='"+scurrpass+"' and id="+Integer.parseInt(suselogid));
                if(userpro==1){
                    response.sendRedirect("../student-profile.jsp?status=1");
                }else{
                    response.sendRedirect("../student-profile.jsp?status=0");
                }
            }else{
                response.sendRedirect("../student-profile.jsp?status=2");
            }
           
            break;
          case "changefacpass":
            String fcurrpass=request.getParameter("currpass"); 
            String fnpwd=request.getParameter("newpass");
            String fconfpass=request.getParameter("confpass");
            String fuselogid=(String)session.getAttribute("userlogin");
                if(fconfpass.equals(fnpwd)){
                int userpro=db.update_delete("update employee set password='"+fnpwd+"' where password='"+fcurrpass+"' and id="+Integer.parseInt(fuselogid));
                if(userpro==1){
                    response.sendRedirect("../faculty-profile.jsp?status=1");
                }else{
                    response.sendRedirect("../faculty-profile.jsp?status=0");
                }
            }else{
                response.sendRedirect("../faculty-profile.jsp?status=2");
            }
           
            break;
          case "addtimer":
            String tyearsem=request.getParameter("yearsem");
            String tbranch=request.getParameter("branch");
            String date=request.getParameter("date");
            String time=request.getParameter("time");
            String tsession=request.getParameter("session");
            
            boolean tres=db.addTimer(tyearsem,tbranch,date,time,tsession);
            if(tres){
                response.sendRedirect("../admin-timer.jsp?status=1");
            }else{
                response.sendRedirect("../admin-timer.jsp?status=0");
            }
            break;
          
          case "setemployeidesession":
                String empid=request.getParameter("employeeid");
                session.setAttribute("empid",empid);
                System.out.println(session.getAttribute("empid"));
                out.println(1); 
            break;
          case "addfacmsg":
            String fmsg=request.getParameter("msg");
            int facmid=Integer.parseInt((String)session.getAttribute("userlogin"));
            
            boolean mfres=db.addFacMsg(fmsg,facmid);
            if(mfres){
                response.sendRedirect("../faculty-home.jsp?status=1");
            }else{
                response.sendRedirect("../faculty-home.jsp?status=0");
            }
            break;
          case "addadminmsg":
            String afmsg=request.getParameter("msg");
            int afacid=Integer.parseInt(request.getParameter("fid"));
            
            boolean afres=db.addAdminMsg(afmsg,afacid);
            if(afres){
                response.sendRedirect("../admin-message.jsp?id="+afacid);
            }else{
                response.sendRedirect("../admin-message.jsp?id="+afacid);
            }
            break;
         
        case "forgetuser":
            String fgemail=request.getParameter("uname");
            String otp=db.getRandomNumberString();
            
                String gm=db.checkEmployeeEmailExist(fgemail);
                if(gm!=null){
                    session.setAttribute("otp", otp);
                    System.out.println(otp);
//                    sms.sendSms(gm, "Your One Time Password (OTP) is "+otp+". Create your new password.");
                    response.sendRedirect("../forget-password-otp.jsp?fusertype=employee&fgemail="+fgemail);
                }else{
                    response.sendRedirect("../forget-password.jsp?status=2");
                }
            
            
            break;
        case "otpverifyandsubmit":
            String usertype=request.getParameter("usertype"); 
            String vemail=request.getParameter("email");
            String votp=request.getParameter("otp");
            String newpassword=request.getParameter("newpassword");
            String confpassword=request.getParameter("confpassword");
            String sessotp=(String)session.getAttribute("otp");
            if(votp.equals(sessotp)){
                if(newpassword.equals(confpassword)){
                    if(usertype.equals("student")){
                           
                    }else{
                            db.update_delete("update employee set password='"+newpassword+"' where email='"+vemail+"'");
                            response.sendRedirect("../index.jsp?status=2");
                    }
                }else{
                response.sendRedirect("../forget-password-otp.jsp?status=3&fusertype="+usertype+"&fgemail="+vemail);
                }
            }else{
                response.sendRedirect("../forget-password-otp.jsp?status=0&fusertype="+usertype+"&fgemail="+vemail);
            }
            
            break;
            
        case "addfeedback":
            int timerid=Integer.parseInt(request.getParameter("timerid")); 
            int uselogid1=Integer.parseInt((String)session.getAttribute("userlogin"));
            
            int feedbackid=db.addFeedback(uselogid1,timerid);
            if(feedbackid>0){
                String[] facsubjids=request.getParameterValues("facsubjid[]");
                String[] firsts=request.getParameterValues("first[]");
                String[] seconds=request.getParameterValues("second[]");
                String[] thirds=request.getParameterValues("third[]");
                String[] fourths=request.getParameterValues("fourth[]");
                String[] fifths=request.getParameterValues("fifth[]");
                int tot=facsubjids.length;
                for(int i=0;i<tot;i++){
                        int fabsubid=Integer.parseInt(facsubjids[i]);
                        int first=Integer.parseInt(firsts[i]);
                        int second=Integer.parseInt(seconds[i]);
                        int third=Integer.parseInt(thirds[i]);
                        int fourth=Integer.parseInt(fourths[i]);
                        int fifth=Integer.parseInt(fifths[i]);
                        db.update_delete("insert into feedback_details (feedback_id,faculty_subjects_id,first,second,third,fourth,fifth) VALUES ("+feedbackid+","+fabsubid+","+first+","+second+","+third+","+fourth+","+fifth+")");
                }
                response.sendRedirect("../student-feedback.jsp?status=1");
            }else{
                response.sendRedirect("../student-feedback.jsp?status=0");
            }
            
            break;
         case "getBranchesByYearSemId":
            int yearsemid=Integer.parseInt(request.getParameter("yearsemid"));
            ResultSet dbdata=db.selectAll("select DISTINCT(branch_id) as branchid from faculty_subjects where year_sem_id="+yearsemid);
            out.println("<option value=''>Select Branch</option>");
            while(dbdata.next()){
                int branchid1=dbdata.getInt("branchid");
                ResultSet rsdbr=db.getDepartmentById(branchid1);
                if(rsdbr.next()){
                    out.println("<option value="+branchid1+">"+rsdbr.getString("name")+"</option>"); 
                }
            }
            break;
          case "getSubjectsByBranchId":
            int yearsemid1=Integer.parseInt(request.getParameter("yearsem"));
            int branchid1=Integer.parseInt(request.getParameter("branch"));
            ResultSet d2bdata=db.selectAll("select * from faculty_subjects where year_sem_id="+yearsemid1+" and branch_id="+branchid1);
            out.println("<option value=''>Select Subject</option>");
            while(d2bdata.next()){
                String subj=d2bdata.getString("subject");
                out.println("<option value="+d2bdata.getInt("id")+">"+subj+"</option>"); 
            }
            break;
        case "searchreviewbyyearsembranchsubject":
            int yearsemid2=Integer.parseInt(request.getParameter("yearsem"));
            int branchid2=Integer.parseInt(request.getParameter("branch"));
            int subjectid2=Integer.parseInt(request.getParameter("subject"));
            ResultSet brdt=db.getDepartmentById(branchid2);
            brdt.next();
            String brname=brdt.getString("name");
            
            ResultSet subdt=db.getSubjectById(subjectid2);
            subdt.next();
            String subjname=subdt.getString("subject");
            
            int totstud=0;
            try{
                ResultSet d3bdata=db.selectAll("select count(*) as totstud from student where status=1 and year_sem_id="+yearsemid2+" and branch_id="+branchid2);
                d3bdata.next();
                totstud= d3bdata.getInt("totstud");
            }catch(Exception e){
                totstud=0;
            }
            int totfeed=0;
            try{
                ResultSet d4bdata=db.selectAll("select count(*) as totfeed from feedback_details where faculty_subjects_id="+subjectid2);
                d4bdata.next();
                totfeed=d4bdata.getInt("totfeed");
            }
            catch(Exception e){
                totfeed=0;
            }
            int totpresent=totfeed/totstud*100;
            int remain=100-totpresent;
            response.sendRedirect("../admin-reviews.jsp?totpresent="+totpresent+"&remain="+remain+"&subjname="+subjname+"&brname="+brname);
            break;
          case "getSubjectsByYearSemId":
            int yearsemid5=Integer.parseInt(request.getParameter("yearsemid"));
            int facid5=Integer.parseInt((String)session.getAttribute("userlogin"));
            ResultSet d5bdata=db.selectAll("select * from faculty_subjects where year_sem_id="+yearsemid5+" and faculty_id="+facid5);
            out.println("<option value=''>Select Subject</option>");
            while(d5bdata.next()){
                String subj=d5bdata.getString("subject");
                out.println("<option value="+d5bdata.getInt("id")+">"+subj+"</option>"); 
            }
            break;
//        case "updateservicepwd":
//            int servid=Integer.parseInt((String)session.getAttribute("servicelogin"));
//            String pwds=request.getParameter("pwd"); 
//            String npwds=request.getParameter("npwd");
//            int userpros=db.update_delete("update user set password='"+npwds+"' where password='"+pwds+"' and id="+servid);
//            if(userpros>0){
//                response.sendRedirect("../service-pwd.jsp?status=1");
//            }else{
//                response.sendRedirect("../service-pwd.jsp?status=0");
//            }
//            break;
//         case "postfood":
//            String sertype=request.getParameter("sertype");
//            String messtype=request.getParameter("messtype");
//            String sernm=request.getParameter("sernm");
//            String cost=request.getParameter("cost");
//            String prod=request.getParameter("prod");
//            int us=Integer.parseInt((String)session.getAttribute("servicelogin"));
//            
//            int resfoodintert=db.insert_update_delete("insert into food_service (`service_name`, `products`, `messtype`, `price`, `service_id`, `status`, `image`) VALUES ('"+sernm+"','"+prod+"','"+messtype+"','"+cost+"','"+us+"','1','')");
//            if(resfoodintert>=1){
//               response.sendRedirect("../add-service.jsp?status=1");
//            }
//            break;
//         case "postaccom":
//            String foodfaclility=request.getParameter("foodfaclility");
//            String rentty=request.getParameter("rentty");
//            String otherfac=request.getParameter("otherfac");
//            String costt=request.getParameter("cost");
//            String plimit=request.getParameter("plimit");
//            String pertype=request.getParameter("pertype");
//            String senm=request.getParameter("senm");
//            String accomtype=request.getParameter("accomtype");
//            int us1=Integer.parseInt((String)session.getAttribute("servicelogin"));
//            
//            int resaccomintert=db.insert_update_delete("insert into accommodation_service (`service_name`, `accomm_type`, `per_limit`, `facility`, `pertype`, `food_facility`, `price`, `image`,`service_id`, `status`, `renttype`) VALUES ('"+senm+"','"+accomtype+"','"+plimit+"','"+otherfac+"','"+pertype+"','"+foodfaclility+"','"+costt+"','','"+us1+"','1','"+rentty+"')");
//            if(resaccomintert>=1){
//               response.sendRedirect("../add-service.jsp?status=1");
//            }
//            break;
//        case "postcarp":
//            String charge=request.getParameter("charge");
//            String endroot=request.getParameter("endroot");
//            String startroot=request.getParameter("startroot");
//            String seats=request.getParameter("seats");
//            String sernmm=request.getParameter("sernm");
//            String veh=request.getParameter("veh");
//            int us2=Integer.parseInt((String)session.getAttribute("servicelogin"));
//            
//            int rescarpintert=db.insert_update_delete("insert into carpooling_service (`service_name`, `vehical_type`, `seats`, `start_r`, `end_r`, `price`, `service_id`, `image`,`status`) VALUES ('"+sernmm+"','"+veh+"','"+seats+"','"+startroot+"','"+endroot+"','"+charge+"','"+us2+"','','1')");
//            if(rescarpintert>=1){
//               response.sendRedirect("../add-service.jsp?status=1");
//            }
//            break;
    }
    %>
