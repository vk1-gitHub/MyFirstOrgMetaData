({
	handleBubbling : function(component, event, helper) {
		var mgs = event.getParams("mgs");
        alert("In Parent Component  "+mgs);
	}
})