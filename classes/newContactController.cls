public class newContactController {

    public newContactController() {

    }

list<Contact> lstContact {get;set;}
    public newContactController(ApexPages.StandardController controller) {
    lstContact = new list<Contact>();
    lstContact = [Select Name,Email,Birthdate,Phone from Contact];
    }

}