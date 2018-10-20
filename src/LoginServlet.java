

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Test2
 */
@WebServlet("/Test")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?" + "user=root&password=&serverTimezone=UTC");
			Statement s = c.createStatement();
			
			ResultSet r = s.executeQuery("SELECT userID FROM Users WHERE email = '" + username + "' AND password = '" + password + "'");
			
			while (r.next()) {
				response.sendRedirect("success.html");
				return;
			}
			response.sendRedirect("login.jsp");
			return;
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp");
		}
	}

}
