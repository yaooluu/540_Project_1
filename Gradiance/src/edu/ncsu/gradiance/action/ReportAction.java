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
		                sqlResult += rs.getInt(i) + " @";
		            else
		            	sqlResult += rs.getString(i) + " @";
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
		String[] sql = new String[10];
		
		
		//Find students who did not take Homework 1.
		sql[1] = "";
		sql[1] += "SELECT STU.sid AS Student_ID,  STU.name AS Student_Name, ASS.title AS Homework_1"
				+ " FROM gradiance.student STU, gradiance.assessment ASS"
				+ " WHERE ASS.aid=1"
				+ " AND STU.sid not in "
				+ " (SELECT ATT.sid"
				+ " FROM gradiance.attempt ATT"
				+ " WHERE ATT.aid=1"
				+ " )";

		//Find students who scored the maximum score on the first attempt for Homework 1.
		sql[2] = "";
		sql[2] += "SELECT TEMP.sid AS Student_ID, STU.name AS Student_Name, ASS.title AS Homework_1, TEMP.ScoreAtt1 AS Max_Score"
				+ " FROM(	SELECT ATT.sid, ATT.aid, SUM(ATT.point) AS ScoreAtt1"
				+ " 		FROM gradiance.attempt ATT"
				+ " 		WHERE ATT.aid=1 AND ATT.atid=1"
				+ " 		GROUP BY ATT.sid, ATT.aid"
				+ " 	) AS TEMP, gradiance.assessment ASS, gradiance.student STU"
				+ " WHERE ASS.aid=TEMP.aid"
				+ " AND STU.sid=TEMP.sid"
				+ " AND TEMP.ScoreAtt1 >= All(	SELECT TEMP2.ScoreAtt1"
				+ " 						    FROM(	SELECT ATT2.sid, ATT2.aid, SUM(ATT2.point) AS ScoreAtt1"
				+ " 									FROM gradiance.attempt ATT2"
				+ " 									WHERE ATT2.aid=1 AND ATT2.atid=1"
				+ " 									GROUP BY ATT2.sid, ATT2.aid"
				+ " 							) AS TEMP2 )";
								

		//Find students who scored the maximum score on the first attempt for each homework.
		sql[3] = "";
		sql[3] += "SELECT TEMP.sid AS Student_ID, STU.name AS Student_Name, ASS.title AS Homework, TEMP.ScoreAtt1 AS Max_Score"
				+ " FROM (	SELECT ATT.sid, ATT.aid, SUM(ATT.point) AS ScoreAtt1"
				+ " 		FROM gradiance.attempt ATT"
				+ "         WHERE ATT.atid=1"
				+ " 		GROUP BY ATT.aid, ATT.sid"
				+ " 	) AS TEMP, gradiance.assessment ASS, gradiance.student STU"
				+ " WHERE ASS.aid=TEMP.aid"
				+ " AND STU.sid=TEMP.sid"
				+ " AND TEMP.ScoreAtt1>=(	SELECT MAX(TEMP2.ScoreAtt1)"
				+ " 						FROM (	SELECT ATT2.sid, ATT2.aid, SUM(ATT2.point) AS ScoreAtt1"
				+ " 								FROM gradiance.attempt ATT2"
				+ " 								WHERE ATT2.atid=1"
				+ " 								GROUP BY ATT2.aid, ATT2.sid"
				+ " 						) AS TEMP2"
				+ " 						WHERE TEMP.aid=TEMP2.aid"
				+ " 						GROUP BY TEMP2.aid)";

		//For each student, show total score for each homework and average score overall homework.
		sql[4] = "";
		sql[4] += "	SELECT TEMPOUT.sid AS Student_ID, STU.name AS Student_Name, ASS.title AS Homework,"
				+ "	(CASE "
				+ "	WHEN TEMPOUT.scoreSelect='latest attempt'"
				+ "		THEN(	SELECT TEMP.ScoreAtt1 AS LatestScore"
				+ "				FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, ASS.scoreSelect, SUM(ATT.point) AS ScoreAtt1"
				+ "						FROM gradiance.attempt ATT, gradiance.assessment ASS"
				+ "						WHERE ATT.aid=ASS.aid AND ASS.scoreSelect='latest attempt'"
				+ "						GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP"
				+ "				WHERE TEMP.atid>= All (	SELECT TEMP2.atid"
				+ "										FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, ASS.scoreSelect, SUM(ATT.point) AS ScoreAtt1"
				+ "												FROM gradiance.attempt ATT, gradiance.assessment ASS"
				+ "												WHERE ATT.aid=ASS.aid AND ASS.scoreSelect='latest attempt'"
				+ "										GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP2"
				+ "										WHERE TEMP.sid=TEMP2.sid AND TEMP.aid=TEMP2.aid) AND TEMP.sid=TEMPOUT.sid"
				+ "				GROUP BY TEMP.sid, TEMP.aid"
				+ "		)"
				+ "	WHEN TEMPOUT.scoreSelect='average score'"
				+ "		THEN(	SELECT AVG(TEMP.ScoreAtt1) AS AVGScore"
				+ "				FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, ASS.scoreSelect, SUM(ATT.point) AS ScoreAtt1"
				+ "						FROM gradiance.attempt ATT, gradiance.assessment ASS"
				+ "						WHERE ATT.aid=ASS.aid"
				+ "						GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP"
				+ "				WHERE TEMP.scoreSelect='average score' AND TEMP.sid=TEMPOUT.sid"
				+ "				GROUP BY TEMP.sid, TEMP.aid"
				+ "			)"
				+ "	ELSE"
				+ "			(	SELECT MAX(ScoreAtt1) AS MAXScore"
				+ "				FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, ASS.scoreSelect, SUM(ATT.point) AS ScoreAtt1"
				+ "						FROM gradiance.attempt ATT, gradiance.assessment ASS"
				+ "						WHERE ATT.aid=ASS.aid"
				+ "						GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP"
				+ "				WHERE TEMP.scoreSelect='maximum score' AND TEMP.sid=TEMPOUT.sid"
				+ "				GROUP BY TEMP.sid, TEMP.aid"
				+ "			)"
				+ "	END) AS TotalScore"
				+ "	FROM(	SELECT TEMP1.sid, TEMP1.aid, TEMP1.atid1, TEMP1.score1, TEMP2.atid2,TEMP2.score2, TEMP2.scoreSelect"
				+ "			FROM(	SELECT TEMP.sid, TEMP.aid, TEMP.atid as atid1, ASS.scoreSelect as selection1, TEMP.ScoreAtt1 as score1"
				+ "					FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, SUM(ATT.point) AS ScoreAtt1"
				+ "							FROM gradiance.attempt ATT"
				+ "							GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP, gradiance.assessment ASS"
				+ "					WHERE TEMP.aid=ASS.aid	)	AS TEMP1, "
				+ "				(	SELECT TEMP.sid as sid2, TEMP.aid as aid2, TEMP.atid as atid2, ASS.scoreSelect, TEMP.ScoreAtt1 as score2"
				+ "					FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, SUM(ATT.point) AS ScoreAtt1"
				+ "							FROM gradiance.attempt ATT"
				+ "							GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP, gradiance.assessment ASS"
				+ "					WHERE TEMP.aid=ASS.aid	)	AS TEMP2"
				+ "			WHERE TEMP1.sid=TEMP2.sid2 AND TEMP1.aid=TEMP2.aid2 ) AS TEMPOUT, gradiance.assessment ASS, gradiance.student STU"
				+ " WHERE ASS.aid=TEMPOUT.aid AND STU.sid=TEMPOUT.sid"
				+ " GROUP BY TEMPOUT.sid, TEMPOUT.aid"
				+ " UNION"
				+ " SELECT TEMPOUTOUT.sid AS Student_ID, TEMPOUTOUT.name AS Student_Name, 'AVG_Score', AVG(TEMPOUTOUT.TotalScore) AS AVG_Score"
				+ " FROM(	SELECT TEMPOUT.sid, STU.name, ASS.title,"
				+ "			(CASE "
				+ "				WHEN TEMPOUT.scoreSelect='latest attempt'"
				+ "					THEN(	SELECT TEMP.ScoreAtt1 AS LatestScore"
				+ "							FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, ASS.scoreSelect, SUM(ATT.point) AS ScoreAtt1"
				+ "									FROM gradiance.attempt ATT, gradiance.assessment ASS"
				+ "									WHERE ATT.aid=ASS.aid AND ASS.scoreSelect='latest attempt'"
				+ "									GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP"
				+ "							WHERE TEMP.atid>= All (	SELECT TEMP2.atid"
				+ "													FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, ASS.scoreSelect, SUM(ATT.point) AS ScoreAtt1"
				+ "															FROM gradiance.attempt ATT, gradiance.assessment ASS"
				+ "															WHERE ATT.aid=ASS.aid AND ASS.scoreSelect='latest attempt'"
				+ "													GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP2"
				+ "													WHERE TEMP.sid=TEMP2.sid AND TEMP.aid=TEMP2.aid) AND TEMP.sid=TEMPOUT.sid"
				+ "							GROUP BY TEMP.sid, TEMP.aid"
				+ "					)"
				+ "				WHEN TEMPOUT.scoreSelect='average score'"
				+ "					THEN(	SELECT AVG(TEMP.ScoreAtt1) AS AVGScore"
				+ "							FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, ASS.scoreSelect, SUM(ATT.point) AS ScoreAtt1"
				+ "									FROM gradiance.attempt ATT, gradiance.assessment ASS"
				+ "									WHERE ATT.aid=ASS.aid"
				+ "									GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP"
				+ "							WHERE TEMP.scoreSelect='average score' AND TEMP.sid=TEMPOUT.sid"
				+ "							GROUP BY TEMP.sid, TEMP.aid"
				+ "						)"
				+ "				ELSE"
				+ "						(	SELECT MAX(ScoreAtt1) AS MAXScore"
				+ "							FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, ASS.scoreSelect, SUM(ATT.point) AS ScoreAtt1"
				+ "									FROM gradiance.attempt ATT, gradiance.assessment ASS"
				+ "									WHERE ATT.aid=ASS.aid"
				+ "									GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP"
				+ "							WHERE TEMP.scoreSelect='maximum score' AND TEMP.sid=TEMPOUT.sid"
				+ "							GROUP BY TEMP.sid, TEMP.aid"
				+ "						)"
				+ "				END) AS TotalScore"
				+ "		FROM(	SELECT TEMP1.sid, TEMP1.aid, TEMP1.atid1, TEMP1.score1, TEMP2.atid2,TEMP2.score2, TEMP2.scoreSelect"
				+ "				FROM(	SELECT TEMP.sid, TEMP.aid, TEMP.atid as atid1, ASS.scoreSelect as selection1, TEMP.ScoreAtt1 as score1"
				+ "						FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, SUM(ATT.point) AS ScoreAtt1"
				+ "								FROM gradiance.attempt ATT"
				+ "								GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP, gradiance.assessment ASS"
				+ "						WHERE TEMP.aid=ASS.aid	)	AS TEMP1,"
				+ "					(	SELECT TEMP.sid as sid2, TEMP.aid as aid2, TEMP.atid as atid2, ASS.scoreSelect, TEMP.ScoreAtt1 as score2"
				+ "						FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, SUM(ATT.point) AS ScoreAtt1"
				+ "								FROM gradiance.attempt ATT"
				+ "								GROUP BY ATT.sid, ATT.aid, ATT.atid ) AS TEMP, gradiance.assessment ASS"
				+ "						WHERE TEMP.aid=ASS.aid	)	AS TEMP2"
				+ "					WHERE TEMP1.sid=TEMP2.sid2 AND TEMP1.aid=TEMP2.aid2 ) AS TEMPOUT, gradiance.assessment ASS, gradiance.student STU"
				+ "		WHERE ASS.aid=TEMPOUT.aid AND STU.sid=TEMPOUT.sid"        
				+ "		GROUP BY TEMPOUT.sid, TEMPOUT.aid) AS TEMPOUTOUT"
				+ "	GROUP BY TEMPOUTOUT.sid";

		//For each homework and question, show the maximum and minimum score.
		sql[5] = "";
		sql[5] += "SELECT ASS.title AS Homework_Question, MAX(TEMP.ScoreAtt1) AS Max_Score, MIN(TEMP.ScoreAtt1) AS Min_Score"
				+ " FROM(	SELECT ATT.sid, ATT.aid, ATT.atid, SUM(ATT.point) AS ScoreAtt1"
				+ " 		FROM gradiance.attempt ATT"
				+ " 		GROUP BY ATT.aid, ATT.sid, ATT.atid) AS TEMP, gradiance.assessment AS ASS"
				+ " WHERE TEMP.aid=ASS.aid"
				+ " GROUP BY TEMP.aid"
				+ " UNION"
				+ " SELECT SEE.content, MAX(ATT.point), MIN(ATT.point)"
				+ " FROM gradiance.attempt ATT, gradiance.assessment AS ASS, gradiance.seed AS SEE"
				+ " WHERE ATT.aid=ASS.aid AND ATT.qid=SEE.qid"
				+ " GROUP BY ATT.aid, ATT.qid";

		//For each homework and question, show average number of attempts.
		sql[6] = "";
		sql[6] += "SELECT ASS.title AS Homework_Question, COUNT(*) AS Num_of_Attempt"
		+ " FROM(	SELECT ATT.aid"
		+ " 			FROM gradiance.attempt AS ATT"
		+ " 			GROUP BY ATT.aid, ATT.sid, ATT.atid) AS TEMP, gradiance.assessment AS ASS"
		+ " WHERE TEMP.aid=ASS.aid"
		+ " GROUP BY TEMP.aid"
		+ " UNION"
		+ " SELECT SEE.content, TEMP.TEMPNUM"
		+ " FROM(	SELECT ATT.sid, ATT.aid, ATT.qid, COUNT(*) AS TEMPNUM"
				+ " FROM gradiance.attempt ATT"
				+ " GROUP BY ATT.aid, ATT.qid) AS TEMP, gradiance.assessment AS ASS, gradiance.seed AS SEE"
		+ " WHERE TEMP.aid=ASS.aid"
		+ " AND TEMP.qid=SEE.qid";

	
		return sql[Integer.parseInt(rptId)];
	}

}
