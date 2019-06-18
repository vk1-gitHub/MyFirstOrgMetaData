@isTest
public class LeadProcessorTest {
    @isTest
    public static void unitTest(){
        List<Lead> leadList = new List<Lead>();
        for(Integer i=1;i<=200;i++){
            leadList.add(new Lead(LeadSource ='Dreamforce '+i,LastName = 'Test '+i ,Company = 'Company '+i));
        }
        insert leadList;
        
        Test.startTest();
        
        LeadProcessor leadProce = new LeadProcessor();
        Database.executeBatch(leadProce);
            
        Test.stopTest();
    }

}