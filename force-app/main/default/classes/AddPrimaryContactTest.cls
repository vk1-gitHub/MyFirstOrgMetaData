@isTest
public class AddPrimaryContactTest {

    @isTest
    public static void unitTest(){
        List<Account> accList = new List<Account>();
        Set<Id> idSet = new Set<Id>();
        
        for(Integer i=1;i<=50;i++){
            accList.add(new Account(name = 'Test'+i, BillingState = 'NY'));
            
        }
        for(Integer i=51;i<=100;i++){
            accList.add(new Account(name = 'Test'+i, BillingState = 'CA'));
        }
        insert accList;
        
        for(Account acc : [Select id from Account]){
            idSet.add(acc.Id);
        }
        
        Test.startTest();
        contact c = new contact(lastname='Test');
        AddPrimaryContact apc = new AddPrimaryContact(c,'CA');
        System.enqueueJob(apc);
        Test.stopTest();
        
         System.assertEquals(50, [select count() from Account where Id = : IdSet AND account.BillingState = 'CA']);
    } 
}