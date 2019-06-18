({
     handleCancel: function (){
            var url = window.location.href; 
            var value = url.substr(0,url.lastIndexOf('/') + 1);
            window.history.back();
            return false;
    },
    
     doInit: function(component, event, helper) {
       	  helper.fetchPickListVal(component, 'Status__c', 'selectedval');
     }, 
    
    handleSaveRecord: function(component, event, helper) {
      //  component.set("v.contactRecord.AccountId", component.get("v.recordId"));
        component.find("recordEditor").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                
                 var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title": "Updated",
                        "message": "The record was Updated."
                    });
                    resultsToast.fire();
                    component.set("v.recordEditor",saveResult);
                    //to redirect to Detail Page
                    var navEvt = $A.get("e.force:navigateToSObject");
                    navEvt.setParams({"recordId": saveResult.recordId,"slideDevName": "related"});
                    navEvt.fire(); 
                    
                
                
              
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log('Problem saving record, error: ' + 
                           JSON.stringify(saveResult.error));
            } else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
              
        })); }
})