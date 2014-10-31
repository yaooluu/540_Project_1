package edu.ncsu.gradiance.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.*;

import com.sun.jersey.api.view.Viewable;

import edu.ncsu.gradiance.action.*;

@Path("/prof")
public class ProfessorService {
	
	/**
	 * @author yaolu
	 * @function add course by token
	 */
	@POST
	@Path("addCourse")
	public Response addCourse(@Context HttpServletRequest request,
			@FormParam("token") String token) throws Exception { 
		System.out.println("/prof/addCourse called at: "+System.currentTimeMillis());
		
		String curUser = (String)request.getSession().getAttribute("curUser");
		String addCourseResult = "Please Login first!";
		if(curUser != null)
			addCourseResult = new ProfessorAction().addCourse(token,curUser);
			
		request.setAttribute("addCourseResult", addCourseResult);	
		
		//refresh selectedCourses and send it to indexStu.jsp
		String uid = (String) request.getSession().getAttribute("curUser");
		request.setAttribute("selectedCourses", new ProfessorAction().getSelectedCourses(uid));
		
	    return Response.ok(new Viewable("/indexProf.jsp", null)).build();
	}
	
	/**
	 * @author yaolu
	 * @function show course options
	 */
	@POST
	@Path("courseOption")
	public Response courseOption(@Context HttpServletRequest request,
			@FormParam("cid") String cid) throws Exception { 
		System.out.println("/prof/courseOption called at: "+System.currentTimeMillis());
		
		request.getSession().setAttribute("cid", cid);
		request.getSession().setAttribute("courseTitle", new StudentAction().getCourseTitle(cid));
		
		String uid = (String) request.getSession().getAttribute("curUser");
		//get nofitications for user and don't delete from db
		String notif = new NotifAction().getNotif(uid,false);
		request.getSession().setAttribute("notif", notif);
		
	    return Response.ok(new Viewable("/optProf.jsp", null)).build();
	}
	
	/**
	 * @author yaolu
	 * @function add homework
	 */
	@POST
	@Path("addHomework")
	public Response addHomework(@Context HttpServletRequest request,
			@FormParam("title") String title, @FormParam("tstart") String tstart, @FormParam("tend") String tend,
			@FormParam("minDif") String minDif, @FormParam("maxDif") String maxDif, @FormParam("retry") String retry, 
			@FormParam("corrPts") String corrPts, @FormParam("penalPts") String penalPts, @FormParam("scoreSelect") String scoreSelect,
			@FormParam("tidList") List<String> tList, @FormParam("numQs") String numQs) throws Exception { 
		System.out.println("/prof/addHomework called at: "+System.currentTimeMillis());
		
		String tidList = "";
		for(int i=0;i<tList.size();i++)
			tidList += tList.get(i) + ",";
		tidList = tidList.substring(0,tidList.length()-1);
		
		String cid = (String)request.getSession().getAttribute("cid");
		String params = cid+","+title+","+tstart+","+tend+","+ minDif+","+maxDif +","+retry+","+corrPts+","+penalPts+","+scoreSelect;
		
		String addHomeworkResult = "Please select course first!";
		if(cid!=null) {
			/*List<String> list = new ProfessorAction().addHomework(params,tidList);
			request.getSession().setAttribute("addHwAid", list.get(0));
			addHomeworkResult = list.get(1);
			*/
			addHomeworkResult = new ProfessorAction().addHomework(params,tidList);
		}		
		request.setAttribute("addHomeworkResult", addHomeworkResult);
		
	    return Response.ok(new Viewable("/addHwProf.jsp", null)).build();
	}

