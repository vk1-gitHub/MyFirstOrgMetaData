global class BatchClassExample2 implements Database.Batchable<Account>{
    
    global Iterable<Account> start(Database.BatchableContext bc){
         return new IterableExample();
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        List<Account> accListToUpdate = new List<Account>();
        for(Account acc : scope){
            accListToUpdate.add(new Account(id = acc.Id, description = 'update By Batch Class Using Iterable'));
        }
        if(accListToUpdate != null && accListToUpdate.size() > 0)
           update accListToUpdate;
    }
    global void finish(Database.BatchableContext bc){
        
    }

}