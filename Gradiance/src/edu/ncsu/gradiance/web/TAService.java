package edu.ncsu.gradiance.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.*;

import com.sun.jersey.api.view.Viewable;

import edu.ncsu.gradiance.action.*;

@Path("/TA")
public class TAService {
		
	/**
	 * @author yaolu
	 * @function add course by token
	 */
	@POST
	@Path("addCourse")
	public Response addCourse(@Context HttpServletRequest request,
			@FormParam("token") String token, @FormParam("isTACourse") String isTACourse) throws Exception { 
		System.out.println("/TA/addCourse called at: "+System.currentTimeMillis());
		
		String uid = (String)request.getSession().getAttribute("curUser");
		String addCourseResult = "Please Login first!";
		if(uid != null) {
			
			if(new TAAction().isTACourse(token,uid) == false) {
				if(isTACourse.compareTo("0")==0)
					addCourseResult = new StudentAction().addCourse(token,uid);
				else
					addCourseResult = new TAAction().addTACourse(token,uid);
			} else
				addCourseResult = "Course already selected as TA!";
			
			request.setAttribute("addCourseResult", addCourseResult);	
			request.setAttribute("selectedCourses", new StudentAction().getSelectedCourses(uid));
			request.setAttribute("TACourses", new TAAction().getTACourses(uid));
		} 
				
	    return Response.ok(new Viewable("/indexTA.jsp", null)).build();
	}
	
	/**
	 * @author yaolu
	 * @function show course options
	 */
	@POST
	@Path("courseOption")
	public Response courseOption(@Context HttpServletRequest request,
			@FormParam("cid") String cid, @FormParam("isTACourse") String isTACourse) throws Exception { 
		System.out.println("/TA/courseOption called at: "+System.currentTimeMillis());
System.out.println("isTACourse:"+isTACourse);
		request.getSession().setAttribute("cid", cid);
		request.getSession().setAttribute("courseTitle", new StudentAction().getCourseTitle(cid));
		
		request.getSession().setAttribute("isTACourse", isTACourse);
		if(isTACourse.compareTo("0")==0) {
			String uid = (String) request.getSession().getAttribute("curUser");
			new NotifAction().checkUrgentDue(uid,cid);
			
			//get nofitications for user and don't delete from db
			String notif = new NotifAction().getNotif(uid,false);
			request.getSession().setAttribute("notif", notif);
			
			return Response.ok(new Viewable("/optStu.jsp", null)).build();
		}
		else {
			return Response.ok(new Viewable("/optTA.jsp", null)).build();
		}
	}
	
	/**
	 * @author yaolu
	 * @function view homework's 
	 */
	@POST
	@Path("viewHwTA")
	public Response viewHwTA(@Context HttpServletRequest request,@FormParam("aid") String aid) throws Exception { 
		System.out.println("/prof/viewHwTA called at: "+System.currentTimeMillis());
		
		String cid = (String)request.getSession().getAttribute("cid");
		request.setAttribute("homeworkList", new ProfessorAction().getHomeworkList(cid));
		
		if(aid!=null && aid.length()>0) {
			List<String> homeworkBasic = new ProfessorAction().getHomeworkBasic(aid);
			request.setAttribute("homeworkBasic", homeworkBasic);	
			
			String homeworkQuestion = new ProfessorAction().getHomeworkQuestion(aid);
			request.setAttribute("homeworkQuestion", homeworkQuestion);	
		}
		
	    return Response.ok(new Viewable("/viewHwTA.jsp", null)).build();
	}
}