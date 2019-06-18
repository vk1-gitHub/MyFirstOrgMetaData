trigger OppTrigger on Opportunity (after insert, after update, after delete, after undelete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUndelete){
            OpportunityHandler.handleOppInsertAndDelete(Trigger.New);
        }
        if(Trigger.isUpdate){
           OpportunityHandler.handleOppUpdate(Trigger.New, Trigger.OldMap);
        }
        if(Trigger.isdelete){
            OpportunityHandler.handleOppInsertAndDelete(Trigger.old);
        }
    }
}