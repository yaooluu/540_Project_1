package edu.ncsu.gradiance.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import edu.ncsu.gradiance.util.DBConnection;

public class NotifAction {
	private DBConnection dbc = null;
	private Connection conn = null;

	/**
	 * @author yaolu
	 * @function get user notification
	 */
	public String getNotif(String uid, boolean erase) {		
		String sql = "select title,content from notification where uid=? and isRead=0";
		String notif = "";
	
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				
				notif += title + "@" + content + "@";
			}
			if(notif.length()>0)
				notif = notif.substring(0,notif.length()-1);
			
			if(erase) {
				//set notif isRead to 1
				sql = "update notification set isRead=1 where uid=?";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, uid);
				if(stmt.executeUpdate()>0);
			}
			
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return notif;
	}
	
	/**
	 * @author yaolu
	 * @function add user notification
	 */
	public String addNotif(String uid, String title, String content) {		
		String sql = "insert into notification(title,content,uid,isRead) values(?,?,?,0)";
		String addNotifResult = "Add Notif Failed!";
	
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setString(3, uid);

			if(stmt.executeUpdate()>0)
				addNotifResult = "Add Notif Succeeded!";

			//conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return addNotifResult;
	}

	/**
	 * @author yaolu
	 * @function check if user has an unattempted due that will expire with a day
	 */

	public boolean checkUrgentDue(String sid, String cid) {		
		String sql = "select aid,title,tend from assessment where cid=?";
		boolean hasUrgentDue = false;
		String title = "";
	
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, cid);
			ResultSet rs = stmt.executeQuery();
			String curTime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
			
			
			while(rs.next()) {
				int aid = rs.getInt("aid");
				String tend = rs.getString("tend");
				title = rs.getString("title");
				
				//get yesterday's date
				Date date = new SimpleDateFormat("yyyy-MM-dd").parse(tend);
				Calendar cal = Calendar.getInstance();
			    cal.setTime(date);
			    cal.add(Calendar.DAY_OF_MONTH, -1);
				String oneDayBefore = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
				
				if(curTime.compareTo(oneDayBefore)==0) {
					
					//if student don't have attempted, then notify
					sql = "select count(*) from attempt where aid="+aid+" and sid=?";
					stmt = conn.prepareStatement(sql);
					stmt.setString(1,sid);
					ResultSet rs2 = stmt.executeQuery();
					if(rs2.next()==true) {
						if(rs2.getInt(1)==0) {
						hasUrgentDue = true;
						addNotif(sid, "Urgent Due", "You have an unattempted due\""+title+"\" that will expire with a day.");
						}
					}
				}
			}
				
			//conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
			
		return hasUrgentDue;
	}
	
	public static void main(String[] args) {
		//System.out.println(new NotifAction().checkUrgentDue("ylu31"));
	}
}
