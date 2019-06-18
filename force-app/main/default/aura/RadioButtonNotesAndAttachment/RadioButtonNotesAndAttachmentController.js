({
    handleChange: function (cmp, event) {
        var changevalue = event.getParam("value");
        
        var appEvent2 = $A.get("e.c:UpdatedRadioButtonEvent");
        appEvent2.setParams({ "updatedRadioButton" : changevalue });
        appEvent2.fire();
        
    }
});