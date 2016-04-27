trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	
	ClosedOpportunityTriggerHandler HandlerObj = new ClosedOpportunityTriggerHandler();

	if(Trigger.isAfter){
		if(trigger.isInsert){
			
			HandlerObj.createTask(trigger.new);
		}
		if(trigger.isUpdate){
			HandlerObj.createTask(trigger.new);
		}
	}
	

}