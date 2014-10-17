
import javax.ws.rs.core.MediaType;
import javax.ws.rs.*;


@Path("/test")	//This path must be different from any other classes!
public class HelloJersey {
	///*
	@GET
	@Path("hello")
	@Produces(MediaType.TEXT_PLAIN)
	//@Produces(MediaType.APPLICATION_JSON)
	public String sayHello() {
		return "{\"name\": \"luyao\" }";
		//return "Hello Jersey";
	}
	
	@GET
	@Path("{name}")
	@Produces(MediaType.TEXT_PLAIN)
	public String getres(@PathParam("name") String contact)
	{
		return "Hello, " + contact;
	}
	//*/
}
