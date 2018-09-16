<%-- 
    Document   : Bill
    Created on : Sep 7, 2018, 9:31:31 PM
    Author     : panku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>UPCL BILL</title>

        
        <style>
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
        <% out.println();
        String connection, name, type, senior;
        int prev,current,unit;
        double bill, rebate=0, total;
        connection = request.getParameter("connection");
        name = request.getParameter("name");
        type = request.getParameter("type");
        prev = Integer.parseInt(request.getParameter("previous"));
        current = Integer.parseInt(request.getParameter("current"));
        //senior = request.getParameter("senior");
  
        unit = current-prev;
        if(type.equals("res")){
            bill = (current-prev)*3.50;
        }else{
            bill = (current-prev)*5.75;
        }
        

        if(request.getParameter("senior")!=null){
            total = bill*90/100;
            rebate = 10;
        }else{
            total = bill;
        }
        %>
        
        
        
        
            <table>
                <thead>
                    <tr>
                        <th colspan=2""> <img id="photo" src="upcl_logo.png" alt="UPCL (Uttarakhand Power Corporation Limited)"/> </th>
                
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Connection Number: </td>
                        <td><% out.println(connection); %> </td>
                    </tr>
                    <tr>
                        <td>Customer Name: </td>
                        <td> <% out.println(name); %></td>
                    </tr>
                    <tr>
                        <td>Connection Type: </td>
                        <td> <%
                            if (type.equals("res")) {
                                out.print("Residential");
                            } else {
                                out.print("Commercial");
                            }
                            %></td>
                    </tr>
                    <tr>
                        <td>Previous Reading: </td>
                        <td> <% out.println(prev); %></td>
                    </tr>
                    <tr>
                        <td>Current Reading: </td>
                        <td> <% out.println(current); %></td>
                    </tr>
                    <tr>
                        <td>Total Units: </td>
                        <td> <% out.println(unit); %></td>
                    </tr>
                    <tr>
                        <td>Billed Rate: </td>
                        <td><%
                            if (type.equals("res")) {
                                out.println("&#8377; 3.40 /-");
                            } else {
                                out.println("&#8377; 5.80 /-");
                            }
                            %></td>
                    </tr>
                    <tr>
                        <td>Bill Amount: </td>
                        <td> <% out.println(bill); %> </td>
                    </tr>
                    <tr>
                        <td>Rebate: </td>
                        <td>
                            <% out.print(rebate+" %"); %>
                        </td>
                    </tr>
                    <tr >
                        <td>Total Bill: </td>
                        <td><% out.print("<h4> &#8377; "+total+" </h4>"); %> </td>
                    </tr> 
                </tbody>
            </table>
        <h4 style="text-align: center">
            <a href="ElectricityBill.html">Generate another Bill !!</a> <hr>
            <input type="button" value="Print Bill" onclick="print()">
        </h4>
                    
                   
    </body>
</html>

