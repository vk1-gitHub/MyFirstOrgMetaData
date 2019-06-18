@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
  
   @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account accObj = [Select id, name, (Select id, name FROM Contacts) FROM Account where id =: accountId];
        return accObj;
    }
}