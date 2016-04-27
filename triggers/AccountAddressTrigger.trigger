trigger AccountAddressTrigger on Account (before insert, before update) {

AccountAddressTriggerHandler HandlerObject = new AccountAddressTriggerHandler();

if(trigger.isBefore){
	if(trigger.isInsert){
		HandlerObject.AccountAddressCheck(trigger.new);
	}
	if(trigger.isUpdate){
		HandlerObject.AccountAddressCheck(trigger.new);
	}
	
}


}