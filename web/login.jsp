<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css"> </link>
<title>Login</title>
</head>
<body>
    
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="books.jsp">Books</a></li>
        <li><a href="audios.jsp">Audio</a></li>
        <li><a href="computers.jsp">Computer</a></li>
        <div class="right">
            <li><a class="active" href="login.jsp">Login</a></li>
            <li><a href="signup.jsp">Signup</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </div>
        
        <div class="search">
            <form action="/action_page.php">
                <input type="text" placeholder="Search item" name="search">
                
            </form>
        </div>
        <div class="button">
            <form action="/action_page.php">
                <button type="submit">Search</button>
            </form>
        </div>
       </ul>
    
        <form method="POST" action="/Ass2/LoginServlet">
            <p> username: <input type="text" name="username" /> </p>
            <p> Password: <input type="text" name="password" /> </p>
            <input type="submit" value="Login" />
        </form>
</body>
</html>
