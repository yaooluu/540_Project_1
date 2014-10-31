package edu.ncsu.gradiance.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.*;

import com.sun.jersey.api.view.Viewable;

import edu.ncsu.gradiance.action.*;

@Path("/student")
public class StudentService {
		
	/**
	 * @author yaolu
	 * @function add course by token
	 */
	@POST
	@Path("addCourse")
	public Response addCourse(@Context HttpServletRequest request,
			@FormParam("token") String token) throws Exception { 
		System.out.println("/student/addCourse called at: "+System.currentTimeMillis());
		
		String curUser = (String)request.getSession().getAttribute("curUser");
		String addCourseResult = "Please Login first!";
		if(curUser != null) {
			if(new StudentAction().isCourseSelected(token,curUser)==false)
				addCourseResult = new StudentAction().addCourse(token,curUser);
			else 
				addCourseResult = "Course already enrolled!";
		}
			
		request.setAttribute("addCourseResult", addCourseResult);	
		
		//refresh selectedCourses and send it to indexStu.jsp
		String uid = (String) request.getSession().getAttribute("curUser");
		request.setAttribute("selectedCourses", new StudentAction().getSelectedCourses(uid));
		
	    return Response.ok(new Viewable("/indexStu.jsp", null)).build();
	}
	
	/**
	 * @author yaolu
	 * @function show course options
	 */
	@POST
	@Path("courseOption")
	public Response courseOption(@Context HttpServletRequest request,
			@FormParam("cid") String cid) throws Exception { 
		System.out.println("/student/courseOption called at: "+System.currentTimeMillis());
		
		request.getSession().setAttribute("cid", cid);
		request.getSession().setAttribute("courseTitle", new StudentAction().getCourseTitle(cid));
		
		String uid = (String) request.getSession().getAttribute("curUser");
		new NotifAction().checkUrgentDue(uid,cid);
		
		//get nofitications for user and don't delete from db
		String notif = new NotifAction().getNotif(uid,false);
		request.getSession().setAttribute("notif", notif);
		
	    return Response.ok(new Viewable("/optStu.jsp", null)).build();
	}

	/**
	 * @author yaolu
	 * @function show final scores of all homework
	 */
	@POST
	@Path("viewScoreList")
	public Response viewScoreList(@Context HttpServletRequest request) throws Exception { 
		System.out.println("/student/courseOption called at: "+System.currentTimeMillis());
		
		String cid = (String) request.getSession().getAttribute("cid");
		String sid = (String) request.getSession().getAttribute("curUser");
		List<String> scoreList = new StudentAction().viewScoreList(sid, cid);
		
		request.setAttribute("scoreList", scoreList);
	    return Response.ok(new Viewable("/viewScoreStu.jsp", null)).build();
	}
	
	/**
	 * @author yaolu
	 * @function show all current homework
	 */
	@POST
	@Path("viewHomeworkList")
	public Response viewHomeworkList(@Context HttpServletRequest request) throws Exception { 
		System.out.println("/student/viewHomeworkList called at: "+System.currentTimeMillis());
		
		String cid = (String) request.getSession().getAttribute("cid");
		String sid = (String) request.getSession().getAttribute("curUser");
		List<String> homeworkList = new StudentAction().viewHomeworkList(cid,sid);
		
		request.setAttribute("homeworkList", homeworkList);
	    return Response.ok(new Viewable("/viewHwStu.jsp", null)).build();
	}

	/**
	 * @author yaolu
	 * @function view past submissions
	 */
	@POST
	@Path("viewSubmissionList")
	public Response viewSubmissionList(@Context HttpServletRequest request,
			@FormParam("aid") String aid) throws Exception {  
		System.out.println("/student/viewSubmissionList called at: "+System.currentTimeMillis());
		
		String sid = (String) request.getSession().getAttribute("curUser");
		String cid = (String) request.getSession().getAttribute("cid");
		List<String> submissionList = new StudentAction().viewSubmissionList(sid, cid);
		
		request.setAttribute("submissionList", submissionList);
	    return Response.ok(new Viewable("/viewSubStu.jsp", null)).build();
	}
	


	/**
	 * @author yaolu
	 * @function attempt homework
	 */
	@POST
	@Path("attemptHomework")
	public Response attemptHomework(@Context HttpServletRequest request,
			@FormParam("aid") String aid) throws Exception {  
		System.out.println("/student/attemptHomework called at: "+System.currentTimeMillis());
		
		List<List<String>> homeworkContent = new StudentAction().generateQuestion(aid);
		
		request.setAttribute("homeworkContent", homeworkContent);
	    return Response.ok(new Viewable("/atmpHwStu.jsp", null)).build();
	}
	
	/**
	 * @author yaolu
	 * @function submit homework
	 */
	@POST
	@Path("submitHomework")
	public Response submitHomework(@Context HttpServletRequest request,
			@FormParam("ansPosList") String ansPosList,@FormParam("points") String points,
			@FormParam("userAnsAndIdLists") String userAnsAndIdLists) throws Exception {  
		System.out.println("/student/submitHomework called at: "+System.currentTimeMillis());
		
		//System.out.println(ansPosList);
		//System.out.println(points);
		//System.out.println(userAnsAndIdLists);
		
		String sid = (String) request.getSession().getAttribute("curUser"); 
		String atid = new StudentAction().submitHomework(sid,ansPosList,points,userAnsAndIdLists);
		
		List<String> submissionDetail = new StudentAction().viewSubmissionDetail(atid, sid);
		request.setAttribute("submissionDetail", submissionDetail);
	
	    return Response.ok(new Viewable("/viewSubDtlStu.jsp", null)).build();
	}

	/**
	 * @author yaolu
	 * @function view submission details
	 */
	@POST
	@Path("viewSubmissionDetail")
	public Response viewSubmissionDetail(@Context HttpServletRequest request,
			@FormParam("atid") String atid) throws Exception {  
		System.out.println("/student/viewSubmissionDetail called at: "+System.currentTimeMillis());
		
		String sid = (String) request.getSession().getAttribute("curUser");
		List<String> submissionDetail = new StudentAction().viewSubmissionDetail(atid, sid);
		
		request.setAttribute("submissionDetail", submissionDetail);
	    return Response.ok(new Viewable("/viewSubDtlStu.jsp", null)).build();
	}
}
