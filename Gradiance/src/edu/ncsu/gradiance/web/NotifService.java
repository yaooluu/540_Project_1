package edu.ncsu.gradiance.web;


import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.*;

import com.sun.jersey.api.view.Viewable;

import edu.ncsu.gradiance.action.*;

@Path("/Notif")
public class NotifService {
		
	/**
	 * @author yaolu
	 * @function get new Notifications of user if have
	 */
	@POST
	@Path("viewNotif")
	public Response viewNotif(@Context HttpServletRequest request) throws Exception { 
		System.out.println("/Notif/viewNotif called at: "+System.currentTimeMillis());
		
    	//check if logged in
    	String uid = (String)request.getSession().getAttribute("curUser");
    	Integer authority = (Integer)request.getSession().getAttribute("curAuthority");
    	String forwardPage = "/usrLog.jsp";
  
    	String isTACourse = (String)request.getSession().getAttribute("isTACourse");
    	
    	if(uid != null) {
    		if(authority.intValue() == 0) {		
    			forwardPage = "/viewNotifProf.jsp";
    		}			
    		else if(authority == 1 && isTACourse!=null && isTACourse.compareTo("1")==0) {
				forwardPage = "/viewNotifTA.jsp";
			}
    		else {
    			forwardPage = "/viewNotifStu.jsp";
    		}
    		
    		request.setAttribute("isTACourse", isTACourse);
    		//get notif and delete from database, because they are read now.
    		request.setAttribute("notif", new NotifAction().getNotif(uid,true));
    		request.getSession().removeAttribute("notif");

    	}
    	return Response.ok(new Viewable(forwardPage, null)).build();
	}

}