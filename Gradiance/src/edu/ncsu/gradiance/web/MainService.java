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
    	if(request.getSession().getAttribute("curUser") != null )
    		return Response.ok(new Viewable("/index.jsp", null)).build();
    	else
    		return Response.ok(new Viewable("/login.jsp", null)).build();
    }
	
	/**
	 * @author yaolu
	 * @function user login verification
	 */
	@POST
	@Path("login")
	public Response login(@Context HttpServletRequest request,
			@FormParam("uname") String uname, @FormParam("upass") String upass) throws Exception { 
		System.out.println("/login called at: "+System.currentTimeMillis());
		
		if(new LoginAction().verify(uname, upass)) {
			request.getSession().setAttribute("curUser", uname);	
		    return Response.ok(new Viewable("/index.jsp", null)).build();
		}else {
			request.setAttribute("loginResult", "Login Failed!");
		    return Response.ok(new Viewable("/login.jsp", null)).build();
		}
	}
	
	/**
	 * @author yaolu
	 * @function register user
	 */
	@POST
	@Path("register")
	public Response register(@Context HttpServletRequest request,
			@FormParam("authority") String authority,@FormParam("uname") String uname, 
			@FormParam("upass") String upass, @FormParam("uid") String uid) throws Exception { 
		System.out.println("/register called at: "+System.currentTimeMillis());
		
		//if(new RegisterAction().register(uid, uname, upass, authority)) {
		if(false){ //to be continued...
			request.setAttribute("registerResult", "Register succeed! Please Log in.");	
		    return Response.ok(new Viewable("/login.jsp", null)).build();
		}else {
			request.setAttribute("registerResult", "Register Failed!");
		    return Response.ok(new Viewable("/register.jsp", null)).build();
		}
	}


}
