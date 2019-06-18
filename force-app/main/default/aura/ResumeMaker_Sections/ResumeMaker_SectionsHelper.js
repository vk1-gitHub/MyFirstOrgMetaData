({ 
    setValue : function(component,event){
        
        var ContactObj = component.get("v.conObj");
        component.find("pInfoForm").forEach(function (inputCmp) {
            var apiName = inputCmp.get("v.name");
            if(ContactObj[apiName]!=null)
         	  	inputCmp.set("v.value", ContactObj[apiName]);
        },0);
    },
    createObjectData: function(component, event,heading) {      
        var conList = component.get("v.contactList");
        var ExpMap = component.get("v.expAddRowMap");
         var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                ExpMap[''+inputCmp.get('v.name')+'']=''+''+'';    
            },true);
        conList.push(JSON.parse(JSON.stringify(ExpMap)));
        component.set("v.ExperienceVar",true);
        component.set("v.contactList",conList);
       
        //conList.push({JSON.stringify(component.get("v.Result"))});
       console.log('ParentList == '+conList);
       
    },
    createEducationtData : function(component, event) {
    
        var newVar = component.get("v.EducationList");
        newVar.push({});
        component.set("v.EducationList",newVar);
    
    },
    // helper function for check if first Name is not null/blank on save  
    validateRequired: function(component, event) {
        var isValid = true;
        var allContactRows = component.get("v.contactList");
        for (var indexVar = 0; indexVar < allContactRows.length; indexVar++) {
            if (allContactRows[indexVar].FirstName == '') {
                isValid = false;
                alert('First Name Can\'t be Blank on Row Number ' + (indexVar + 1));
            }
        }
        return isValid;
    },})