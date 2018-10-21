<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html">
    <h:head>
        <link rel="stylesheet" type="text/css" href="style.css"> </link>
        <title>FedUni Library Home</title>
    </h:head>
    <h:body>
       <ul>
        <li><a class="active" href="home.jsp">Home</a></li>
        <li><a href="books.jsp">Books</a></li>
        <li><a href="audios.jsp">Audio</a></li>
        <li><a href="computers.jsp">Computer</a></li>
        <div class="right">
            <li><a href="login.jsp">Login</a></li>
            <li><a href="#about">Signup</a></li>
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
    </h:body>
</html>

