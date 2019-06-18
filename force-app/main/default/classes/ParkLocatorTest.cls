@isTest
public class ParkLocatorTest {
  
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String cont = 'India';
        List<String> result = ParkLocator.country(cont);
        // Verify that a fake result is returned
        System.assertEquals('Hamburg Wadden Sea National Park', result[0]); 
    }
}