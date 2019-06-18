@isTest
public class DailyLeadProcessorTest {
    
    @isTest
    public static void unitTest(){
        List<Lead> leadList = new List<Lead>();
        for(Integer i=1;i<=200;i++){
            leadList.add(new Lead(LastName ='Test '+i ,company ='Company '+i,LeadSource=''));
        }
       insert leadList; 
        
       DailyLeadProcessor dailyProces = new DailyLeadProcessor(); 
       String sch = '10 46 15 ? * * *';
        Test.startTest();
          String jobID = System.schedule('Test Schedulable apex', sch, dailyProces);
        Test.stopTest();
       /* AsyncApexJob jobInfo = [SELECT Status, NumberOfErrors
                                FROM AsyncApexJob WHERE Id = :jobID]; */
        
        
        System.debug([SELECT TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobID]);
        
       // System.debug('Returned Job Result = '+jobInfo);
        
        System.assertEquals(200, [select id from Lead].size());
    }
}