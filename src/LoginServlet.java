package Main;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
		HttpSession session = request.getSession(true);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Connector c = new Connector();
		
		
		
			try {
				ResultSet r = c.selectSQL("SELECT * FROM Users WHERE email = '" + username + "' AND password = '" + password + "'");
				
				while (r.next()) {
					Userbean user = new Userbean(r.getString("userID"), r.getString("firstName"), r.getString("lastName"), r.getString("email"), r.getString("homeAddress"), r.getString("dob"), r.getBoolean("isAdmin"));
					session.setAttribute("currentUser", user);
					System.out.println(user.testData());
					response.sendRedirect("success.jsp");
					return;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
			response.sendRedirect("login.jsp");
			return;
	}

}
