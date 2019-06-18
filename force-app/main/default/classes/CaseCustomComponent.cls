public class CaseCustomComponent {
    public static List<Case> caseList{get;set;}
    
    public CaseCustomComponent(){
        caseList = new List<Case>();
    }
    public static void getCases(){
        string myParam = apexpages.currentpage().getparameters().get('ButtonName');
        System.debug('---'+myParam);
        caseList = [SELECT CaseNumber, ContactId, Contact.Name, AccountId, Account.Name FROM CASE WHERE Priority =: myParam];
        System.debug('--1--'+caseList);
    }
}