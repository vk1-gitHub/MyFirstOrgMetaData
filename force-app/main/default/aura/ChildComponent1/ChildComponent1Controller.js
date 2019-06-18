({
	handleBubbling : function(component, event, helper) {
		var mgs = event.getParams("mgs");
        alert("In Child Component 1 "+mgs);
    }
})