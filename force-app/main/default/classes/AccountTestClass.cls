@isTest
public class AccountTestClass{

    static testMethod void testmethod_1(){
  
      List<Account> listact = new List<Account>();
      
      for(Integer i=0; i<20; i++){
          Account a = new Account(Name ='Test'+i, industry='Technology');
          listact.add(a);
      }
  
           insert listact;
    
      List<Account> insertedacts = new List<Account>([select name,industry,description FROM Account where id in:listact]);
      for(Account ac :insertedacts){
         //System.assertEquals('Technology Account',ac.description);

      }
   }
}