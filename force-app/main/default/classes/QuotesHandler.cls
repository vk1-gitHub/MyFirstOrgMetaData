public class QuotesHandler{

  public static void UpdateSalesTax(List<Quote> listQuotes){
    
      for(Quote q: listQuotes){ 
      
        for(SalesTax__c s: [select id,City__c,State__c from SalesTax__c]){
         
             if(q.BillingCity == s.city__c  && q.BillingState == s.state__c)
               q.SalesTaxes__c = s.id; 
       
        }  
       
      }
  }

}