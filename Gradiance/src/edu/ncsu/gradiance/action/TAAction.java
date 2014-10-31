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

public class TAAction {
	private DBConnection dbc = null;
	private Connection conn = null;

	/**
	 * @author yaolu
	 * @function add course by token
	 */
	public String addTACourse(String token, String sid) {		
		String sql = "select cid,tend from course where token=?";
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
				
				String curTime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
				if(curTime.compareTo(tend)>0)
					addCourseResult = "Oops! Course is over.";
				else {
					sql = "insert into courseta(sid,cid) values (?,?)";	//insert enrollment
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, sid);
					stmt.setString(2, cid);
					int result = stmt.executeUpdate();
					System.out.print("result:"+result);
					if(result == 1) {
						addCourseResult = "TA course added!";
						
						//Notification: if isTA and course added have overlap topic with TA's course, then notify Professor
						sql = "SELECT CV1.cid, CV2.cid"
								+" FROM gradiance.stusecour AS SC, gradiance.courseta AS CT, gradiance.cover AS CV1, gradiance.cover AS CV2"
								+" WHERE SC.sid=CT.sid"
								+" AND SC.sid=?"
								+" AND CT.cid=CV1.cid"
								+" AND SC.cid=CV2.cid"
								+" AND CV1.tid=CV2.tid"
								+" GROUP BY CV1.cid, CV2.cid";
						
						stmt = conn.prepareStatement(sql);
						stmt.setString(1, sid);
						ResultSet rs2 = stmt.executeQuery();
						while(rs2.next()){	//have overlap, notify professor
							String cid1 = rs2.getString(1);
							String cid2 = rs2.getString(2);
							
							sql = "select fid from course where cid=?";
							stmt = conn.prepareStatement(sql);
							stmt.setString(1, cid);
							ResultSet rs3 = stmt.executeQuery();
							if(rs3.next()) {
								String fid = rs3.getString("fid");
								new NotifAction().addNotif(fid, "Overlap Topic", "Student "+sid+"overlaped topic between "+cid1+" and "+cid2);
							}
						}
					}
					else addCourseResult = "Oops! You have already added that course!";
				}
			}
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}System.out.println(addCourseResult);
		return addCourseResult;
	}
	
	/**
	 * @author yaolu
	 * @function get TA's selected courses by sid
	 */
	public List<Course> getTACourses(String sid) {		
		String sql = "select cid,name from course where cid in (select cid from courseta where sid=?)";
		List<Course> taCourses = new ArrayList<Course>();
	
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
				
				taCourses.add(c);
			}
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return taCourses;
	}

	public boolean isTACourse(String token, String uid) {
		String sql = "select cid from courseta where sid=? and cid in (select cid from course where token=?)";	
		boolean isTACourse = false;

		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			stmt.setString(2, token);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				isTACourse = true;
			}
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return isTACourse;
	}
}