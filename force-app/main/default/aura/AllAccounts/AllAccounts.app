<aura:application extends="force:slds">
    
    <a onclick="{!c.callMethod}" href="#" name="first" title="FirstTitle">First</a><br/><br/>
    <a onclick="{!c.callMethod}"  href="#" name="Second" title="SecondTitle">Second</a>

    <lightning:button name="ltng" value="Click" label="ClickBtn" onclick="{!c.callMethod}"/>
</aura:application>