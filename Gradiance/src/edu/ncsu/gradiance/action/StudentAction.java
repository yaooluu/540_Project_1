package edu.ncsu.gradiance.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import edu.ncsu.gradiance.dao.*;
import edu.ncsu.gradiance.util.DBConnection;

public class StudentAction {
	private DBConnection dbc = null;
	private Connection conn = null;

	/**
	 * @author yaolu
	 * @function add course by token
	 */
	public String addCourse(String token, String sid) {		
		String sql = "select cid,tend,volume,maxenroll from course where token=?";
		String addCourseResult = "Invalid Course Token!";
	
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, token);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String cid = rs.getString("cid");
				String tend = rs.getString("tend");
				int maxenroll = rs.getInt("maxenroll");
				int volume = rs.getInt("volume");
				
				String curTime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
				if(curTime.compareTo(tend)>0)
					addCourseResult = "Oops! Course is over.";
				else if(volume == maxenroll)
					addCourseResult = "Oops! Course is full.";
				else {
					sql = "insert into stusecour(sid,cid) values (?,?)";	//insert enrollment
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, sid);
					stmt.setString(2, cid);
					int result = stmt.executeUpdate();
					
					sql = "update course set volume=? where cid=?";			//update course volume
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1, volume+1);
					stmt.setString(2, cid);
					result = result + stmt.executeUpdate();
					if(result == 2) addCourseResult = "Course enrolled!.";
					else addCourseResult = "Oops! Something wrong when executing SQL.";
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return addCourseResult;
	}
	
	/**
	 * @author yaolu
	 * @function get student's selected courses by sid
	 */
	public List<Course> getSelectedCourses(String sid) {		
		String sql = "select cid,name from course where cid in (select cid from stusecour where sid=?)";
		List<Course> selectedCourses = new ArrayList<Course>();
	
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, sid);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String cid = rs.getString("cid");
				String name = rs.getString("name");
				
				Course c = new Course();
				c.setCid(cid);
				c.setName(name);
				
				selectedCourses.add(c);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return selectedCourses;
	}
	
	/**
	 * @author yaolu
	 * @function get student's selected courses by sid
	 */
	public String viewCourse(String sid) {		
		String sql = "select cid,name from course where cid in (select cid from stusecour where sid=?)";
		List<Course> selectedCourses = new ArrayList<Course>();
	
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, sid);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String cid = rs.getString("cid");
				String name = rs.getString("name");
				
				Course c = new Course();
				c.setCid(cid);
				c.setName(name);
				
				selectedCourses.add(c);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
}
