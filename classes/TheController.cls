public with sharing class TheController {
    public List<Account> getAccounts()
    {
       List<Account> listacc =[Select Id, Name, AccountNumber, OwnerId, Phone, Fax From Account];
     
        return listacc;
    }
}