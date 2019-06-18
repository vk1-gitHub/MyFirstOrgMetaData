public class VFTestController {
    
    public List<Account> accList{get;set;}
    
    public VFTestController(){
        accList = [Select id, name, type FROM Account];
    }
}