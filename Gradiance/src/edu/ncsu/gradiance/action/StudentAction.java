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
	 * @function get final scores for all assessments by sid,cid
	 * @return a string list of "assesment name, final score, total score"
	 */
	public List<String> viewScore(String sid, String cid) {		
		String sql = "select aid, title, corrPts, scoreSelect from assessment where cid=?";
		List<String> scores = new ArrayList<String>();
		
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, cid);
			ResultSet rs = stmt.executeQuery();
			
			//for each assessment of course(cid), get its title,finalScore,totalScore
			while(rs.next()) {				
				int aid = rs.getInt("aid");
				String title = rs.getString("title");
				int corrPts = rs.getInt("corrPts");
				String scoreSelect = rs.getString("scoreSelect");
				String finalScore = "N/A";
				String totalScore = "N/A";
	
				//get totalScore
				sql = "select count(*) from asshasq where aid="+aid;
				stmt = conn.prepareStatement(sql);
				ResultSet rs2 = stmt.executeQuery();
				if(rs2.next()) {
					int total = corrPts * rs2.getInt(1);
					if(total>0)
						totalScore = "" + total;
				}
				
				//get finalScore
				sql = "select subtime,sum(point) from attempt where aid="+aid+" and sid='"+sid+"' group by atid,sid,aid,subtime";
				stmt = conn.prepareStatement(sql);
				ResultSet rs3 = stmt.executeQuery();
				List<Integer> n = new ArrayList<Integer>();
				List<String> s = new ArrayList<String>();
				while(rs3.next()) {
					s.add(rs3.getString(1));
					n.add(rs3.getInt(2));
				}
				
				if(n.size()>0) {
					int score = 0;
					if(scoreSelect.equals("max score")) {
						score = -100;
						for(Integer i:n)
							if(i.intValue()>score) score = i.intValue();
					}else if(scoreSelect.equals("average score")) {
						score = 0;
						for(Integer i:n)
							score = score + i.intValue();
						score = score/n.size();
					}else if(scoreSelect.equals("latest attempt")) {
						int i=-1;
						String max = "0000-00-00 00:00:00";
						for(String str:s)
							if(str.compareTo(max)>0) {max = str;i++;}
						score = n.get(i);
					}
					finalScore = ""+score;
				}
				scores.add(title+","+finalScore+","+totalScore);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		System.out.println(scores);
		return scores;
	}
	
	public static void main(String[] args) {
		StudentAction sa = new StudentAction();
		sa.viewScore("mjones", "CSC540");
	}
}
