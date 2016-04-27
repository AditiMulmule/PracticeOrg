global with sharing class CustomLoginController {
    global String username{get;set;}
    global String password{get;set;}
    global CustomLoginController () {}
    global PageReference forwardToCustomAuthPage() {
    String startUrl = System.currentPageReference().getParameters().get('startURL');
    return new PageReference(Site.getPathPrefix() + '/customer/LoginToCommunity?startURL=' +EncodingUtil.urlEncode(startURL, 'UTF-8'));
    }
    
    global PageReference login() {
       
       
        system.debug('****Inside Login*****');
          //return new PageReference('https://aditimulmule13-developer-edition.ap2.force.com/customer');
        PageReference pageRef = new PageReference('/customer/customLandingPage');
     
         pageRef.getParameters().put('username',username);
         String url = pageRef.getUrl();
       
        //return Site.login(username, password,'/customer/home/home.jsp');
        return Site.login(username, password,null);
    }

}