<%-- 
    Document   : home
    Created on : Oct 19, 2018, 2:20:10 AM
    Author     : IEUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


 <html> 
    <head> 
        <link rel="stylesheet" type="text/css" href="style.css"> </link>
        <title>Book list</title>
    </head> 
    <body>      
        <ul>
        <li><a href="index.xhtml">Home</a></li>
        <li><a class="active" href="books.jsp">Books</a></li>
        <li><a href="audios.jsp">Audio</a></li>
        <li><a href="computers.jsp">Computer</a></li>
        <div class="right">
            <li><a href="#about">Login</a></li>
            <li><a href="#about">Signup</a></li>
            <li><a href="#about">About</a></li>
        </div>
       </ul>
            
        <h1>Book list </h1>
        
        <% 
            String id = request.getParameter("userId");
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "library";
            String userId = "admin";
            String password = "LIBRARY";
            try {
            Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
        
        <%
            try{ 
            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
            statement=connection.createStatement();
            String sql ="SELECT I.*, B.* FROM item I JOIN book B ON (I.itemID = B.bookID)";

            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
            %>
            
            <tr bgcolor="#DEB887">
             
            <p> <b> Name - </b> <%=resultSet.getString("name") %> </p> 
            <p> <b> Author - </b> <%=resultSet.getString("author") %> </p>
            <p> <b> Description - </b> <%=resultSet.getString("description") %> </p> 
            <p> <b> Item ID - </b> <%=resultSet.getString("bookID") %></p>
            <p> <b>Item Name - </b> <%=resultSet.getString("publisher") %> </p>
            <p> <b> Published Date - </b> <%=resultSet.getString("publishedDate") %> </p>
            <p> <b> ISBN - </b> <%=resultSet.getString("ISBN") %> </p>
            </tr>
     
            <%
    }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    </body> 
 </html> 