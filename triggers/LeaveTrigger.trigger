trigger LeaveTrigger on Leave__c (before insert) {
    
    LeaveTriggerHandler leaveObj = new LeaveTriggerHandler();
    leaveObj.populateEmployeeLeave(Trigger.new);
}