({   
    
        handleCreateExpense: function(component, event, helper) {
        var newExpense = event.getParam("expense");
        helper.createExpense(component, newExpense);
    },

    
        handleUpdateExpense: function(component, event, helper) {
        var updatedExp = event.getParam("expense");
        helper.updateExpense(component, updatedExp);
    },

    
    doInit: function(component, event, helper) {
            
          var action = component.get("c.getExpenses");
          action.setCallback(this, function(response) {
              
                var state = response.getState();
                if (state === "SUCCESS") {
                    component.set("v.expenses", response.getReturnValue());
                    console.log(response.getReturnValue());
                }
                else {
                    console.log("Failed with state: " + state);
                }
          });
        
        // Send action off to be executed
        $A.enqueueAction(action);
    }
    
    
})