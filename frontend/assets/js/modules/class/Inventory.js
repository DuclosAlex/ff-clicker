

class Inventory extends HTMLElement {

    constructor(inventory) {

        super();
        this.xp = inventory.xp_amount;
        this.powerclick = inventory.powerclick_amount;
    }

    addXP () {

        this.xp += this.powerclick;
        console.log(this.xp);
        this.querySelector('#xp_amount').textContent = this.xp;
    }
    
    addPowerclick(persoLvlUp) {
        
        this.powerclick += persoLvlUp.powerclick_base;
        console.log(this.powerclick);
        this.querySelector('#powerclick_amount').textContent = this.powerclick;

    }

    connectedCallback() {

        const templateInventoryElem = document.querySelector('.menu-article');

        const cloneTemplateInventoryElem = templateInventoryElem.content.cloneNode(true);

        cloneTemplateInventoryElem.querySelector('#xp_amount').textContent = this.xp;

        cloneTemplateInventoryElem.querySelector('#powerclick_amount').textContent = this.powerclick;

        console.log(cloneTemplateInventoryElem);
        this.appendChild(cloneTemplateInventoryElem);

    }


}
customElements.define("inventory-section", Inventory);

export default Inventory;