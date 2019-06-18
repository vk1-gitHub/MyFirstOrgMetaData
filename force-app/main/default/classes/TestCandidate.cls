@isTest
public class TestCandidate {
    static testmethod void testMethod_1(){
      List<Candidate__c> can=new List<Candidate__c>();
         Candidate__c c=new candidate__c();
            c.FirstName__c = 'Akshat';
        	c.lastName__c = 'Kumar';
      		c.Brokerage__c = 'Akshat Brokerage';
      		c.ManageBrokerage__c = 'Akshat ManageBrokerage'; 
        
        Candidate__c cn=new candidate__c();
            cn.FirstName__c = 'Ashu';
        	cn.lastName__c = 'Kumar';
      		cn.Brokerage__c = 'Ashu Brokerage';
      		cn.ManageBrokerage__c = 'Ashu ManageBrokerage'; 
        
        can.add(c);
        can.add(cn);
        
      insert can;
    }}