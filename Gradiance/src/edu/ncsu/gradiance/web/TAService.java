package edu.ncsu.gradiance.web;


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
			if(isTACourse.compareTo("0")==0)
				addCourseResult = new StudentAction().addCourse(token,uid);
			else
				addCourseResult = new TAAction().addTACourse(token,uid);
			
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

		request.getSession().setAttribute("cid", cid);
		request.getSession().setAttribute("courseTitle", new StudentAction().getCourseTitle(cid));
		
		if(isTACourse.compareTo("0")==0)
			return Response.ok(new Viewable("/optStu.jsp", null)).build();
		else
			return Response.ok(new Viewable("/optTA.jsp", null)).build();
	}
}