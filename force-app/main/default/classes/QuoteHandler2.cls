public class QuoteHandler2{

    public static void updateQuoteTexSale(List<Quote> listquote){
 
          Set<String> citySet = new Set<String>();
          Set<String> stateSet = new Set<String>();
 
          for(Quote q: listquote)
          {
               citySet.add(q.billingCity);
               stateSet.add(q.billingState);
          }
     
          Map<String,id> salesmap = new Map<String,id>();
   
          for(SalesTax__c s: [select id,city__c,state__c from SalesTax__c where city__c IN: citySet and state__c IN: stateSet]){
               salesmap.put(s.city__c+' '+s.state__c,s.id); 
          }
    
          for(Quote q : listquote){ 
            if(q.billingCity != null && q.billingState != null){ 
       
                if(salesmap.containskey(q.billingCity+' '+q.billingState)){
                       q.SalesTaxes__c = salesmap.get(q.billingCity+' '+q.billingState);       
                } 
                else {
                       q.SalesTaxes__c = null;
                }
                
            } else{
                  q.SalesTaxes__c = null;     
         }
    }
 }
}