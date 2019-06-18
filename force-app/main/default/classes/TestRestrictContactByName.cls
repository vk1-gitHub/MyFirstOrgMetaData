@isTest
public class TestRestrictContactByName {
    @isTest
    public static void unitTest(){
        Contact con = new Contact(LastName = 'INVALIDNAME');
        insert con;
        
        Test.startTest();
        Database.SaveResult result = Database.insert(con, false);
        Test.stopTest();
        
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML.',
                             result.getErrors()[0].getMessage());
    }

}