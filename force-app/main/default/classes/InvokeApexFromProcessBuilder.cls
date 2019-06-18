public class InvokeApexFromProcessBuilder {
    
    @InvocableMethod
    public static void updateLead(List<id> listIds){
        List<Lead> leadList = new List<Lead>();           
        for(Lead ld : [Select id FROM Lead where id in : listIds]){
            leadList.add(new Lead(id =ld.id, firstName = 'UpdateByApex'));
        }
        if(leadList != null && leadList.size() > 0 )
            update leadList;
    }
}