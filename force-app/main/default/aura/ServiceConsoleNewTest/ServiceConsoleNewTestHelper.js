({
    getCaseList : function(component,priority) {
        var action = component.get("c.getCasesList");
        action.setParams({ casePriority : priority });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.caseList",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})