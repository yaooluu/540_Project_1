package edu.ncsu.gradiance.web;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.*;

import com.sun.jersey.api.view.Viewable;

import edu.ncsu.gradiance.action.*;

@Path("/")
public class MainService {
	
	/**
	 * @author yaolu
	 * @throws URISyntaxException 
	 * @function forward to index or login page
	 */
    @GET
    @Path("index")
    public Response index(@Context HttpServletRequest request) {
    	System.out.println("/index called at: "+System.currentTimeMillis());	
    	//check if logged in
    	String uid = (String)request.getSession().getAttribute("curUser");
    	Integer authority = (Integer)request.getSession().getAttribute("curAuthority");
    	String forwardPage = "/login.jsp";
  
    	if(uid != null) {
    		if(authority.intValue() == 0)		
    			forwardPage = "/indexTeacher.jsp";
    		else if(authority.intValue() == 1) 
    			forwardPage = "/indexTA.jsp";
    		else if(authority.intValue() == 2) 
    			forwardPage = "/indexStudent.jsp";
    	}
    	return Response.ok(new Viewable(forwardPage, null)).build();
    }
	
	/**
	 * @author yaolu
	 * @function user login verification
	 */
	@POST
	@Path("login")
	public Response login(@Context HttpServletRequest request,
			@FormParam("uname") String uid, @FormParam("upass") String upass) throws Exception { 
		System.out.println("/login called at: "+System.currentTimeMillis());
		
		int authority = new LoginAction().verify(uid, upass);
		String forwardPage = "/indexStudent.jsp";	//set student page as default
		
		if(authority>0) {	 
			request.getSession().setAttribute("curUser", uid);	//login succeed.
			request.getSession().setAttribute("curAuthority", authority);
		} else {								
			forwardPage = "/login.jsp";								//login failed.
			request.setAttribute("loginResult", "Login Failed!");
		}
		
		if(authority == 0)											//switch forward page to corresponding role
			forwardPage = "/indexTeacher.jsp";
		else if(authority == 1) 
			forwardPage = "/indexTA.jsp";
		
		return Response.ok(new Viewable(forwardPage, null)).build();
	}
	
	/**
	 * @author yaolu
	 * @function register user
	 */
	@POST
	@Path("register")
	public Response register(@Context HttpServletRequest request,
			@FormParam("authority") int authority,@FormParam("name") String name, 
			@FormParam("upass") String upass, @FormParam("uid") String uid) throws Exception { 
		System.out.println("/register called at: "+System.currentTimeMillis());
		
		if(new RegisterAction().register(uid, name, upass, authority)) {
			request.setAttribute("registerResult", "Register succeed! Please Log in.");	
		    return Response.ok(new Viewable("/login.jsp", null)).build();
		}else {
			request.setAttribute("registerResult", "Register Failed!");
		    return Response.ok(new Viewable("/register.jsp", null)).build();
		}
	}
	
	/**
	 * @author yaolu
	 * @function add course by token
	 */
	@POST
	@Path("addCourse")
	public Response addCourse(@Context HttpServletRequest request,
			@FormParam("token") String token) throws Exception { 
		System.out.println("/addCourse called at: "+System.currentTimeMillis());
		
		String curUser = (String)request.getSession().getAttribute("curUser");
		String addCourseResult = "Add Course Failed!";
		if(curUser != null && new AddCourseAction().addCourse(token,curUser))
			addCourseResult = "Course Added! Please go back to previous page.";
			
		request.setAttribute("addCourseResult", addCourseResult);	
	    return Response.ok(new Viewable("/addCourse.jsp", null)).build();
	}


}
