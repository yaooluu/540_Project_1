package edu.ncsu.gradiance.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	//sqLite
	//private final static String DRIVER = "org.sqlite.JDBC";
	//private final static String URL = "jdbc:sqlite:/E2.db";

	private final static String DRIVER = ("com.mysql.jdbc.Driver");
	private final static String URL = "jdbc:mysql://localhost:3306/gradiance";
	private final String username = "root";
	private final String password = "root";
	
	private Connection conn = null;
	
	public DBConnection() {
		try {
			Class.forName(DRIVER);
			//conn = DriverManager.getConnection(URL);
			conn = DriverManager.getConnection(URL,username,password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		return this.conn;
	}
	
	public void close() {
		try {
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
