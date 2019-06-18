public class NewCaseListController {
     
    public List<Case> getNewCases(){
        List<Case> caseList = [SELECT id,caseNumber,Status FROM Case where status ='New'];
        return caseList;
    }
}