package edu.ncsu.gradiance.action;


public class NotifThread implements Runnable {
	private String curUser = null;
	private String cid = null;
	
	public NotifThread(String uid, String cid) {
		curUser = uid;
		this.cid = cid;
	}
	
	/**
	 * @author yaolu
	 * @function Notif generate thread, start every 24 hours, see if there's deadline for student current day
	 */
	public void run() {
		if(curUser!=null) {
			boolean hasUrgentDue = new NotifAction().checkUrgentDue(curUser,cid);
			if(hasUrgentDue)
				new NotifAction().addNotif(curUser, "Urgent Due", "You have an unattempted due that will expire with a day.");
		}
		
		try {
			Thread.sleep(1000*3600*24);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
}