({
	handleClick : function(component, event, helper) {
		var cmpEvent = component.getEvent("messageEvent");
        cmpEvent.setParams("mgs","Hello, How are you ?");
        cmpEvent.fire();
	}
})