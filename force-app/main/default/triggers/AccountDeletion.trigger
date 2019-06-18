trigger AccountDeletion on Account (before delete) {

    for(Account a: [select id from account 
                    where id in(select accountid from opportunity) AND 
                    id IN:Trigger.old]){
        
       Trigger.oldMap.get(a.id).addError('Cannot be deleted because opportunity is related to this account.');
                         
    }
}