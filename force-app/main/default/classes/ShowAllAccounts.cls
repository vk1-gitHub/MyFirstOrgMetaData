public class ShowAllAccounts {
    
    Account[] selectedActs;
    
    public List<Account> getSelectedActs(){
        return selectedActs;       
    }
    
    public PageReference showAll(){
        selectedActs = [Select Name, phone, type FROM Account];
        return null;
    }
    public PageReference hideAll(){
        selectedActs = null;
        return null;
    }
    public PageReference customer_Channel(){
        selectedActs = [Select Name, phone, type FROM Account where type='Customer - Channel'];
        return null;
    }
    public PageReference customer_Direct(){
        selectedActs = [Select Name, phone, type FROM Account where type='Customer - Direct'];
        return null;
    }
}