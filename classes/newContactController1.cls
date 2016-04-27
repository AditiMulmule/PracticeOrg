public class newContactController1 {

    public list<Contact> lstContact {get;set;}
    public newContactController1(){
    lstContact = new list<Contact>();
    lstContact = [Select LastName,Email,Birthdate,Phone from Contact];
    }
}