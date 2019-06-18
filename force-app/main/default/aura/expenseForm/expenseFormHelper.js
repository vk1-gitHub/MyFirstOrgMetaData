({
	    createExpense: function(component, newExpense) {
            var createEvent = component.getEvent("createExpense");
            createEvent.setParams({ "expense": newExpense });
            createEvent.fire();
    },
        updateExpense: function(component, expense) {
            var action = component.get("c.saveExpense");
            action.setParams({
                "expense": expense
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                // do nothing!
            }
        });
        $A.enqueueAction(action);
    }


})