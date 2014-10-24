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
    	String forwardPage = "/usrLog.jsp";
  
    	if(uid != null) {
    		if(authority.intValue() == 0)		
    			forwardPage = "/indexTeacher.jsp";
    		else if(authority.intValue() == 1) 
    			forwardPage = "/indexTA.jsp";
    		else if(authority.intValue() == 2) 
    			forwardPage = "/indexStu.jsp";
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
			@FormParam("uid") String uid, @FormParam("upass") String upass) throws Exception { 
		System.out.println("/login called at: "+System.currentTimeMillis());
		
		int authority = new LoginAction().verify(uid, upass);
		String forwardPage = "/indexStu.jsp";	//set student page as default
		
		if(authority>0) {	 	//login succeed.
			request.getSession().setAttribute("curUser", uid);
			request.getSession().setAttribute("curUserName", new LoginAction().getUserName(uid));
			request.getSession().setAttribute("curAuthority", authority);
			
			if(authority == 0)											//switch forward page to corresponding role
				forwardPage = "/indexTeacher.jsp";
			else if(authority == 1) 
				forwardPage = "/indexTA.jsp";
			else {
				forwardPage = "/indexStu.jsp";
				request.setAttribute("selectedCourses", new StudentAction().getSelectedCourses(uid));
			}
		} else {								
			forwardPage = "/usrLog.jsp";								//login failed.
			request.setAttribute("loginResult", "Login Failed!");
		}

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
		    return Response.ok(new Viewable("/usrLog.jsp", null)).build();
		}else {
			request.setAttribute("registerResult", "Register Failed!");
		    return Response.ok(new Viewable("/usrReg.jsp", null)).build();
		}
	}
	
}
