@isTest
public class TestVerifyDate {
    
    @isTest
    static void unitTest(){
        Date startDate = Date.parse('10/15/15');
        Date endDate = Date.parse('12/16/16');
        
        VerifyDate.CheckDates(startDate,endDate);
    }
   @isTest
    static void SecondUnitTest(){
        Date startDate = Date.parse('10/01/15');
        Date endDate = Date.parse('10/30/15');
        
        VerifyDate.CheckDates(startDate,endDate);
    }

}