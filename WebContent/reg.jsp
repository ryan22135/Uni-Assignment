<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<form method="POST" action="/Ass2/RegistrationServlet">
            First Name: <input type="text" name="firstName" />
            Last Name: <input type="text" name="lastName" />
            Email: <input type="text" name="email" />
            Date of Birth: <input type="date" name="dob" />
            Home Address: <input type="text" name="address" />
            Password: <input type="text" name="password" />
            <input type="submit" value="Login" />
        </form>
</body>
</html>