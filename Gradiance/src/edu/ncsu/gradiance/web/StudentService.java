package edu.ncsu.gradiance.web;

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
	    return Response.ok(new Viewable("/indexStudent.jsp", null)).build();
	}
	
	/**
	 * @author yaolu
	 * @function add course by token
	 */
	@POST
	@Path("viewCourse")
	public Response viewCourse(@Context HttpServletRequest request,
			@FormParam("cid") String cid) throws Exception { 
		System.out.println("/student/addCourse called at: "+System.currentTimeMillis());
		
		String curUser = (String)request.getSession().getAttribute("curUser");
		String addCourseResult = "Please Login first!";
		if(curUser != null)
			addCourseResult = new StudentAction().viewCourse(cid);
			
		request.setAttribute("addCourseResult", addCourseResult);	
	    return Response.ok(new Viewable("/indexStudent.jsp", null)).build();
	}


}
