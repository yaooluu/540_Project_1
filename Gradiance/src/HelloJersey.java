
import javax.ws.rs.core.MediaType;
import javax.ws.rs.*;

@Path("/hello")
public class HelloJersey {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String sayHello() {
		return "{\"name\": \"luyao\" }";
		//return "Hello Jersey";
	}
	
	@GET
	@Path("{contact}")
	@Produces(MediaType.TEXT_PLAIN)
	public String getres(@PathParam("contact") String contact)
	{
		return "Hello, " + contact;
	}


}
