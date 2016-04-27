public with sharing class ReferralCSS2_0Controller {

   public String contactName {get;set;}
    public Boolean selfReferred {get;set;}
    public String  contactNumber {get;set;}
    public String emailId{get;set;}
    public String body;
    private final list<User> sendToUser;
    public ReferralCSS2_0Controller(){
        selfReferred = false;
        
         sendToUser = [Select Name, Email From User  where Email='aditimulmule@gmail.com'];
        
    }
    
    public void send(){
     Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
     List<String> sendTo = new List<String>();
     for(User u : sendToUser)
     {
      sendTo.add(u.Email);
     }
     
     mail.setToAddresses(sendTo);
    
     mail.setSubject( 'Referral Email ');
     body = 'Name of Contact :'+contactName+'<br/>';
     body += 'selfReferred : '+selfReferred+'<br/>';
     body += 'Email Address : '+emailId+'<br/>';
     body += 'Contact Number '+contactNumber+'<br/>';
     
     
     
     mail.setHtmlBody(body);
    
    Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail}); 
    } 
    
     
      

}