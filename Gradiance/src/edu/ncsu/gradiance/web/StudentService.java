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
		if(curUser != null)
			addCourseResult = new StudentAction().addCourse(token,curUser);
			
		request.setAttribute("addCourseResult", addCourseResult);	
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
	    return Response.ok(new Viewable("/optStu.jsp", null)).build();
	}

	/**
	 * @author yaolu
	 * @function show final scores of all homework
	 */
	@POST
	@Path("viewScore")
	public Response viewScore(@Context HttpServletRequest request) throws Exception { 
		System.out.println("/student/courseOption called at: "+System.currentTimeMillis());
		
		String cid = (String) request.getSession().getAttribute("cid");
		String sid = (String) request.getSession().getAttribute("curUser");
		List<String> scores = new StudentAction().viewScore(sid, cid);
		
		request.setAttribute("scores", scores);
	    return Response.ok(new Viewable("/viewScoreStu.jsp", null)).build();
	}
	
	/**
	 * @author yaolu
	 * @function show all current homework
	 */
	@POST
	@Path("viewHomework")
	public Response viewHomework(@Context HttpServletRequest request) throws Exception { 
		System.out.println("/student/viewHomework called at: "+System.currentTimeMillis());
		
		String cid = (String) request.getSession().getAttribute("cid");
		List<String> homeworkList = new StudentAction().viewHomework(cid);
		
		request.setAttribute("homeworkList", homeworkList);
	    return Response.ok(new Viewable("/viewHwStu.jsp", null)).build();
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
	 * @function view past submissions
	 */
	@POST
	@Path("viewSubmission")
	public Response viewSubmission(@Context HttpServletRequest request,
			@FormParam("aid") String aid) throws Exception {  
		System.out.println("/student/viewSubmission called at: "+System.currentTimeMillis());
		
		String sid = (String) request.getSession().getAttribute("curUser");
		String cid = (String) request.getSession().getAttribute("cid");
		List<String> submissionList = new StudentAction().viewSubmission(sid, cid);
		
		request.setAttribute("submissionList", submissionList);
	    return Response.ok(new Viewable("/viewSubStu.jsp", null)).build();
	}

}
