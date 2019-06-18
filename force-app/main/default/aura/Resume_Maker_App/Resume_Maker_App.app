<aura:application extends="force:slds">
    <div class="slds-page-header slds-theme_success slds-align_absolute-center">
        <div class="slds-media">
            <div class="slds-media__figure">
                <span class="slds-icon_container slds-icon-standard-opportunity" title="Description of icon when needed">
                </span>
            </div>
            <div class="slds-media__body">
                <h1 class="slds-page-header__title slds-truncate slds-align-middle" title="Resume Maker">Resume Maker</h1>
                <p class="slds-text-body_small slds-line-height_reset">Reusme Builder Using Lightning Component</p>
            </div>
        </div>
    </div>
    
    <div class="slds-grid slds-wrap">
        <div class="slds-col slds-size_1-of-1 slds-medium-size_2-of-12 slds-large-size_2-of-12">
            <span><c:ResumeMaker_Menues /></span>
        </div>
        <div class="slds-col slds-size_1-of-1 slds-medium-size_10-of-12 slds-large-size_10-of-12">
            <span><c:ResumeMaker_Sections /> </span>
        </div> 
    </div>
</aura:application>