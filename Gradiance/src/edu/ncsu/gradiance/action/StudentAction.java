package edu.ncsu.gradiance.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Random;

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
					
					if(result==1) {
						sql = "update course set volume=? where cid=?";			//update course volume
						stmt = conn.prepareStatement(sql);
						stmt.setInt(1, volume+1);
						stmt.setString(2, cid);
						result = result + stmt.executeUpdate();
						if(result == 2) {
							addCourseResult = "Course enrolled!";
							
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
						else addCourseResult = "Course enrolled. But failed to update course volume.";
					}
					else addCourseResult = "Oops! You have already enrolled in that course!";
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
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return selectedCourses;
	}
	
	/**
	 * @author yaolu
	 * @function get courses title by cid
	 */
	public String getCourseTitle(String cid) {		
		String sql = "select name from course where cid=?";
		String courseTitle = "N/A";
	
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, cid);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				courseTitle = rs.getString("name");
			}
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return courseTitle;
	}
	
	/**
	 * @author yaolu
	 * @function get final scores for all assessments by sid,cid
	 * @return a string list of "assesment name, final score, total score"
	 */
	public List<String> viewScoreList(String sid, String cid) {		
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
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return scores;
	}

	/**
	 * @author yaolu
	 * @function get all assessments by cid
	 * @return a string list of "aid, title, tstart, tend, remain"
	 */
	public List<String> viewHomeworkList(String cid, String sid) {		
		String sql = "select aid, title, tstart, tend, retry from assessment where cid=?";
		List<String> homeworkList = new ArrayList<String>();
		
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, cid);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {				
				int aid = rs.getInt("aid");
				String title = rs.getString("title");
				String tstart = rs.getString("tstart");
				String tend = rs.getString("tend");
				int retry = rs.getInt("retry");
				
				
				//get attempt count
				int count = 0;
				sql = "select count(distinct subtime) from attempt where aid=? and sid=?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, aid);
				stmt.setString(2, sid);
				ResultSet rs2 = stmt.executeQuery();
				if(rs2.next()) {
					count = rs2.getInt(1);
				}
				
				int remain = 0;
				if(retry==0) remain = -1;	//unlimited retry
				else remain = retry - count;
				
				//check if homework is within due range and has remaining chance
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				String curDate = df.format(new Date()); 
				if(tstart.compareTo(curDate)<=0 && tend.compareTo(curDate)>0)
					homeworkList.add(aid+","+title+","+tstart+","+tend+","+remain);
			}
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return homeworkList;
	}


	/**
	 * @author yaolu
	 * @function generate homework by aid
	 * @return List<List<String>> homeworks, structure like following:
	 * 	[
	 *		["Question 1?,Hint text Q1,detailed explanationQ1", "Question 2?,Hint text Q2,detailed explanationQ2",...],
			["Incorrect ans 4,short explanation 4", "Incorrect ans 3,short explanation 3", "Incorrect ans 6,short explanation 6", "Correct ans 2,no"],
			["Incorrect ans 6,short explanation 6", "Incorrect ans 5,short explanation 5", "Incorrect ans 4,short explanation 4", "Correct ans 1,no"],
			["Incorrect ans 6v2,short explanation 6", "Correct ans 3v2,no", "Incorrect ans 4v2,short explanation 4", "Incorrect ans 5v2,short explanation 5"],
			["1, 1, 1","1, 1, 1","1, 1, 1"]			//idList(aid,seed,qid)
			["1,4,5,6","1,4,5,6","1,4,5,6"]			//ansIdList
			["3, 3, 1"],							//Correct Answer Positions
			["3, 1"],								//corPts and penalPts
			
		]
	 */
	public List<List<String>> generateQuestion(String aid) {		
		String sql = "";
		List<List<String>> homeworks = new ArrayList<List<String>>();

		List<String> questions = new ArrayList<String>();
		List<List<String>> answers = new ArrayList<List<String>>();
		List<String> ansPosList = new ArrayList<String>();
		List<String> points = new ArrayList<String>();
		List<String> idList = new ArrayList<String>();
		List<String> ansIdList = new ArrayList<String>(); 

		String ansPosStr = "";
		
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			
			//find corrPts and penalPts for this homework
			sql = "select corrPts,penalPts from assessment where aid="+aid;
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs0 = stmt.executeQuery();
			if(rs0.next()) {
				//points.add(""+rs0.getInt("corrPts"));
				//points.add(""+rs0.getInt("penalPts"));
				points.add(rs0.getInt("corrPts")+"@"+rs0.getInt("penalPts"));
			}
					
			//find all questions of homework by aid
			sql = "select qid from asshasq where aid=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, aid);
			ResultSet rs1 = stmt.executeQuery();		
			while(rs1.next()) {				
				String qid = rs1.getString("qid");
				Random random = new Random();
						
				//for each qid, find all its seeds
				sql = "select seed from seed where qid="+qid;
				stmt = conn.prepareStatement(sql);
				ResultSet rs2 = stmt.executeQuery();
							
				//random one seed
				int seed = 1;
				List<Integer> seeds = new ArrayList<Integer>();
				while(rs2.next())
					seeds.add(rs2.getInt("seed"));
				random.setSeed(System.nanoTime());
				seed = seeds.get(random.nextInt(seeds.size()));
							
				//for each (qid,seed), get all question(content,hint,explanation)
				sql = "select content,hint,explanation from seed where qid="+qid+" and seed="+seed;
				stmt = conn.prepareStatement(sql);
				ResultSet rs3 = stmt.executeQuery();
				
				while(rs3.next())
					questions.add(rs3.getString("content")+"@"+rs3.getString("hint")+"@"+rs3.getString("explanation"));
				
				//for each (qid,seed), get all correct answers(ansid,correct,content,expln)
				sql = "select ansid,content,expln from answer where qid="+qid+" and seed="+seed+" and correct=0";
				stmt = conn.prepareStatement(sql);
				ResultSet rs4 = stmt.executeQuery();
				

				//get all correct answers
				List<String> tmpAns = new ArrayList<String>();
				List<String> tmpAnsIdList = new ArrayList<String>();
				List<String> tmpAnsIdListAll = new ArrayList<String>(); 
				
				while(rs4.next()) {
					tmpAns.add(rs4.getString("content")+"@"+rs4.getString("expln"));
					tmpAnsIdList.add(rs4.getString("ansid"));
				}

				//random one correct answer				
				random.setSeed(System.nanoTime());
				int index = random.nextInt(tmpAns.size());
				String corrAns = tmpAns.get(index);
				String corrAnsId = tmpAnsIdList.get(index);
				
				
				//for each (qid,seed), get all wrong answers(ansid,correct,content,expln)
				sql = "select ansid,content,expln from answer where qid="+qid+" and seed="+seed+" and correct=1";
				stmt = conn.prepareStatement(sql);
				ResultSet rs5 = stmt.executeQuery();
				
				//get all wrong answers
				tmpAns = new ArrayList<String>();
				tmpAnsIdList = new ArrayList<String>();
				
				while(rs5.next()) {
					tmpAns.add(rs5.getString("content")+"@"+rs5.getString("expln"));
					tmpAnsIdList.add(rs5.getString("ansid"));
				}
				List<String> wrongs = new ArrayList<String>();
				
				//random three wrong answers
				for(int i=0;i<3;i++) {
					random.setSeed(System.nanoTime());
					index = random.nextInt(tmpAns.size());
					
					String wrongAns = tmpAns.get(index);
					wrongs.add(wrongAns);
					tmpAns.remove(wrongAns);
					
					String wrongAnsId = tmpAnsIdList.get(index);
					tmpAnsIdList.remove(wrongAnsId);
					tmpAnsIdListAll.add(wrongAnsId);
				}
				
				//random one position to insert corrAns into wrongs
				random.setSeed(System.nanoTime());
				int pos = random.nextInt(4);
				wrongs.add(pos, corrAns);
				tmpAnsIdListAll.add(pos, corrAnsId);
				
				//append pos to answerPosList, add four choices to answers
				ansPosList.add(""+pos);
				
				answers.add(wrongs);
				idList.add(aid+","+seed+","+qid);
				
				//change tmpAnsIdListAll["1","4","5","6"] to "1,4,5,6" and add it to ansIdList
				List<String> l = tmpAnsIdListAll;
				ansIdList.add(l.get(0)+","+l.get(1)+","+l.get(2)+","+l.get(3));				
			}
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		
		//System.out.println(questions.size()+"#"+answers.size()+"#"+idList.size()+"#"+ansIdList.size()+"#"+ansPosList.size());
		//shuffle question sequence and corresponding items
		long seed = System.nanoTime();
		Collections.shuffle(questions, new Random(seed));
		Collections.shuffle(answers, new Random(seed));
		Collections.shuffle(idList, new Random(seed));
		Collections.shuffle(ansIdList, new Random(seed));
		Collections.shuffle(ansPosList, new Random(seed));
		
		//change ansPos ["1","2","3"] to ["1@2@3"]
		for(int i=0;i<ansPosList.size();i++) {
			ansPosStr += ansPosList.get(i) + "@";
		}
		ansPosList.clear();
		if(ansPosStr.length()>0)
			ansPosList.add(ansPosStr.substring(0,ansPosStr.length()-1));
		
		//add all lists into homeworks
		homeworks.add(questions);
		for(int i=0;i<answers.size();i++)
			homeworks.add(answers.get(i));

		homeworks.add(idList);
		homeworks.add(ansIdList);
		homeworks.add(ansPosList);
		homeworks.add(points);

		//System.out.println("=======generate homeworks========");
		//for(int i=0;i<homeworks.size();i++)
			//System.out.println(homeworks.get(i).size()+" @ "+homeworks.get(i));
		
		//make sure homeworks has questions, or return null
		if(ansPosStr.length()>0)
			return homeworks;
		else 
			return null;
	}
	
	/**
	 * @author yaolu
	 * @function get all past submissions by sid,cid
	 * @return a string list of "atid, title, tstart, tend, subtime, score"
	 */
	public List<String> viewSubmissionList(String sid, String cid) {		
		String sql = "select aid, title, tstart, tend, corrPts from assessment where cid=?";
		List<String> submissions = new ArrayList<String>();
		
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, cid);
			ResultSet rs = stmt.executeQuery();
			
			//for each assessment, get all past submissions
			while(rs.next()) {				
				int aid = rs.getInt("aid");
				String title = rs.getString("title");
				String tstart = rs.getString("tstart");
				String tend = rs.getString("tend");
				int corrPts = rs.getInt("corrPts");
				List<Integer> atids = new ArrayList<Integer>();
				List<String> subtimes = new ArrayList<String>();
				List<Integer> finalScores = new ArrayList<Integer>();
				
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
				
				//get finalScore of all submissions
				sql = "select atid,subtime,sum(point) from attempt where aid="+aid+" and sid='"+sid+"' group by atid,sid,aid,subtime order by subtime desc";
				stmt = conn.prepareStatement(sql);
				ResultSet rs3 = stmt.executeQuery();
				while(rs3.next()) {
					int atid = rs3.getInt(1);
					atids.add(atid);
					
					String subtime = rs3.getString(2); 						//2014-08-15 10:05:00.0
					subtime = subtime.substring(0,subtime.indexOf('.')); 	//2014-08-15 10:05:00
					subtimes.add(subtime);
					
					finalScores.add(rs3.getInt(3));
				}
				
				//add title, tstart, tend, subtime, score to result
				for(int i=0;i<subtimes.size();i++) {
					submissions.add(atids.get(i)+","+title+","+tstart+","+tend+","+subtimes.get(i)+","+finalScores.get(i)+"/"+totalScore);	
				}
			}
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return submissions;
	}
	
	/**
	 * @author yaolu
	 * @function submit homework to database table attempt
	 * @parms	ansPosList				"0@2@1"
	 * 			points					"3@1"
	 * 			useruserAnsAndIdLists 
	 * 								consists of "userAnsPos@idList1@idList2...@ansIdList1@ansIdList2@...@numOfQs"
	 * 							   it's data like "0,0,0,@1,1,1@1,2,1@1,3,1@2,5,4,6@5,6,1,7@6,2,7,5@3"
	 * @return atid of this submission
	 */
	public String submitHomework(String sid, String ansPosList, String points, String userAnsAndIdLists) {		
		String sql = "select max(atid) from attempt where sid=?";
		int atid = 1;
		
		String[] infos = userAnsAndIdLists.split("@");
		
		String aid = infos[1].split(",")[0];
		String[] corAnsPos = ansPosList.split("@");
		String[] usrAnsPos = infos[0].split(",");
		int numOfQs = Integer.parseInt(infos[infos.length-1]);
				
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			//get new insert atid
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, sid);
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
				atid = rs.getInt(1) + 1;
				
			if(atid>=0) {
				//insert user attempt into database
				for(int i=0;i<numOfQs;i++) {
					
					int seed = Integer.parseInt(infos[i+1].split(",")[1]);
					int qid = Integer.parseInt(infos[i+1].split(",")[2]);
					String curTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
					int answer = Integer.parseInt(usrAnsPos[i]);
					String ansList = infos[i+1+numOfQs];
					int usrPoint = 0;
					if(corAnsPos[i].compareTo(usrAnsPos[i])==0)
						usrPoint = Integer.parseInt(points.split("@")[0]);
					else
						usrPoint = -1 * Integer.parseInt(points.split("@")[1]);
							
					sql = "insert into attempt (atid, sid, aid, seed, qid, subtime, answer, ansList, point) values(?,?,?,?,?,?,?,?,?)";
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1,atid);
					stmt.setString(2,sid);
					stmt.setInt(3,Integer.parseInt(aid));
					stmt.setInt(4,seed);
					stmt.setInt(5,qid);
					stmt.setString(6,curTime);
					stmt.setInt(7,answer);
					stmt.setString(8,ansList);
					stmt.setInt(9,usrPoint);
					
					stmt.executeUpdate();
				}
			}else{
				System.out.println("Submit homework failed in StudentAction().submitHomework!");
			}
			
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return atid+"";
	}
	
	/**
	 * @author yaolu
	 * @function submit homework to database table attempt
	 * @return List<String> submissionDetail, structure like following:
	 * 	[
	 *		"Question 1@Question 2@Question 3",
	 *		"hint 1@hint 2@hint 3",
			"Incorrect ans 4@Incorrect ans 3@Incorrect ans 6",
			"Incorrect ans 6@Incorrect ans 5@Incorrect ans 4",
			"Incorrect ans 6v2@Correct ans 3v2@Incorrect ans 4v2@Incorrect ans 5v2",
			"0@1@2",					//user's answers
			"expl1@expl2@expl3",		//each question's expln, depend on correctness	
			"yourScore@totalScore@subtime"
		]
	 */
	public List<String> viewSubmissionDetail(String atid, String sid) {		
		String sql = "select aid,seed,qid,subtime,answer,ansList,point from attempt where atid="+atid+" and sid=?";
		List<String> submissionDetail = new ArrayList<String>();
		
		String tmpQs = "";
		String tmpHints = "";
		List<String> tmpAnsList = new ArrayList<String>();
		String userAns = "";
		String explns = "";
		int yourScore = 0;
		int totalScore = 0;
		String subtime = "N/A";
		
		
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, sid);
			ResultSet rs = stmt.executeQuery();
	
			while(rs.next()) {
				int aid = rs.getInt("aid");
				int qid = rs.getInt("qid");
				int seed = rs.getInt("seed");
				subtime = rs.getString("subtime");
				subtime = subtime.substring(0,subtime.length()-2);
				int answer = rs.getInt("answer");
				String ansList = rs.getString("ansList");
				int point = rs.getInt("point");
				
				userAns += answer+"@";
				yourScore += point;
				
				//select question content by (qid,seed)
				sql = "select content,hint,explanation from seed where qid="+qid+" and seed="+seed;
				stmt = conn.prepareStatement(sql);
				ResultSet rs2 = stmt.executeQuery();
				if(rs2.next()) {
					String content = rs2.getString("content");
					String hint = rs2.getString("hint");
					String explanation = rs2.getString("explanation");
					
					tmpQs += content+"@";
					tmpHints += hint+"@";
					if(point>0)
						explns += explanation+"@";
				}			
				
				//get answers by (qid,seed,ansid)
				String[] ansId = ansList.split(",");
				String answers = "";
				
				for(int i=0;i<ansId.length;i++) {
					sql = "select content, expln from answer where qid="+qid+" and seed="+seed+" and ansid="+ansId[i];
					stmt = conn.prepareStatement(sql);
					ResultSet rs3 = stmt.executeQuery();
					if(rs3.next()) {
						String content = rs3.getString("content");
						String expln = rs3.getString("expln");
						answers += content+"@";
						if(answer==i && point<=0)	//user chose this wrong answer, need to show this answer's expln
							explns += expln+"@";
					}
				}
				tmpAnsList.add(answers);
				
				//get totalScore
				int corrPts = 0;
				sql = "select corrPts from assessment where aid="+aid;
				stmt = conn.prepareStatement(sql);
				ResultSet rs4 = stmt.executeQuery();
				if(rs4.next())
					corrPts = rs4.getInt("corrPts");
								
				sql = "select count(*) from asshasq where aid="+aid;
				stmt = conn.prepareStatement(sql);
				ResultSet rs5 = stmt.executeQuery();
				if(rs5.next()) {
					int total = corrPts * rs5.getInt(1);
					if(total>0)
						totalScore = total;
				}
			}
			
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		
		submissionDetail.add(tmpQs);
		submissionDetail.add(tmpHints);
		for(int i=0;i<tmpAnsList.size();i++)
			submissionDetail.add(tmpAnsList.get(i));
		submissionDetail.add(userAns);
		submissionDetail.add(explns);
		
		//cut tail @
		for(int i=0;i<submissionDetail.size();i++) {
			String s = submissionDetail.get(i);
			s = s.substring(0,s.length()-1);
			submissionDetail.remove(i);
			submissionDetail.add(i, s);
		}
		
		submissionDetail.add(yourScore+"@"+totalScore+"@"+subtime);
		
		//System.out.println("=======submission detail========");
		//for(int i=0;i<submissionDetail.size();i++)
			//System.out.println(submissionDetail.get(i));
		
		return submissionDetail;
	}

	
	public static void main(String[] args) {
		System.out.println("test StudentAction");
		StudentAction sa = new StudentAction();
		//sa.viewScoreList("mjones", "CSC540");
		//System.out.println(sa.viewSubmissionList("mjones", "CSC540"));
		///*
		//List<List<String>> homeworks = sa.generateQuestion("1");
		//for(int i=0;i<homeworks.size();i++)
			//System.out.println(homeworks.get(i));
			//*/
		
		List<String> submissionDetail = sa.viewSubmissionDetail("3","mjones");
		for(int i=0;i<submissionDetail.size();i++)
			System.out.println(submissionDetail.get(i));
			//*/
	}

	public boolean isCourseSelected(String token, String uid) {
		String sql = "select cid from stusecour where sid=? and cid in (select cid from course where token=?)";	
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
