global class UpdateContactDescription implements Database.Batchable<Contact>, Database.stateful{
    
    global List<Contact> contList = new List<Contact>();
    List<Contact> conListToupdate = new List<Contact>();
    
    public UpdateContactDescription(List<Contact> conList){
        contList.addAll(conList);
        System.debug('In Class  !!@@ '+contList);
    }
    global Iterable<Contact> start(Database.BatchableContext bc){
        return contList;
    }
    global void execute(Database.BatchableContext bc, List<Contact> scope){
        System.debug('In Class scope !!@@ '+scope);
        for(Contact con : scope){
            con.Description = 'Updated By Batch Class';
            conListToupdate.add(con);
        } 
    }
    global void finish(Database.BatchableContext bc){
        if(conListToupdate != null && conListToupdate.size() > 0){
            System.debug('Before Update '+conListToupdate);
            update conListToupdate;
            System.debug('Agter Update '+conListToupdate);
        }
    }
}