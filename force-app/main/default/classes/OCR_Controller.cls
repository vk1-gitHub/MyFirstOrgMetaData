public class OCR_Controller {
    
    public list<WrapOpp> wrapList { get; set;}
    public OpportunityContactRole ocr{get;set;}
    public Opportunity opp{get;set;}
    public Opportunity oppObj;
    public List<OpportunityContactRole> ocrList{get;set;}
    public List<OpportunityContactRole> ocrList2{get;set;}
    
    public String conStr{get;set;} 
    
    public OCR_Controller(){
        opp = new Opportunity();
        ocr = new OpportunityContactRole();
        ocrList = new List<OpportunityContactRole>();
        ocrList2 = new List<OpportunityContactRole>();
        wrapList = new list<WrapOpp>();
    }
    
    public void addContactRole(){
        ocrList.clear();
        ocrList.add(ocr); 
        ocr = new OpportunityContactRole();
        ocrList2.addAll(ocrList);
    }
    public void addContact(){ 
        //oppObj = new Opportunity();
        //oppObj = opp;
        
        WrapOpp wrapObj = new WrapOpp();
        wrapObj.opp2 = opp;
        wrapObj.ocrList.addAll(ocrList2); 
        wrapList.add(wrapObj);
        ocrList2.clear();
        opp = new Opportunity();
    }
    public void saveOCR(){
        List<OpportunityContactRole> ocrListToSave = new List<OpportunityContactRole>();
        List<OpportunityContactRole> ocrListToSave2 = new List<OpportunityContactRole>();
        List<Opportunity> oppListToSave = new List<Opportunity>();
        for(WrapOpp wrap : wrapList){
            for(OpportunityContactRole ocr : wrap.ocrList){
                ocr.Opportunity = wrap.opp2;
                ocrListToSave.add(ocr);
            }
            oppListToSave.add(wrap.opp2);
        }
        if(oppListToSave != null && oppListToSave.size() > 0)
        insert oppListToSave;
        
        for(OpportunityContactRole ocrObj : ocrListToSave){
            ocrObj.OpportunityId = ocrObj.Opportunity.Id;
            ocrListToSave2.add(ocrObj);
        }
        if(ocrListToSave2 != null && ocrListToSave2.size() > 0)
            insert ocrListToSave2;
    }
    public void cancelOCR(){
        
    }
    
    public class WrapOpp {
        public Opportunity opp2{get;set;}
        public List<OpportunityContactRole> ocrList{get;set;}
        
        public WrapOpp(){
            opp2 = new Opportunity();
            ocrList = new List<OpportunityContactRole>();
        }
    }

}