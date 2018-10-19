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
        <title>Audio list</title>
    </head> 
    <body>
        
        <ul>
            <li><a href="index.xhtml">Home</a></li>
            <li><a href="books.jsp">Books</a></li>
            <li><a class="active" href="audios.jsp">Audio</a></li>
            <li><a href="computers.jsp">Computer</a></li>
            <div class="right">
                <li><a href="#about">Login</a></li>
                <li><a href="#about">Signup</a></li>
                <li><a href="#about">About</a></li>
            </div>
       </ul>
        
        <h1>Audio list </h1>
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
            String sql ="SELECT I.*, A.* FROM item I JOIN audioCD A ON (I.itemID = A.diskID)";

            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
            %>
            <tr bgcolor="#DEB887">

            <p> <b> Name - </b> <%=resultSet.getString("name") %> </p>
            <p> <b> Description - </b> <%=resultSet.getString("description") %> </p>
            <p> <b> Item ID - </b> <%=resultSet.getString("DiskID") %></p>
            <p> <b> Artist - </b> <%=resultSet.getString("artist") %> </p>
            <p> <b> Type - </b> <%=resultSet.getString("Type") %> </p>
            </tr>
        <% 
    }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    </body> 
 </html> 