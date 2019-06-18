({
	getCases : function(component, event, helper) {
      var priority = event.getSource().get('v.name');
        helper.getCaseList(component, priority);
	},
    openTab : function(component, event, helper) {
        var tabId = event.target.id;
        var name = event.target.name;
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            //recordId: tabId,
            url: '#/sObject/'+tabId+'/view',
            focus: true
        }).then(function(response) {
            workspaceAPI.getTabInfo({
                tabId: response
            }).then(function(tabInfo) {
                console.log("The url for this tab is: " + tabInfo.url);
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },

    getTabURL : function(component, event, helper){
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            alert(JSON.stringify(response));
           // alert(JSON.stringify(response.url));
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    getOpenedTabURL : function(component, event, helper) {
        var tabId = event.getSource().get('v.name');
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            url: '#/sObject/'+tabId+'/view',
            focus: true
        }).then(function(response) {
            workspaceAPI.getTabURL({
                tabId: response
            }).then(function(response) {
                alert(JSON.stringify(response));
                console.log(response);
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    setFocusedTabHighlighted : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.setTabHighlighted({
                tabId: focusedTabId,
                highlighted: true
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
       sendStatus : function(component, event, helper) {
        var newArray = [];
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getAllTabInfo().then(function(response) {
            response.forEach(function(element){
                newArray.push(element.recordId);
            });
            
            alert(JSON.stringify(newArray));
            
            if(newArray != null){
                var action = component.get("c.sendStatusMail");
                action.setParams({ caseIdList : newArray });
                action.setCallback(this, function(response) {
                    var state = response.getState();
                    if (state === "SUCCESS") {
                        console.log(response.getReturnValue());
                        //component.set("v.caseList",response.getReturnValue());
                    }
                });
                $A.enqueueAction(action);
            }
            
            
            //console.log(JSON.stringify(response));
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    closeAllTabs : function(component, event, helper){
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getAllTabInfo().then(function(response) {
            response.forEach(function(element){
                workspaceAPI.closeTab({tabId: element.tabId});
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    setPanelWidth : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.setPanelWidth({
            widthPX: 800
        });
    },
    
    setUtilityHighlighted : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar").setUtilityHighlighted({highlighted: true });
    },
    toggleModalMode : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.toggleModalMode({
            enableModalMode: true
        });
    }
    
})