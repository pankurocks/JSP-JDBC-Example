<%-- 
    Document   : view
    Created on : Sep 10, 2018, 9:01:26 PM
    Author     : panku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Records</title>
         <style>
             body{
                 text-align: center;
                 font-size: 1.2em;
             }
            table{
                width: 60%;
                text-align: center;
                margin:auto;
                padding: 10px;
                font-size: 1.2em;
                border: 2px solid black;
                border-collapse: collapse;
            }
            td{
                text-align: left;
                border: 2px dotted grey;
                padding: 10px;

            }
            thead{
                font-family: Times New Roman;
                font-size: 1.3em;
                padding: 5px;
            }

        </style>
    </head>
    <body>
        <h1>Students Records</h1>
        <table>
            <thead>
            <td>Roll Number</td>
            <td>Name</td>
            <td>Course</td>
            </thead>
            <%@page import="java.sql.*" %>
            <%!
            String DBDRIVER = "com.mysql.jdbc.Driver";
            String DBURL ="jdbc:mysql://localhost:3306/assignment";
            String username ="root";
            String password ="root";

            public void loadDriver(){
                try{
                    Class.forName(DBDRIVER);
                }catch(Exception e){
                    System.out.println("Load Driver : "+e);
                }
            }

            String query = "select * from student";
            %>
            <% 
            try{
                Class.forName(DBDRIVER);
                Connection con = DriverManager.getConnection(DBURL, username, password);
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next()){
            %>
            <tr>
            <td><% out.print(rs.getInt(1)); %></td>
            <td><% out.print(rs.getString(2)); %></td>
            <td><% out.print(rs.getString(3)); %></td>
            </tr>
            
            <%
                }
            }catch(Exception e){
                
            }
            %>
            
        </table>
            
            <h2>   <a href="JdbcHome.jsp">Go Back to Home</a> </h2>
        
    </body>
</html>
