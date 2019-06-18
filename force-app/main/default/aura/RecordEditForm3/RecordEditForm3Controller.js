({
	doInit : function(component, event, helper) {
		//alert(JSON.stringify(component.get("v.contactObj")));
	},
    
   /* handleSubmit: function(component, event, helper){
        alert('ID' + component.find("accountId").get("v.accountId"));
        alert('Value' + component.find("accountId").get("v.value"));
         //component.set("v.contactObj.AccountId", component.find("accountId").get("v.accountId"));
	},*/
    handleOnSuccessEvent : function(component, event){
        component.set("v.contactObj.AccountId",event.getParam("accountId"));
        //alert(event.getParam("accountId"));
    },
    handleSuccess : function(component,event){
        var payload = event.getParams().response;
        component.set("v.recordId", payload.id);
    }
})