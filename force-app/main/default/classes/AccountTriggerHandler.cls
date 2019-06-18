public class AccountTriggerHandler {

    public static void CreateAccounts(List<Account> accList){
        for(Account acc : accList){
            acc.shippingState = acc.BillingState;
        }
    }
}