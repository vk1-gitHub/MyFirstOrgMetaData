public class TestVisualforceController {
    public String accName{get;set;}
    Account acc  = new Account();
    Account a = [Select id, name, type FROM Account where type != null LIMIT 1];
    List<Account> accList;
    public TestVisualforceController(ApexPages.StandardController sc){
        
    }
    public TestVisualforceController(ApexPages.StandardSetController sc){
        
    }
    public void saveAccount(){
        System.debug('ACCNAme '+accName);
        Account acc = new Account(name = accName);
        insert acc;
    }
    public Account getacc(){
        return acc;
    }
    public void saveAcc(){
        insert acc;
    }
    public List<Account> getselectedAccounts(){
        return accList;
    }
    public void showAllAccounts(){
        accList = [Select name, type, industry FROM Account LIMIT 10];
    }
    public Account getmyMethod(){
        return a;
    }
}