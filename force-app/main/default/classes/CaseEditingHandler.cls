public class CaseEditingHandler {
   
    @AuraEnabled
    public static List<Case> modifiedCaseList(){
        List<Case> caseList = new List<Case>();
        return caseList = [Select id, casenumber FROM Case where LastModifiedDate  >: Datetime.now().addMinutes(-30)];
    }
}