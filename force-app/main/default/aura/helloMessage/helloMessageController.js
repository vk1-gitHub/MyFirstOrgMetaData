({
	save : function(component, event, helper) {
    component.find("edit").get("e.recordSave").fire();

        
},
   
    handleClick: function (cmp, event) {
        var address = cmp.find("myaddress");
        var isValid = address.checkValidity();
        if(isValid) {
            alert("Creating new address");
        }
        else {
            address.showHelpMessageIfInvalid();
        }
    }
})