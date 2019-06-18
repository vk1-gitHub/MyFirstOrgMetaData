public class DescribeFieldset {
    
        @AuraEnabled public String flabel { get; set; }
        @AuraEnabled public String fAPIName { get; set; }
        @AuraEnabled public boolean freq { get; set; }
        @AuraEnabled public String ftype { get; set; }
       
       
    // Trivial constructor, for server-side Apex -> client-side JavaScript
    public DescribeFieldset(String label , String APIName ,boolean req,Schema.DisplayType type) {
        flabel = label ;
        fAPIName = APIName ;
        freq = req ;
        ftype = String.ValueOf(type);
    }
    
    // Default, no-arg constructor, for client-side -> server-side
    public DescribeFieldset () {}
    
}