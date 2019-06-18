trigger ConTrigger on Contact (after Insert,after Update,after delete) {

 Set<id> accountset =new Set<id>(); 

  for(Contact obj : Trigger.new){
 //contact oldContact = Trigger.oldMap.get(obj.id);
 if(Trigger.oldMap.get(obj.id).accountId != obj.accountId)
  accountSet.add(Trigger.oldMap.get(obj.id).accountId);
 accountSet.add(obj.accountId);
 
}


Map<Id, Account> accountMap = new Map<Id, Account>();

for(Contact obj : [SELECT score1__c, score2__c, accountId FROM Contact WHERE accountId IN :accountSet]){
 Decimal score1 = (obj.score1__c != NULL ? obj.score1__c : 0);
 Decimal score2 = (obj.score2__c != NULL ? obj.score2__c : 0);

 if(accountMap.containsKey(obj.accountId)){
  score1 += accountMap.get(obj.accountId).rollupscore1__c;
  score2 += accountMap.get(obj.accountId).rollupscore2__c;
 }
 
 accountMap.put(obj.accountId, new Account(id = obj.accountId, rollupscore1__c = score1, rollupscore2__c = score2));
}

if(accountMap.size() > 0)
 update accountMap.values();

}