({  
        createExpense: function(component, event, helper) {
           
            var newExpense = component.get("v.newExpense");
            
            //  console.log("Create expense: " + JSON.stringify(newExpense));
            var newExpense = JSON.stringify(newExpense);
            
            var action = component.get("c.saveExpense");
            action.setParams({
                "expense": newExpense
            });
            
        action.setCallback(this, function(response){
            var state = response.getState();
            
             //console.log(response.getReturnValue());
            
            var recordId = response.getReturnValue().Id;
             //  console.log('@##=' + recordId);
            if (state === "SUCCESS") { 
                 
               		//console.log('@##=' + recordId);
                
                	var navEvt = $A.get("e.force:navigateToSObject");
                    navEvt.setParams({"recordId": recordId,"slideDevName": "related"});
                    navEvt.fire(); 
                 }
        });
            
        $A.enqueueAction(action);
    }
})