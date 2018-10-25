package Main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class Connector {
	
	private Connection c;

	public Connection setConnection () {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			 c = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?" + "user=root&password=&serverTimezone=UTC");
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	
	public ResultSet selectSQL (String command) throws SQLException {
		ResultSet r = null;
		if (c == null) {
			setConnection();
		}
		Statement s = c.createStatement();
		r = s.executeQuery(command);
		return r;
	}
	
	public void insertSQL (String command) throws SQLException {
		if (c == null) {
			setConnection();
		}
		Statement s = c.createStatement();
		s.executeUpdate(command);
	}
}
