({
      
    clickCreate: function(component, event, helper) {      
          /*var inputField = component.find('expenseform1');
          var inputValue = inputField.get('v.value');
           // var value = component.get('v.value');
           console.log('@@##1 ==' +inputValue);
           if( inputValue == '' || inputValue == null) {
               console.log('@@##2 ==' + inputValue);                       
               inputField.set('v.validity', {valid:false, badInput :true});
               inputField.showHelpMessageIfInvalid();
            }
        */
          
       
        
          
          var validExpense = component.find('expenseform').reduce(function (validSoFar, inputCmp) {
                 inputCmp.showHelpMessageIfInvalid();
                 return validSoFar && inputCmp.get('v.validity').valid;
              }, true);
        
      
          if(validExpense){
             
              helper.createExpense(component, event, helper);
          }
    },
    
    handleChange: function (cmp, event) {
        //  var toggleVal = cmp.find('inputcheck').get('v.value');
          var isChecked = cmp.find('inputcheck').get('v.checked');
          cmp.set('v.box1',isChecked);
    }
})