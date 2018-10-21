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
        <title>Contact us</title>
    </head> 
    <body>
        
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="books.jsp">Books</a></li>
            <li><a href="audios.jsp">Audio</a></li>
            <li><a href="computers.jsp">Computer</a></li>
            <div class="right">
                <li><a href="#about">Login</a></li>
                <li><a href="#about">Signup</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a class="active" href="contact.jsp">Contact</a></li>
            </div>
        </ul>
        
        <h1>Contact us </h1>
        
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
            String sql ="SELECT * FROM users WHERE isAdmin=1";

            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
            %>
            <tr bgcolor="#DEB887">
            
            <p> <b> Name - </b> <%=resultSet.getString("firstName") %> 
      <%=resultSet.getString("lastName") %> </p>
            <p> <b> Email - </b> <%=resultSet.getString("email") %> </p>
            
            </tr>
        <% 
    }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    </body> 
 </html> 