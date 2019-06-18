global class LeadProcessor implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id,LeadSource from Lead');
        
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leadList = new List<Lead>();
        for(Lead ld : scope){
            ld.LeadSource = 'Dreamforce';
            leadList.add(ld);
        }
        update leadList;
        
    }
    global void finish(Database.BatchableContext bc){
        
    }
    
}