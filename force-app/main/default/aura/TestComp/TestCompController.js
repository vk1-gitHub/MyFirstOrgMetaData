({
    handleChange: function (cmp, event) {
        var changeValue = event.getParam("value");
        alert(changeValue);
    },
    handleToggleChanged : function(component, event, helper) {
        var checked = component.get("v.checked");
        
        alert(checked);
        console.log("checked is now = " + checked);
    }
});