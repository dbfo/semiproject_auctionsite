package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPool{
	static DataSource ds=null;
	static {//static멤버를 초기화할 때는 static 블록을 사용한다.
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle"); //멤버변수로 있기 때문에 자료형 지울것
		}catch(NamingException ne) {
			System.out.println(ne.getMessage());
		}
	}
	
	public static Connection getConn() throws SQLException{
		Connection con=ds.getConnection();
		return con;
	}
	public static void close(ResultSet rs,Statement stmt,Connection con) {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs!=null) rs.close();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt!=null) stmt.close();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}
	}
	public static void close(Connection con) {
		try {
			if(con!=null) con.close();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}
	}
}
