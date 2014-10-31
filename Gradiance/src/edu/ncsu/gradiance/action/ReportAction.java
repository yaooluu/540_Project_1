package edu.ncsu.gradiance.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Types;

import edu.ncsu.gradiance.util.DBConnection;

public class ReportAction {
	private DBConnection dbc = null;
	private Connection conn = null;

	/**
	 * @author yaolu
	 * @function user login verification
	 */
	public String runSQL(String sql) {		
		String sqlResult = "Oops! Syntex Error.";
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			sqlResult = "";
			
			//add column labels
			for(int j=1;j<=rsmd.getColumnCount();j++)
				sqlResult += rsmd.getColumnLabel(j)+"@";
			
			if(sqlResult.length()>0)	//remove tail @
				sqlResult = sqlResult.substring(0,sqlResult.length()-1);
			
			while(rs.next()) {
				sqlResult += "#";
				for(int i=1;i<=rsmd.getColumnCount();i++) {
					int type = rsmd.getColumnType(i);
					
		            if (type == Types.INTEGER) 
		                sqlResult += rs.getInt(i) + "@";
		            else
		            	sqlResult += rs.getString(i) + "@";
				}
				sqlResult = sqlResult.substring(0,sqlResult.length()-1);
			}
		} catch(Exception e){
			e.printStackTrace();
			return "SQL Error#"+e.toString();
		}
		System.out.println(sqlResult);
		return sqlResult;
	}

	/**
	 * @author yaolu
	 * @function get user name by uid
	 */
	public String getBuiltInSQL(String rptId) {		
		String sql = "select * from course";
	
		
		return sql;
	}

}
