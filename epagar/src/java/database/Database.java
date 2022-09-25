/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package database;
import java.io.InputStream;
import java.sql.*;
import java.text.DateFormat;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;
import javax.swing.JOptionPane;
public class Database
{
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    public Database() throws SQLException
    {
        try{
            
            //MAKE SURE YOU KEEP THE mysql_connector.jar file in java/lib folder
            //ALSO SET THE CLASSPATH
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/arvi21_epagar","root","agb");
            System.out.println("connetion success.....");
            
        }
        catch (ClassNotFoundException e)
        {
            System.out.println("exception : "+e);
        }
    }
    //ip:username,password
    //return boolean
    public Boolean checkAdminLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from admin where username=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public String checkStudentLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from student where email='"+uname+"' and password='"+pwd+"' and status=1");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getString("id");
            }else{
                return "0";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return "0";
    }
    public String checkEmployeeLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from employee where email='"+uname+"' and password='"+pwd+"' and status=1");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getString("id");
            }else{
                return "0";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return "0";
    }
    public Boolean checkCurrentPwdExist(String pwd)
    {
        try {
            pst=con.prepareStatement("select * from admin where password=?");
            pst.setString(1, pwd);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public String checkEmployeeEmailExist(String email)
    {
        try {
            pst=con.prepareStatement("select * from employee where email=? and status=1");
            pst.setString(1, email);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getString("mobile");
            }
            else
            {
                return null;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }
    
     public String checkFacultyEmailExist(String email)
    {
        try {
            pst=con.prepareStatement("select * from faculty where email=? and status=1");
            pst.setString(1, email);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getString("mobile");
            }
            else
            {
                return null;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    public Boolean addNotification(String title,String descr)
    {
        try {
            pst=con.prepareStatement("insert into notification (title,description) values(?,?)");
            pst.setString(1, title);
            pst.setString(2, descr);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public ResultSet getNotifications()
    {
        try {
            pst=con.prepareStatement("select * from notification");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getEmployeeNotifications(String facid)
    {
        try {
            pst=con.prepareStatement("select * from notification where employee_id="+facid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getEmployeePayment(String facid)
    {
        try {
            pst=con.prepareStatement("select * from payment where employee_id="+facid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getEmployeePayments()
    {
        try {
            pst=con.prepareStatement("select * from payment order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getEmployeeAttendance(String facid)
    {
        try {
            pst=con.prepareStatement("select * from attendence where employee_id="+facid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getEmployeeFiles(String facid)
    {
        try {
            pst=con.prepareStatement("select * from files where employee_id="+facid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getNotificationById(int id)
    {
        try {
            pst=con.prepareStatement("select * from notification where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getSubjectsByBranchId(int bid)
    {
        try {
            pst=con.prepareStatement("select * from faculty_subjects where branch_id="+bid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public Boolean editNotification(int id, String title,String descr)
    {
        try {
            pst=con.prepareStatement("update notification set title=?,description=? where id=?");
            pst.setString(1, title);
            pst.setString(2, descr);
            pst.setInt(3, id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public Boolean addSalary(int employee,String month,String sadate,String amount,String deduction,String salary)
    {
        try {
            pst=con.prepareStatement("insert into payment (employee_id,month,date,amount,deduction,salary) values(?,?,?,?,?,?)");
            pst.setInt(1, employee);
            pst.setString(2, month);
            pst.setString(3,sadate);
            pst.setString(4,amount);
            pst.setString(5,deduction);
            pst.setString(6,salary);
            
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public ResultSet getFacultySubjects()
    {
        try {
            pst=con.prepareStatement("select * from faculty_subjects");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public Boolean addFacMsg(String msg,int facid)
    {
        try {
            pst=con.prepareStatement("insert into message (message,user,faculty_id) values(?,?,?)");
            pst.setString(1, msg);
            pst.setString(2, "faculty");
            pst.setInt(3, facid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public Boolean addAdminMsg(String msg,int facid)
    {
        try {
            pst=con.prepareStatement("insert into message (message,user,faculty_id) values(?,?,?)");
            pst.setString(1, msg);
            pst.setString(2, "admin");
            pst.setInt(3, facid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    private int checkFacSubject(int yearsem,int brid, int facid, String subject) {
          
        try {
            pst=con.prepareStatement("select * from faculty_subjects where year_sem_id="+yearsem+" and branch_id="+brid+" and faculty_id="+facid+" and subject='"+subject+"'");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
      }
    
     public Boolean addfacultysubject(int yearsem,int brid,int facid,String subject)
    {
        int tme=this.checkFacSubject(yearsem,brid,facid,subject);
        if(tme==1){
                return false;
        }else{  
            try {
                pst=con.prepareStatement("insert into faculty_subjects (year_sem_id,branch_id,faculty_id,subject) values(?,?,?,?)");
                pst.setInt(1,yearsem);
                pst.setInt(2,brid);
                pst.setInt(3,facid);
                pst.setString(4, subject);
                int n=pst.executeUpdate();
                if(n==1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            } catch (Exception e) {
                // TODO Auto-generated catch block
                System.out.println("error while validating :"+e);
                return false;
            }
        }
    }
    
     public ResultSet getFacMessage(String facid)
    {
        try {
            pst=con.prepareStatement("select * from message where faculty_id="+facid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public boolean delete(String tab,int id){
        try {
            pst=con.prepareStatement("delete from "+tab+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            System.out.println(n);
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
        
    }
    
    public ResultSet getDepartments()
    {
        try {
            pst=con.prepareStatement("select * from departments");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet selectAll(String q)
    {
        try {
            pst=con.prepareStatement(q);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getDepartmentById(int id)
    {
        try {
            pst=con.prepareStatement("select * from departments where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    public ResultSet getSubjectById(int id)
    {
        try {
            pst=con.prepareStatement("select * from faculty_subjects where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    
    
    
    public ResultSet getSession()
    {
        try {
            pst=con.prepareStatement("select * from session");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getYearSem()
    {
        try {
            pst=con.prepareStatement("select * from year_sem");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getYearSemById(int id)
    {
        try {
            pst=con.prepareStatement("select * from year_sem where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getEmployeeById(int id)
    {
        try {
            pst=con.prepareStatement("select * from employee where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFacultyByBranchId(int id)
    {
        try {
            pst=con.prepareStatement("select * from faculty where branch_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getStudentById(int id)
    {
        try {
            pst=con.prepareStatement("select * from student where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
     public ResultSet getSessionById(int id)
    {
        try {
            pst=con.prepareStatement("select * from session where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    
     
     public boolean addStudent(String sname,String address,String mobno,String email,String dob,String branch,String yearsem,String enrollno,String session,String spassword){
         try {
            pst=con.prepareStatement("insert into student (name,address,mobile,email,dob,branch_id,year_sem_id,enrollno,session,password,status) values(?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, sname);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, email);
            pst.setString(5, dob);
            pst.setString(6, branch);
            pst.setInt(7, Integer.parseInt(yearsem));
            pst.setString(8, enrollno);
            pst.setString(9, session);
            pst.setString(10, spassword);
            pst.setInt(11, 1);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
     }
     
     public boolean udpateStudent(int id,String sname,String address,String mobno,String email,String dob,String branch,String yearsem,String enrollno,String session,String spassword){
         try {
            pst=con.prepareStatement("update student set name=?,address=?,mobile=?,email=?,dob=?,branch_id=?,year_sem_id=?,enrollno=?,session=?,password=?,status=? where id=?");
            pst.setString(1, sname);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, email);
            pst.setString(5, dob);
            pst.setString(6, branch);
            pst.setInt(7, Integer.parseInt(yearsem));
            pst.setString(8, enrollno);
            pst.setString(9, session);
            pst.setString(10, spassword);
            pst.setInt(11, 1);
            pst.setInt(12, id);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
     }
     
     public boolean addEmployee(String sname,String address,String mobno,String email,String dob,String branch,String design,String password){
         try {
            pst=con.prepareStatement("insert into employee (name,address,mobile,email,dob,department_id,designation,password,status) values(?,?,?,?,?,?,?,?,?)");
            pst.setString(1, sname);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, email);
            pst.setString(5, dob);
            pst.setString(6, branch);
            pst.setString(7, design);
            pst.setString(8, password);
            pst.setInt(9, 1);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
     }
     
     
     public boolean updateEmployee(int id,String sname,String address,String mobno,String email,String dob,String branch,String design,String password){
         try {
            pst=con.prepareStatement("update employee set name=?,address=?,mobile=?,email=?,dob=?,department_id=?,designation=?,password=?,status=? where id=?");
            pst.setString(1, sname);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, email);
            pst.setString(5, dob);
            pst.setString(6, branch);
            pst.setString(7, design);
            pst.setString(8, password);
            pst.setInt(9, 1);
            pst.setInt(10, id);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
     }
     
     public ResultSet getStudents()
    {
        try {
            pst=con.prepareStatement("select * from student");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
     public int addFeedback(int sid,int timer_id)
    {
        try {
            pst=con.prepareStatement("insert into feedback (student_id,timer_id) values(?,?)",Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, sid);
            pst.setInt(2, timer_id);
            int n=pst.executeUpdate();
            ResultSet keys = pst.getGeneratedKeys(); 
            if(n==1)
            {
                keys.next(); 
                int key = keys.getInt(1);
                return key;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
     
     public ResultSet getEmployees()
    {
        try {
            pst=con.prepareStatement("select * from employee");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
      public ResultSet getFiles()
    {
        try {
            pst=con.prepareStatement("select * from files");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
      
        public ResultSet getAttendance()
    {
        try {
            pst=con.prepareStatement("select * from attendence order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
      
       public int checkFeedbackExist(int timerid,int studid)
    {
        try {
            pst=con.prepareStatement("select * from feedback where timer_id="+timerid+" and student_id="+studid);
            rs=pst.executeQuery();
            if(rs.next()){
                return 1;
            }else{
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
     
     public int update_delete(String sql){
        try {
            pst=con.prepareStatement(sql);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 2;
        }
    }
     
      public boolean addTimer(String tyearsem,String tbranch,String date,String time,String tsession){
         try {
            String startDate=date; // Input String
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd"); // New Pattern
            java.util.Date ddate = sdf1.parse(startDate); 
            java.sql.Date sqlStartDate = new java.sql.Date(ddate.getTime());
            
            int tme=this.checkTimer(tyearsem,tbranch,tsession);
            if(tme==1){
                return false;
            }else{
                pst=con.prepareStatement("insert into timer (branch_id,year_sem_id,date,time,session) values(?,?,?,?,?)");
                pst.setInt(1, Integer.parseInt(tbranch));
                pst.setInt(2, Integer.parseInt(tyearsem));
                pst.setDate(3, sqlStartDate);
                pst.setString(4, time);
                pst.setString(5, tsession);
                //executes the prepared statement
                int n=pst.executeUpdate();

                if(n==1)
                {
                    //TRUE iff the query founds any corresponding data
                    return true;
                }
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
        return false;
     }
    
      private int checkTimer(String tyearsem, String tbranch, String tsession) {
          
        try {
            pst=con.prepareStatement("select * from timer where year_sem_id='"+tyearsem+"' and branch_id='"+tbranch+"' and session='"+tsession+"'");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
      }
      
    public String checkInTimer(int tbranch, int tyearsem, int tsession) {
          
        try {
            pst=con.prepareStatement("select * from timer where year_sem_id="+tyearsem+" and branch_id="+tbranch+" and session="+tsession);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getString("date") +" "+ rs.getString("time");
            }else{
                return "0";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return "0";
        }
      }
    
    public String checkInTimer1(int tbranch, int tyearsem, int tsession) {
          
        try {
            pst=con.prepareStatement("select * from timer where year_sem_id="+tyearsem+" and branch_id="+tbranch+" and session="+tsession);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getString("date");
            }else{
                return "0";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return "0";
        }
      }
    
    public int GetCheckInTimerId(int tbranch, int tyearsem, int tsession) {
          
        try {
            pst=con.prepareStatement("select * from timer where year_sem_id="+tyearsem+" and branch_id="+tbranch+" and session="+tsession);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
      }
     
    public ResultSet getAllComplaints()
    {
        
        try {
            pst=con.prepareStatement("select * from complaints ");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    public ResultSet getStudComplaints(int studid)
    {
        
        try {
            pst=con.prepareStatement("select * from complaints where student_id="+studid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
      public Boolean addFiles(int empid,String name)
    {
        try {
            pst=con.prepareStatement("insert into files (file,employee_id) values(?,?)");
            pst.setString(1, name);
            pst.setInt(2, empid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
      
      public Boolean addAttendance(int empid,String date,String status)
    {
        try {
            pst=con.prepareStatement("insert into attendence (employee_id,date,status) values(?,?,?)");
            pst.setInt(1, empid);
            pst.setString(2, date);
            pst.setString(3, status);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
     
    
    public boolean updateStatus(int id,int status,String tab){
        try {
            pst=con.prepareStatement("update "+tab+" set status="+status+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    

    
}

