({
    save : function(component, event, helper) {
        alert('called');
        component.find("edit").get("e.recordSave").fire();
    }
})