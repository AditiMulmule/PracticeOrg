public class PageSaveController {
 
public Account accountObj {get;set;}
public PageSaveController()
{
  accountObj = new Account();

}
 public PageReference Save() {
  
        system.debug('****accountObj'+accountObj);
        insert accountObj;
        return null;
}
    public PageReference Next() {
        PageReference pageRef= new PageReference('/apex/Page2forLinkExample');
       // pageRef.getParameters().put(accountObj.name,accountObj.name);
        pageRef.setredirect(false);       
        return pageRef;   
    }
    public String getNext() {
        return null;
    }


}