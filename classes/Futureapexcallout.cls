public class Futureapexcallout{

  @future(Callout=true)
  public static void apexcallout(){
    
     // Instantiate a new http object
    Http h = new Http();
    
    // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    String requestURL='https://www.google.co.in/search?q=Jeffdouglas';
    
    req.setEndpoint(requestURL);
    req.setMethod('GET');

   // Send the request, and return a response
    HttpResponse res = h.send(req);
    string result=res.getBody();
    system.debug('^^^^^^'+result);
  }
  
  }