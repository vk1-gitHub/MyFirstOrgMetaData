public class AccountUtils {
    
    public static List<Account> accountsByState(String state){
        List<Account> accList = new List<Account>();
        accList.add(New Account(name='Test', BillingState = state));
        insert accList;
        return accList;
    }

}