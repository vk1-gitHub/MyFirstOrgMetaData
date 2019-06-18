@isTest
public class TestContactFamilyMember {
    @isTest static void testMethod_2(){
    List<Contact> con=new List<Contact>();
    Contact c=new Contact(lastname = 'Gupta',accountid = '0017F00000RKNzoQAH');
    Contact cn=new Contact(lastname = 'Yadav',accountid = '0017F00000RKNzZQAX');
   
    con.add(c);
    con.add(cn);
    
    insert con;   
    
        
        c.lastname='Gupta';
        c.accountid = '0017F00000RKNzZQAX';
    
         test.startTest();
            update con;
         test.stopTest();
        
           delete c;    
        
    }
}