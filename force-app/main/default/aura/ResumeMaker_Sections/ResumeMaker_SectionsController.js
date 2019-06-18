({
    doInit : function(component, event, helper) {
        
        component.set("v.heading","Personal_Information"); 
        var action = component.get("c.getFieldset");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.Result",(response.getReturnValue()));
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action); 
    },
    addNewRow: function(component, event, helper) {
        var heading = component.get("v.heading");
        //alert(heading);
        var num = component.get("v.rowIndex");
        num += 1;
        component.set("v.rowIndex",num); 
        helper.createObjectData(component, event,heading);
    }, 
    removeRow: function(component, event, helper) {
        var num = component.get("v.rowIndex");
        num -= 1;
        component.set("v.rowIndex",num);
        
        var conList = component.get("v.contactList");
        var ExpMap = component.get("v.expAddRowMap");
        var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
            ExpMap[''+inputCmp.get('v.name')+'']=''+''+'';    
        },true);
        conList.pop(JSON.parse(JSON.stringify(ExpMap)));
        component.set("v.ExperienceVar",true);
        component.set("v.contactList",conList);
    },
    handleMenuEvent : function(component, event, helper) {   
        var valueHandler = component.get("v.valueHandler");
        if(valueHandler == true){
            var newMap = component.get("v.myMap");
            var iteration = component.find('pInfoForm').forEach(function (inputCmp){
                newMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';    
            },true);
            component.set('v.conObj',newMap);
            helper.setValue(component,event);
        }
        
        var selectedName = event.getParam("name");
        var getMenuLabel = event.getParam("menuLabel");
        
        component.set("v.menuLabelList",getMenuLabel);
        component.set("v.heading",selectedName); 
        
        if(selectedName!= null){
            component.set('v.valueHandler',true);
            if(selectedName == 'Personal_Information') {
                var action = component.get("c.getFieldset");  
            }
            else if(selectedName == 'Summary'){
                var action = component.get("c.getSummaryFieldset"); 
            }
                else{
                    var action = component.get("c.getFieldsSet");
                    action.setParams({ fieldSet : selectedName });
                    
                }
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    component.set("v.Result",response.getReturnValue());
                    helper.setValue(component,event);
                }
            });
            $A.enqueueAction(action);
        } 
        /*  if(selectedName == 'Experience'){
           component.set("v.Experience",true);
        }
        else{
            component.set("v.Experience",false);
        }*/
        
        
    },
    handleSave : function(component,event,helper){
        var heading = component.get("v.heading");
        
        var newMap = component.get("v.myMap");
        var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
            newMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';    
        },0);
        
        console.log('Mapfill'+JSON.stringify(newMap));
        
        var obj = component.get("v.conObj");      
        if (obj.Id != null) {
            newMap['Id'] = ''+obj.Id+'';
        }
        component.set('v.conObj',newMap);
        
        if(heading =='Personal_Information' || heading =='Summary'){
            var PInfoSummaryMap = component.get("v.PInfoSummaryMap");
            var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                PInfoSummaryMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';    
            },true);
            component.set('v.conObj2',PInfoSummaryMap);
        }
        else if(heading == 'Experience'){
            var expList = component.get("v.expList");
            var expMap = component.get("v.expMap");
            var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                expMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
            },true);
            
            if(component.get("v.ExperienceVar") == true){
                var expMap1 = component.get("v.expMap1");
                var iteration = component.find('pInfoForm1').reduce(function(validsoFar, inputCmp){
                    expMap1[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                    expList.push(''+inputCmp.get('v.name')+ ' : '+inputCmp.get('v.value')+''); 
                },true);
            }
            
            var exp;
            if(component.get("v.ExperienceVar") == true){
                expList.push(expMap);
                exp = JSON.stringify(expList);
            }
            else{
                exp = JSON.stringify(expMap); 
            }
            
            
            // console.log(exp);
            component.set("v.conObj2.Experience__c",exp);
        }
            else if(heading == 'Education'){
                var educationMap = component.get("v.educationMap");
                var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                    educationMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                },true);
                
                var edu = '"'+JSON.stringify(educationMap)+'"';
                component.set("v.conObj2.Education__c",edu);  
            }
                else if(heading == 'Skill'){
                    var skillMap = component.get("v.skillMap");
                    var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                        skillMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                    },true);
                    
                    var skill = '"'+JSON.stringify(skillMap)+'"';
                    component.set("v.conObj2.Skill__c",skill);
                }
                    else if(heading == 'Language'){
                        var languageMap = component.get("v.languageMap");
                        var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                            languageMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                        },true);
                        
                        var lang = '"'+JSON.stringify(languageMap)+'"';
                        component.set("v.conObj2.Language__c",lang);
                    }  
        
        var ContactObj = component.get("v.conObj2");
        
        var action = component.get("c.saveDetail");
        action.setParams({
            "con": ContactObj
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.conObj",response.getReturnValue());
                component.set("v.conObj2",response.getReturnValue());
                console.log(JSON.stringify(response.getReturnValue()));
                alert("Saved");
            }
            if (state === "ERROR"){
                alert(JSON.stringify(response.getError()));
            }
            
        });
        $A.enqueueAction(action);
    },
    handleSaveAndNext : function(component, event, helper) {
        
        var heading = component.get("v.heading");
        var newMap = component.get("v.myMap");
        var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
            newMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';    
        },0);
        
        console.log('Mapfill'+JSON.stringify(newMap));
        
        var obj = component.get("v.conObj");      
        if (obj.Id != null) {
            newMap['Id'] = ''+obj.Id+'';
        }
        component.set('v.conObj',newMap);
        
        if(heading =='Personal_Information' || heading =='Summary'){
            var PInfoSummaryMap = component.get("v.PInfoSummaryMap");
            var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                PInfoSummaryMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';    
            },true);
            component.set('v.conObj2',PInfoSummaryMap);
        }
        else if(heading == 'Experience'){
            
            var expMap = component.get("v.expMap");
            var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                expMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
            },true);
            
            var exp = '"'+JSON.stringify(expMap)+'"';  
            component.set("v.conObj2.Experience__c",exp);
        }
            else if(heading == 'Education'){
                var educationMap = component.get("v.educationMap");
                var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                    educationMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                },true);
                
                var edu = '"'+JSON.stringify(educationMap)+'"';
                component.set("v.conObj2.Education__c",edu);  
            }
                else if(heading == 'Skill'){
                    var skillMap = component.get("v.skillMap");
                    var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                        skillMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                    },true);
                    
                    var skill = '"'+JSON.stringify(skillMap)+'"';
                    component.set("v.conObj2.Skill__c",skill);
                }
                    else if(heading == 'Language'){
                        var languageMap = component.get("v.languageMap");
                        var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                            languageMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                        },true);
                        
                        var lang = '"'+JSON.stringify(languageMap)+'"';
                        component.set("v.conObj2.Language__c",lang);
                    }  
        
        var ContactObj = component.get("v.conObj2");        
        var action = component.get("c.saveDetail");
        action.setParams({
            "con": ContactObj
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.conObj",response.getReturnValue());
                component.set("v.conObj2",response.getReturnValue());
                console.log(JSON.stringify(response.getReturnValue()));
                
                alert("Saved");
            }
            if (state === "ERROR"){
                alert(JSON.stringify(response.getError()));
            }
            
        });
        $A.enqueueAction(action);
        
        var menuLabel = [];
        menuLabel = component.get("v.menuLabelList");
        var heading = component.get("v.heading");
        
        var index = menuLabel.indexOf(heading);
        var selected = menuLabel[index + 1];
        var prev = menuLabel[index - 1];
        
        var appEvent = $A.get("e.c:MenuEvent");
        appEvent.setParams({ name : selected,
                            menuLabel : menuLabel
                           });
        appEvent.fire();
        
    },
    handleNext : function(component, event, helper) {
        var menuLabel = [];
        menuLabel = component.get("v.menuLabelList");
        var heading = component.get("v.heading");
        
        var index = menuLabel.indexOf(heading);
        var selected = menuLabel[index + 1];
        var prev = menuLabel[index - 1];
        
        var appEvent = $A.get("e.c:MenuEvent");
        appEvent.setParams({ name : selected,
                            menuLabel : menuLabel
                           });
        appEvent.fire();   
        
        
        if(selected == 'Experience'){
            component.set('v.Experience',true);
        }
        else{
            component.set('v.Experience',false);
        }
        
        var newMap = component.get("v.myMap");
        var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
            newMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';    
        },true);
        
        console.log('Mapfill'+JSON.stringify(newMap));    
        
        var obj = component.get("v.conObj");      
        if (obj.Id != null) {
            newMap['Id'] = ''+obj.Id+'';
        }
        
        component.set('v.conObj',newMap);
        
        if(heading =='Personal_Information' || heading =='Summary'){
            component.set('v.ExperienceVar',false);
            var PInfoSummaryMap = component.get("v.PInfoSummaryMap");
            var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                PInfoSummaryMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';    
            },true);
            component.set('v.conObj2',PInfoSummaryMap);
        }
        else if(heading == 'Experience'){
            var expsList = component.get("v.expList2");
            var expMap = component.get("v.expMap");
            var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                expMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                expsList.push(''+inputCmp.get('v.name')+ ' : '+inputCmp.get('v.value')+'');
            },true);
            
            if(component.get("v.ExperienceVar") == true){
                var expMap1 = component.get("v.expMap1");
                var iteration = component.find('pInfoForm1').reduce(function(validsoFar, inputCmp){
                    expMap1[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                    expsList.push(''+inputCmp.get('v.name')+ ' : '+inputCmp.get('v.value')+''); 
                },true);
            }
            
            
            /* var ContactObj = component.get("v.conObj");
            component.find("pInfoForm1").forEach(function (inputCmp) {
                var apiName = inputCmp.get("v.name");
                if(ContactObj[apiName]!=null)
                    inputCmp.set("v.value", ContactObj[apiName]);
            },0);*/
            
            var expList = component.get("v.expList");
            expList.push(expMap);
            if(component.get("v.ExperienceVar") == true){
                alert("Entered");
                expList.push(expMap1);
            }
            
            //  var exp = JSON.stringify(expList);
            var exp = JSON.stringify(expsList);
            component.set("v.conObj2.Experience__c",exp);
            component.set('v.ExperienceVar',false);
        }
            else if(heading == 'Education'){
                component.set('v.ExperienceVar',false);
                var educationMap = component.get("v.educationMap");
                var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                    educationMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                },true);
                
                var edu = JSON.stringify(educationMap);
                component.set("v.conObj2.Education__c",edu);
            }
                else if(heading == 'Skill'){
                    var skillMap = component.get("v.skillMap");
                    var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                        skillMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                    },true);
                    
                    var skill = JSON.stringify(skillMap);
                    component.set("v.conObj2.Skill__c",skill);
                }
                    else if(heading == 'Language'){
                        var languageMap = component.get("v.languageMap");
                        var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){
                            languageMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';
                        },true);
                        
                        var lang = JSON.stringify(languageMap);
                        component.set("v.conObj2.Language__c",lang);
                    }
        
        
    },
    handleBack : function(component, event, helper) {
        var menuLabel = [];
        menuLabel = component.get("v.menuLabelList");
        var heading = component.get("v.heading");
        
        var index = menuLabel.indexOf(heading);
        var selected = menuLabel[index - 1];
        
        var appEvent = $A.get("e.c:MenuEvent");
        appEvent.setParams({ name : selected,
                            menuLabel : menuLabel
                           });
        appEvent.fire();
        
        if(heading == 'Experience'){
            component.set("v.Experience",true);
        }
        else{
            component.set("v.Experience",false);
        }
        
        
        if(selected == 'Experience'){
            component.set('v.ExperienceVar',true);
        }
        else{
            component.set('v.ExperienceVar',false);
        }
        
        
        var newMap = component.get("v.myMap");
        var iteration = component.find('pInfoForm').reduce(function(validsoFar, inputCmp){ 
            newMap[''+inputCmp.get('v.name')+'']=''+inputCmp.get('v.value')+'';    
        },true);
        
        console.log('Mapfill'+JSON.stringify(newMap));
        
        var obj = component.get("v.conObj");      
        if (obj.Id != null) {
            newMap['Id'] = ''+obj.Id+'';
        }
        component.set('v.conObj',newMap); 
    },
    AddEducationRow : function(component, event, helper) { 
        var num = component.get("v.EducationRowIndex");
        num += 1;
        component.set("v.EducationRowIndex",num);
        helper.createEducationtData(component, event);
        
    },
    removeEducationRow : function(component, event, helper) { 
        var num = component.get("v.EducationRowIndex");
        num -= 1;
        component.set("v.EducationRowIndex",num);
        var AllRowsList = component.get("v.EducationList");
        AllRowsList.splice(-1, 1);
        component.set("v.EducationList", AllRowsList);
    }
})