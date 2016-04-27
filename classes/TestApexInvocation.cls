public class TestApexInvocation {

public TestApexInvocation()
{
  
   
}
@InvocableMethod(label='Get Brass Cases Names' description='Returns the list of Brass Cases corresponding to the specified Brass Cases IDs.')
public static void invoke(){
 Contact con = new Contact();
   con.lastname='newContactthroughProcess';
   insert con;
   
 
// Instantiate a new http object
  /*  Http h = new Http();

// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://www.google.co.in/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=jeff%20douglas');
    req.setMethod('GET');

// Send the request, and return a response
    HttpResponse res = h.send(req);
   system.debug('****response'+ res.getBody());*/
 
   
   
}
}