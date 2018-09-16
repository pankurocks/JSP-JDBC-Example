<%-- 
    Document   : JdbcHome
    Created on : Sep 10, 2018, 8:46:39 PM
    Author     : panku
--%>
<%@page import="java.sql.*" %>
<%
    String action="Home";
    if(request.getParameter("submit") != null){
        action=request.getParameter("submit");
    }
    
    int status=0;
    String name="";
    int roll=0;
    String course="";
    if(action.equals("Get Data")){
        roll = Integer.parseInt(request.getParameter("roll"));
        status=1;
    }else if(action.equals("Save Record")){
        status =2;
    }else if(action.equals("Update Record")){
        status =3;
    }else if(action.equals("Delete Record")){
        status=4;
    }
    String DBDRIVER = "com.mysql.jdbc.Driver";
            String DBURL ="jdbc:mysql://localhost:3306/assignment";
            String username ="root";
            String password ="root";
            
            try{
                Class.forName(DBDRIVER);
                Connection con = DriverManager.getConnection(DBURL, username, password);
                Statement stmt = con.createStatement();
                if(status==1){
                    String query = "select * from student where rollnumber="+roll;
                    ResultSet rs = stmt.executeQuery(query);
                    while(rs.next()){
                        roll = rs.getInt(1);
                        name = rs.getString(2);
                        course = rs.getString(3);
                    }
                }
                if(status==2){
                    roll = Integer.parseInt(request.getParameter("roll"));
                    name = request.getParameter("name");
                    course = request.getParameter("course");
                    String query = "insert into Student values("+roll+",'"+name+"','"+course+"')";
                    stmt.executeUpdate(query);
                }
                if(status==3){
                    roll = Integer.parseInt(request.getParameter("roll"));
                    name = request.getParameter("name");
                    course = request.getParameter("course");
                    String query = "update Student set name = '"+name+"',course = '"+course+"' where rollnumber = "+roll;
                    stmt.executeUpdate(query);
                }
                if(status==4){
                    roll = Integer.parseInt(request.getParameter("roll"));
                    String query = "delete from Student where rollnumber = "+roll;
                    stmt.executeUpdate(query);
                }
                
            }catch(Exception e){
                
            }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JDBC Example</title>
        <style>
            body{
                text-align: center;
                margin: auto;
            }
            table{
                width:40%;
                text-align: center;
                margin: auto;
                padding: 15px;
                font-size: 1.2em;
            }
            td{
                padding: 10px;
            }
           
            
        </style>
    </head>
    <body>
        <h1>JDBC Example in JSP</h1><hr>
         <form action="JdbcHome.jsp">
            <table>
                <tr>
                    <td>Enter Roll Number : </td>
                    <td><input type="text" name="roll" value="<% if(status==1){out.print(roll);}%>" required="" style="width: 200px; height: 20px"></td>
                    <td><input type="submit" value="Get Data" name="submit" style="width: 100px; height: 100px; font-size: 1.2em"></td>
                </tr>
                <tr>
                    <td>Enter Name : </td>
                    <td><input type="text" name="name" value="<% if(status==1){out.print(name);}%>"  style="width: 200px; height: 20px"></td>
                </tr>
                <tr>
                    <td>Enter Course : </td>
                    <td><input type="text" name="course" value="<% if(status==1){out.print(course);}%>" style="width: 200px; height: 20px"></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="submit" value="Save Record" name="submit" style="width: 250px; height: 100px; font-size: 1.2em"></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="submit" value="Update Record" name="submit" style="width: 250px; height: 100px; font-size: 1.2em"></td>
                </tr> 
                <tr>
                    <td colspan="3"><input type="submit" value="Delete Record" name="submit" style="width: 250px; height: 100px; font-size: 1.2em"></td>
                </tr> 
            </table>
                <hr>
        </form>
    <form action="view.jsp" method="post">
        <table>
            <td>
            <tr><td colspan="2"><input type="submit" value="View Records" name="submit" style="width: 250px; height: 100px; font-size: 1.2em"></td></tr>
            </td>
        </table>
    </form>
                <hr>
                
                    <%
                        if(status==2){
                            out.println("<h1> Sucessfull! Record Saved....</h1>");
                        }
                    %>
                    <%
                        if(status==3){
                            out.println("<h1> Sucessfull! Record Updated....</h1>");
                        }
                    %>
                    <%
                        if(status==4){
                            out.println("<h1> Sucessfull! Record Deleted Successfully....</h1>");
                        }
                    %>
    
        
        
    </body>
</html>
