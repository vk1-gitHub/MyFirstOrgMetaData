import { loadStyle } from 'lightning/platformResourceLoader';
import { LightningElement, api } from 'lwc';
import ursusResources from '@salesforce/resourceUrl/ursus_park';
export default class BearTile extends LightningElement {
    @api bear;
    connectedCallback() {
        loadStyle(this, ursusResources + '/style.css');
    }
    handleOpenRecordClick() {
        const selectEvent = new CustomEvent('bearview', {
            bubbles: true
        });
        this.dispatchEvent(selectEvent);
    }
}