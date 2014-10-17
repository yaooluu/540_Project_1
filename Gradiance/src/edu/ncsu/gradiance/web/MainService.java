package edu.ncsu.gradiance.web;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.*;
import com.sun.jersey.api.view.Viewable;

@Path("/")
public class MainService {
	
	/**
	 * @author yaolu
	 * @function forward to index page
	 */
    @GET
    @Path("index")
    public Viewable index(@Context HttpServletRequest request) {
    	System.out.println("/index called");
    	
    	//if use code below, html page should contain request.getAttribute("title")
    	request.setAttribute("title", new String("This title comes from jersey!")); 

    	//if use code below, html page should contain session.getAttribute("title") 
    	//request.getSession().setAttribute("title", new String("This title comes from jersey!"));      
        
    	//more knowledge: http://www.coderanch.com/t/462078/Struts/Difference-Request-scope-Session-scope
    	
    	//here the 2nd param named will be "it" in html
    	return new Viewable("/index.jsp", new String("2nd param from server!!!"));	
    }
	
	/**
	 * @author yaolu
	 * @function user login verification
	 */
	@POST
	@Path("login")
	public String login(@FormParam("uname") String uname, @FormParam("upass") String upass)
	{ 
		System.out.println(uname+", "+upass);
		//here we will do database query and verify login, and there are two ways after that:
		//1. use Viewable to navigate to different pages based on verification result
		//2. simply return a message, let jsp do the navigate job (¡ú_¡ú)
		return "Login Succeed!";
	}


}
