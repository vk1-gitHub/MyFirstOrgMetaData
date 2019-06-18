@isTest
public class TestUpdateDeleteDemo {
  
    @isTest static void test_method(){
        
       
        Account acc=new Account(name='TestAcc');
        insert acc;
        
        ApexPages.currentPage().getParameters().put('id',acc.id);
            
        System.debug('Accccccc = '+acc);
        System.debug('Acccount iddddd'+acc.id);
        System.debug('@@@@@@@@@@@@@@@'+ApexPages.currentPage().getParameters().get('id'));         
        
        List<Contact> listcon = new List<Contact>();
        Contact cn = new Contact(accountid=acc.id,lastname='TestContact',title='Manager',phone='9887656768');
        Contact cn1 = new Contact(accountid=acc.id,lastname='TestContact2',title='Clerk',phone='9565656565');
         
         listcon.add(cn);
         listcon.add(cn1);
         insert listcon;
        
        WrapperUpdateDeleteDemo wrapup= new WrapperUpdateDeleteDemo();  
        WrapperUpdateDeleteDemo.WrapperDemo wrap = new WrapperUpdateDeleteDemo.WrapperDemo();
        List<WrapperUpdateDeleteDemo.WrapperDemo> wrapdemo = new List<WrapperUpdateDeleteDemo.WrapperDemo>();
       
          wrapup.getwraplist();
          wrapup.updateRecord();
          
          wrapup.deleteRecord();
         
    }
}