public class ContactHandler{
 
    public static void UpdateAccountScore(List<Contact> contlist){
 
            Map<Id, Account> accMap = new Map<Id, Account>();
            Set<id> accSet = new Set<id>();
  
            for(Contact c : contlist){
                  accset.add(c.accountid);
            }
      
            List<AggregateResult> agResults = [SELECT AccountId, sum(score1__c) score1, sum(score2__c) score2 FROM Contact where AccountId in : accset  GROUP BY AccountId];
     
            for(AggregateResult ar : agResults){
  
                String Accountid = (String)ar.get('AccountId');
                Decimal score1 =(decimal)ar.get('score1');
                Decimal score2 =(decimal)ar.get('score2');
                accMap.put(accountId, new Account(id = accountId, rollupscore1__c = score1, rollupscore2__c = score2)); 
            } 
             
          if(accMap.size() > 0)
          update accMap.values();
    }
 
    public static void UpdateAccountScoreAfterDelete(List<Contact> contlist){
 
            Map<Id, Account> accMap = new Map<Id, Account>();
            Set<id> accSet = new Set<id>();
  
            for(Contact c : contlist){
            
                accset.add(c.accountid);
            }
      
            List<AggregateResult> agResults = [SELECT AccountId, sum(score1__c) score1, sum(score2__c) score2 FROM Contact where AccountId in : accset  GROUP BY AccountId];
 
       
            for(AggregateResult ar : agResults){
          
                String Accountid = (String)ar.get('AccountId');
                Decimal score1 =(decimal)ar.get('score1');
                Decimal score2 =(decimal)ar.get('score2');
                accMap.put(accountId, new Account(id = accountId, rollupscore1__c = score1, rollupscore2__c = score2)); 
            }
                      
        if(accMap.size() > 0)
        update accMap.values();
      
    }
 
    public static void RollUpAccountScoreAfterUpdate(List<Contact> contlist,Map<Id,contact> oldMap){
 
            Map<Id, Account> accMap = new Map<Id, Account>();
            Set<id> accSet = new Set<id>();
  
            for(Contact c : contlist){
                 if(oldMap.get(c.id).accountId != c.accountId)
                        accSet.add(oldMap.get(c.id).accountId);
                 accSet.add(c.accountId); 
            }
      
            List<AggregateResult> agResults = [SELECT AccountId, sum(score1__c) score1, sum(score2__c) score2 FROM Contact where AccountId in : accset  GROUP BY AccountId];
 
       
            for(AggregateResult ar : agResults){
  
                String Accountid = (String)ar.get('AccountId');
                Decimal score1 =(decimal)ar.get('score1');
                Decimal score2 =(decimal)ar.get('score2');
                accMap.put(accountId, new Account(id = accountId, rollupscore1__c = score1, rollupscore2__c = score2)); 
            }
             
      if(accMap.size() > 0)
      update accMap.values();
      
    }
}