package edu.ncsu.gradiance.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import edu.ncsu.gradiance.dao.Course;
import edu.ncsu.gradiance.util.DBConnection;

public class ProfessorAction {
	private DBConnection dbc = null;
	private Connection conn = null;
	
	/**
	 * @author yaolu
	 * @function add course by token
	 */
	public String addCourse(String token, String fid) {		
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
					sql = "update course set fid=? where cid=?";			//update course professor
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, fid);
					stmt.setString(2, cid);
					if(stmt.executeUpdate()>0) addCourseResult = "Course Selected!";
					else addCourseResult = "Oops! Something wrong when executing SQL.";
				}
			}
			
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return addCourseResult;
	}
	
	/**
	 * @author yaolu
	 * @function get professor's selected courses by fid
	 */
	public List<Course> getSelectedCourses(String fid) {		
		String sql = "select cid,name from course where cid in (select cid from course where fid=?)";
		List<Course> selectedCourses = new ArrayList<Course>();
	
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, fid);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String cid = rs.getString("cid");
				String name = rs.getString("name");
				
				Course c = new Course();
				c.setCid(cid);
				c.setName(name);
				
				selectedCourses.add(c);
			}
			
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return selectedCourses;
	}

	/**
	 * @author yaolu
	 * @function add homework
	 * @param params: is a string like "cid,title,tstart,tend,minDif,maxDif,retry,corrPts,penalPts,scoreSelect"
	 */
	public String addHomework(String params,String tidList) {		
		String sql = "insert into assessment(cid,title,tstart,tend,minDif,maxDif,retry,corrPts,penalPts,scoreSelect,tidList) values(?,?,?,?,?,?,?,?,?,?,?)";
		String addHomeworkResult = "Add homework failed.";
		String aid = "";
		List<String> list = new ArrayList<String>();
			
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			String[] s = params.split(",");
			for(int i=0;i<s.length;i++)
				stmt.setString(i+1, s[i]);
			stmt.setString(11, tidList);
			
			if(stmt.executeUpdate() > 0)
				addHomeworkResult = "Homework added!";
			
			sql = "select LAST_INSERT_ID()";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) aid = "" + rs.getInt(1);
			
			list.add(aid);
			list.add(addHomeworkResult);
			
			conn.close();	
		} catch(Exception e){
			e.printStackTrace();
		}
		return addHomeworkResult;
	}

	/**
	 * @author yaolu
	 * @function get homework basic info(aid, cid) by cid
	 * @return 
	 */
	public String getHomeworkList(String cid) {		
		String sql = "select aid,title from assessment where cid=?";
		String homework = "";
		
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, cid);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) 
				homework += rs.getString("aid")+","+rs.getString("title")+",";
			homework = homework.substring(0, homework.length()-1);
			
			conn.close();	
		} catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("getHomeworkList:"+homework);
		return homework;
	}

	/**
	 * @author yaolu
	 * @function edit homework
	 */
	public String editHomework(String aid, String title, String tend, String scoreSelect) {		
		String sql = "update assessment set title=?,tend=?,scoreSelect=? where aid="+aid;
		String editHomeworkResult = "Edit homework failed.";
		
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, title);
			stmt.setString(2, tend);
			stmt.setString(3, scoreSelect);
			//stmt.setString(4, aid);
			
			if(stmt.executeUpdate() > 0)
				editHomeworkResult = "Homework Edited!";
			
			conn.close();	
		} catch(Exception e){
			e.printStackTrace();
		}
		return editHomeworkResult;
	}

	/**
	 * @author yaolu
	 * @function get homework basic info by aid
	 * @return 
	 */
	public String getHomeworkBasic(String aid) {		
		String sql = "select title,tstart,tend,minDif,maxDif,retry,corrPts,penalPts,scoreSelect from assessment where aid="+aid;
		String homework = "";
		
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			//stmt.setString(1, aid);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				for(int i=1;i<=9;i++)
					homework += rs.getString(i) + ",";
			}
			homework = homework + aid;
			
			conn.close();	
		} catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("getHomeworkBasic:"+homework);
		return homework;
	}
	
	/**
	 * @author yaolu
	 * @function get homework basic info by aid
	 * @return 
	 */
	public String getHomeworkQuestion(String aid) {		
		String sql = "select minDif,maxDif,tidList from assessment where aid="+aid;
		String homeworkQuestion = "";
		
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			//get homework's minDif, maxDif and topic id list
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String minDif = rs.getString("minDif");
				String maxDif = rs.getString("maxDif");
				String[] tmpStr = rs.getString("tidList").split(",");
				List<String> selectedQidList = new ArrayList<String>();
				List<String> tidList = new ArrayList<String>();
				
				Collections.addAll(tidList, tmpStr);
				
				//get all qids that homework already had
				sql = "select qid from asshasq where aid="+aid;			
				stmt = conn.prepareStatement(sql);
				ResultSet rs1 = stmt.executeQuery();
				while(rs1.next())
					selectedQidList.add(""+rs1.getInt("qid"));
				
				//get contents of all qids that meet requirement
				sql = "select qid,content from seed where qid in (select qid from question where difficulty>="+minDif+" and difficulty<="+maxDif;
				
				if(tidList.size()>0) {	//Add topic constraints if had
					sql += " and (";
					for(int i=0;i<tidList.size();i++) {
						sql += "tid="+tidList.get(i);
						if(tidList.size()>1 && i<tidList.size()-1) 
							sql += " or ";
					}
					sql +=" )";
				} 
				sql += ")";
				//System.out.println("SQL in add/remove question:"+sql);
				
				stmt = conn.prepareStatement(sql);
				ResultSet rs2 = stmt.executeQuery();
				while(rs2.next()) {
					String qid = ""+rs2.getInt("qid");
					String content = rs2.getString("content");
					String selected = "0";
					if(selectedQidList.contains(qid))
						selected = "1";
					
					homeworkQuestion += qid + "@" + selected + "@" + content+"@";
				}
				homeworkQuestion = homeworkQuestion.substring(0,homeworkQuestion.length()-1);
				System.out.println(homeworkQuestion);
			}			
			conn.close();	
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return homeworkQuestion;
	}
	
	public static void main(String[] args) {
		System.out.println("test ProfessorAction");
		ProfessorAction pa = new ProfessorAction();
		
		
		//System.out.println(pa.getHomeworkList("CSC540"));
		System.out.println(pa.getHomeworkQuestion("2"));

	}
}