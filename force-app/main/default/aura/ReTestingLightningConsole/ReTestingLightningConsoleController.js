({
    doInit : function(component, event, helper) {
        var action = component.get("c.modifiedCaseList");
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.caseList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    closeFocusedTab : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            
            workspaceAPI.getTabURL({
                tabId: focusedTabId
            }).then(function(response) {
                component.set("v.prevTabUrl",response)
            });
            workspaceAPI.closeTab({tabId: focusedTabId});
        })
        .catch(function(error) {
            alert("No Tab is opened or focused");
            alert(JSON.Stringify(error));
        });
    },
    
    openNewTab : function(component, event, helper) {
        var recordId = event.target.id;
        //alert(JSON.stringify(recordId));
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
         url: '#/sObject/'+recordId+'/view',
        }).then(function(response) {
            workspaceAPI.focusTab({tabId : response});
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    getAllTabInfo : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getAllTabInfo().then(function(response) {
            alert(JSON.stringify(response));
            console.log(response);
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    getOpenedTabURL : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.getTabURL({
                tabId: focusedTabId
            }).then(function(response) {
                alert(JSON.stringify(response));
            });
        })
        
        
        
       /* workspaceAPI.openTab({
            url: '#/sObject/001R0000003HgssIAC/view',
            focus: true
        }).then(function(response) {
            workspaceAPI.getTabURL({
                tabId: response
            }).then(function(response) {
                console.log(response);
            });
        })
        .catch(function(error) {
            console.log(error);
        });*/
    },
    
    openPreviousTab : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");  
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            url : component.get("v.prevTabUrl")
        }).then(function(response) {
            workspaceAPI.focusTab({tabId : response});
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    isFocusedTabSubtab : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            workspaceAPI.isSubtab({
                tabId: response.tabId
            }).then(function(response) {
                if (response) {
                    confirm("This tab is a subtab.");
                }
                else {
                    confirm("This tab is not a subtab.");
                }
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
    
    setFocusedTabIcon : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.setTabIcon({
                tabId: focusedTabId,
                icon: "action:approval",
                iconAlt: "Approval"
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    },
    
    setFocusedTabLabel : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            workspaceAPI.setTabLabel({
                tabId: focusedTabId,
                label: "Focused Tab"
            });
        })
        .catch(function(error) {
            console.log(error);
        });
    }
})