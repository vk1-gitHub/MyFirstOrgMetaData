public class DescribeExperience{
    
        @AuraEnabled public String flabel { get; set; }
        @AuraEnabled public String fAPIName { get; set;}
        @AuraEnabled public String ftype { get; set; }
       
       
    // Trivial constructor, for server-side Apex -> client-side JavaScript
    public DescribeExperience(String label , String APIName ,String type) {
        flabel = label ;
        fAPIName = APIName ;
        ftype = String.ValueOf(type);
    }
    
    // Default, no-arg constructor, for client-side -> server-side
    public DescribeExperience() {}
    
}