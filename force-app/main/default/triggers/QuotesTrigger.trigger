trigger QuotesTrigger on Quote (before insert, after insert,before Update) {


    // if(Trigger.isBefore || Trigger.isUpdate)
      //    QuotesHandler.UpdateSalesTax(Trigger.new);
  
     if(Trigger.isBefore || Trigger.isUpdate)
        QuoteHandler2.updateQuoteTexSale(Trigger.new);
}