public with sharing class ClosedOpportunityTriggerHandler {

	public void createTask(list<Opportunity> oppList){
		
		list<Task> taskList = new list<Task>();
		
		
		for(Opportunity oppObj : [Select Id,Name,StageName from Opportunity where Id IN :oppList AND StageName =:'Closed Won']){
			
			taskList.add(new Task(WhatId=oppObj.Id,Status='Not Started',Priority = 'Normal',Subject = 'Follow Up Test Task'));
			
		}
		insert taskList;
	}


}