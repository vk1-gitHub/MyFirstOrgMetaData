/*({
formPress: function(component, event, helper) {
		if (event.keyCode === 13) {
			helper.submitForm(component);
		}
		//$A.log(event);
	},
	buttonPress: function(component, event, helper) {
		helper.submitForm(component);
	} 
    
    
 })*/
({
 searchEvents: function(component, event, helper) {
    
     var txt = component.find("filter");
      var txt1 =txt.get("v.value");
     alert(txt1);
   },
    onRender: function (cmp) {
        var interval = setInterval($A.getCallback(function () {
            var progress = cmp.get('v.progress');
            cmp.set('v.progress', progress === 100 ? clearInterval(interval) : progress + 10);
        }), 200);
    },
    save : function(component, event, helper) {
        component.find("edit").get("e.recordSave").fire();
    }
    /*
    handleSubmit: function(component, event, helper) {
    var arr2 = [];
     arr2 = component.get("v.record");
      console.log("Array = "+arr2);      
    }*/
    
 /*    search : function(component, event, helper) {
        if(event.getParams().keyCode == 13){
          alert('Enter key pressed');
            // Do your work here
        }
         alert('hello');
    }*/
    
 })