package edu.ncsu.gradiance.web;


import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.*;

import com.sun.jersey.api.view.Viewable;

import edu.ncsu.gradiance.action.*;

@Path("/Report")
public class ReportService {
		
	/**
	 * @author yaolu
	 * @function add course by token
	 */
	@POST
	@Path("runSQL")
	public Response runSQL(@Context HttpServletRequest request,
			@FormParam("rptId") String rptId, @FormParam("sql") String sql) throws Exception { 
		System.out.println("/Report/runSQL called at: "+System.currentTimeMillis());
		
    	//check if logged in
    	String uid = (String)request.getSession().getAttribute("curUser");
    	Integer authority = (Integer)request.getSession().getAttribute("curAuthority");
    	String forwardPage = "/usrLog.jsp";
  
    	if(uid != null) {
    		if(authority.intValue() == 0) {		
    			forwardPage = "/rptProf.jsp";
    		}			
    		else if(authority == 1) {
				forwardPage = "/rptTA.jsp";
			}
    		System.out.println("rptId:"+rptId);
			if(rptId!=null) {	//if user specified a rptId, run built-in query
				String builtInSql = new ReportAction().getBuiltInSQL(rptId);
				request.setAttribute("sql", builtInSql);
				request.setAttribute("sqlResult", new ReportAction().runSQL(builtInSql));
			}
			else if(sql!=null && sql.length()>0) {	//else if user wants to run a custom sql, then do it
				request.setAttribute("sql", sql.trim());	
				request.setAttribute("sqlResult", new ReportAction().runSQL(sql));	
			}

    	}
    	return Response.ok(new Viewable(forwardPage, null)).build();
	}
	
}