	/**
	 * @author yaolu
	 * @function get homework list(aid,title), and basic info(if aid)
	 */
	@POST
	@Path("editHwProf")
	public Response editHwProf(@Context HttpServletRequest request,@FormParam("aid") String aid) throws Exception { 
		System.out.println("/prof/editHwProf called at: "+System.currentTimeMillis());
			
		String cid = (String)request.getSession().getAttribute("cid");
		request.setAttribute("homeworkList", new ProfessorAction().getHomeworkList(cid));
		
		if(aid!=null && aid.length()>0) {
			List<String> homeworkBasic = new ProfessorAction().getHomeworkBasic(aid);
			request.setAttribute("homeworkBasic", homeworkBasic);	
		}
		
	    return Response.ok(new Viewable("/editHwProf.jsp", null)).build();
	}

	
	
	/**
	 * @author yaolu
	 * @function edit homework basic
	 * @params these params is more than need, but just in case.
	 */
	@POST
	@Path("editHomework")
	public Response editHomework(@Context HttpServletRequest request,@FormParam("aid") String aid,
			@FormParam("title") String title, @FormParam("tstart") String tstart, @FormParam("tend") String tend,
			@FormParam("minDif") String minDif, @FormParam("maxDif") String maxDif, @FormParam("retry") String retry, 
			@FormParam("corrPts") String corrPts, @FormParam("penalPts") String penalPts, @FormParam("scoreSelect") String scoreSelect,
			@FormParam("topics") String topics, @FormParam("numQs") String numQs) throws Exception { 
		System.out.println("/prof/editHomework called at: "+System.currentTimeMillis());
		
		String cid = (String)request.getSession().getAttribute("cid");
		request.setAttribute("homeworkList", new ProfessorAction().getHomeworkList(cid));
		
		String editHomeworkResult = new ProfessorAction().editHomework(aid, title, tend, scoreSelect);
		request.setAttribute("editHomeworkResult", editHomeworkResult);	
		
	    return Response.ok(new Viewable("/editHwProf.jsp", null)).build();
	}
	
	
	/**
	 * @author yaolu
	 * @function get homework list(aid,title)
	 */
	@POST
	@Path("addRmQsProf")
	public Response addRmQsProf(@Context HttpServletRequest request,
			@FormParam("aid") String aid, @FormParam("selectedQidList") String selectedQidList) throws Exception { 
		System.out.println("/prof/addRmQsProf called at: "+System.currentTimeMillis());
			
		String cid = (String)request.getSession().getAttribute("cid");
		request.setAttribute("homeworkList", new ProfessorAction().getHomeworkList(cid));
		
		if(aid!=null && aid.length()>0) {
			List<String> homeworkBasic = new ProfessorAction().getHomeworkBasic(aid);
			request.setAttribute("homeworkBasic", homeworkBasic);	
			
			String homeworkQuestion = new ProfessorAction().getHomeworkQuestion(aid);
			request.setAttribute("homeworkQuestion", homeworkQuestion);	
			
			if(selectedQidList!=null && selectedQidList.length()>0) {
				String editQsResult = new ProfessorAction().editHomeworkQuestion(aid,selectedQidList);
				request.setAttribute("editQsResult", editQsResult);	
			}
		}	
	    return Response.ok(new Viewable("/addRmQsProf.jsp", null)).build();
	}
	
	
	/**
	 * @author yaolu
	 * @function view homework's 
	 */
	@POST
	@Path("viewHwProf")
	public Response viewHwProf(@Context HttpServletRequest request,@FormParam("aid") String aid) throws Exception { 
		System.out.println("/prof/viewHwProf called at: "+System.currentTimeMillis());
		
		String cid = (String)request.getSession().getAttribute("cid");
		request.setAttribute("homeworkList", new ProfessorAction().getHomeworkList(cid));
		
		if(aid!=null && aid.length()>0) {
			List<String> homeworkBasic = new ProfessorAction().getHomeworkBasic(aid);
			request.setAttribute("homeworkBasic", homeworkBasic);	
			
			String homeworkQuestion = new ProfessorAction().getHomeworkQuestion(aid);
			request.setAttribute("homeworkQuestion", homeworkQuestion);	
		}
		
	    return Response.ok(new Viewable("/viewHwProf.jsp", null)).build();
	}
	
}
