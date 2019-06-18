global class BatchApexExample implements Database.Batchable<sObject>,Database.Stateful {

    String query = 'Select id, name, description FROM Account';
    global integer countStart = 0;
    global integer countExecute = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        //return Database.getQueryLocator(query);
        countStart++;
        System.debug('countStart == '+countStart);
        return Database.getQueryLocator([Select id, name, description FROM Account]);
    }
    global void execute(Database.BatchableContext bc, List<sObject> accChunks){
        
        List<Account> accList = new List<Account>();
        for(SObject  acc : accChunks){
            accList.add(new Account(id = acc.id, description = 'Updated using Batch Apex'));
        } 
        countExecute++;
        System.debug('countExecute == '+countExecute);
        
        if(accList != null && accList.size() > 0)
            update accList;
    }
    global void finish(Database.BatchableContext bc){
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: bc.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //String[] toAddresses = new String[] {a.CreatedBy.Email};
        mail.setToAddresses(New List<String>{'vivekkumar231995@gmail.com'});
        mail.setSubject('Apex Batch Job Execution Report');
        mail.setPlainTextBody
            ('The batch Apex job processed ' + a.TotalJobItems +
             ' batches with '+ a.NumberOfErrors + ' failures. And Staus of Batch Apex Job is : '+ a.Status);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}