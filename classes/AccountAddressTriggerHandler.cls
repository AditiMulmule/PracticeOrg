public with sharing class AccountAddressTriggerHandler {

public void AccountAddressCheck(list<Account> accList){
	
		for(Account accountObj : accList){
	
			if(accountObj.BillingPostalCode!=null && accountObj.Match_Billing_Address__c==true){
		
				accountObj.ShippingPostalCode = accountObj.BillingPostalCode;
			}
	
	
		}
	
	}


}