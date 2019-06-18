public class OpportunityHandler {
    public static void processMethod(Set<id> accidSet){
        Map<id, Opportunity> idOppMap = new Map<id, Opportunity>();
        for(Opportunity opp : [Select id, accountId, amount From Opportunity where AccountId =: accidSet AND StageName = 'Closed Won' ORDER BY amount DESC]){
            if(!idOppMap.containsKey(opp.AccountId))
                idOppMap.put(opp.AccountId, opp);
        }
        if(idOppMap.keySet() != null && idOppMap.keySet().size() > 0){
            List<Account> accList = new List<Account>();
            for(Id accId : idOppMap.keySet()){
                Account acc = new Account(id = accId, TopOpportunity__c = idOppMap.get(accId).Id);
                accList.add(acc);
            }
            if(accList != null && accList.size() > 0)
                update accList;
        }
    }
    public static void handleOppInsertAndDelete(List<Opportunity> oppList){
        Set<id> accIdSet = new Set<Id>();
        for(Opportunity opp : oppList){
            if(opp.AccountId != null){
                accIdSet.add(opp.AccountId);
            }
        }
        if(accIdSet != null && accIdSet.size() > 0){
            OpportunityHandler.processMethod(accIdSet);
        }
    }
    public static void handleOppUpdate(List<Opportunity> oppList, Map<id, Opportunity> oppOldMap){
        Set<id> accIdSet = new Set<Id>();
        for(Opportunity opp : oppList){
            if(opp.AccountId != null){
                if(oppOldMap.get(opp.id).AccountId != opp.AccountId)
                    accIdSet.add(oppOldMap.get(opp.id).AccountId);
                accIdSet.add(opp.AccountId);
            }
        }
        if(accIdSet != null && accIdSet.size() > 0){
            OpportunityHandler.processMethod(accIdSet);
        }
    }
}