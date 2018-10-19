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
        <title>Item list</title> 
        <a href="home.jsp">Home</a>
        <a href="books.jsp">Book List</a>
        <a href="audios.jsp">Audio Disc List</a>
        <a href="computers.jsp">Computer List</a>
    </head> 
    <body>
        <h1>Item list </h1>
        
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
            String sql ="SELECT * FROM item";

            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
            %>
            <tr bgcolor="#DEB887">

            <p> <b> Item ID - </b> <%=resultSet.getString("itemID") %></p>
            <p> <b>Item Name - </b> <%=resultSet.getString("name") %> </p>
            <p> <b> Item Description - </b> <%=resultSet.getString("description") %> </p>
            </tr>

        <% 
    }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    </body> 
 </html> 