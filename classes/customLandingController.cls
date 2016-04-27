global  class customLandingController {

    

    public list<Contact> displayval { get; set; }
    
    public list<Contact> conList = new list<Contact>();
    public String userString { get;set;}
  
    public customLandingController(){
    
        User userObj = new User();
        String userString = ApexPages.currentPage().getParameters().get('username');
        system.debug('**userString**'+userString); 
        userObj = [Select Name,Username from User where Username=:userString limit 1];
        String lName = userObj.Name;
       
        displayval =  new list<Contact>();
    
        displayval = [Select LastName,Name,Email,Phone,OtherCity,OtherCountry,OtherPostalCode from Contact where LastName=:lName];
       
    
    
    }
    @RemoteAction
    global static void saveabc(String ph,String city,String email,String country,String code,String username) {
       
        
        User userObj = new User();
        
        //String userString = ApexPages.currentPage().getParameters().get('username');
        //system.debug('**userStringRemoteAction**'+userString);
        userObj = [Select Name,Username from User where Username=:username limit 1];
        String lName = userObj.Name;
        //system.debug('**lName**'+lName);
        
        Contact con = new Contact();
        con=[Select LastName,Phone,Email,OtherCity,OtherCountry,OtherPostalCode from Contact where LastName=:lName];
        
        con.Phone = ph;
        con.OtherCity = city;
        con.OtherCountry = country;
        con.OtherPostalCode = code;
        con.Email = email;
        
 
        update con;
        
        
        
    }

    
    
    
}