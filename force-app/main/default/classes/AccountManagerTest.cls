@isTest
public class AccountManagerTest{
    @isTest
    static void testMethod1(){
        Account objAccount = new Account(Name = 'test');
        insert objAccount;
        Contact objContact = new Contact(LastName = 'test',
                                         AccountId = objAccount.Id);
        insert objContact;
        Id recordId = objAccount.Id;
        RestRequest restReq = new RestRequest();
        restReq.requestUri =
            'https://vivekkumar12345-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId +'/contacts';
        restReq.httpMethod = 'GET';
        RestContext.request = restReq;
        AccountManager.getAccount();
        
    }
}