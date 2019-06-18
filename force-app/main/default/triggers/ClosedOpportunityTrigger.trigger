trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> taskList = new List<Task>();
    for(Opportunity opp : [select id,StageName from Opportunity where StageName = 'Closed Won' AND id IN : Trigger.new]){
        
        taskList.add(new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id));
        
        
    }
    if(taskList.size() > 0){
        insert taskList;
    }
}