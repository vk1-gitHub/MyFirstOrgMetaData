public class DailyLeadProcessor implements schedulable{
    
    public void execute(SchedulableContext sc){
        
        List<Lead> leadList = [select id,LeadSource from Lead where LeadSource ='' LIMIT 200];
        List<Lead> ldList = new List<Lead>();
        
        for(Lead ld : leadList){
            ld.LeadSource = 'Dreamforce';
            ldList.add(ld);
        }
        update ldList;
    }
}