public with sharing class modalController {

    public modalController() {
    
        getCases();
    
    
    }
    public List<Case> getCases(){
        return [SELECT Id,CaseNumber,Status,Priority,Type,Subject,isClosed FROM Case ORDER BY CreatedDate DESC];
    }
    





}