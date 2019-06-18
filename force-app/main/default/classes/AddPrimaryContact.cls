public class AddPrimaryContact implements Queueable{
    
    public Contact conObj;
    public String state;
   
    public AddPrimaryContact(Contact conObj,String state){
        this.conObj = conObj;
        this.state = state;
        
    }
    public void execute(QueueableContext qc){
        
        List<Account> accList = [Select id,name,BillingState from Account where account.BillingState = :this.state LIMIT 200];
        List<Contact> listCon = new List<Contact>();
        for(Account acc: accList){
            Contact conInst = conObj.clone(false,false,false,false);
            conInst.AccountId = acc.Id;
        
            listCon.add(conInst);
        }
        INSERT listCon;
    }
    

}