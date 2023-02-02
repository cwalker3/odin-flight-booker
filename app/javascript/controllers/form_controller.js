import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "subform"]



  add() {
    let lastPassenger = this.subformTargets.pop();
    let subformClone = this.subformTarget.cloneNode(true);

    lastPassenger.after(subformClone)

    let attributes = this.getAttributes(this.subformTargets.length)
    let fields = this.getFields(subformClone)

    this.setAttributes(fields, attributes)
    this.removeValues(subformClone, fields, attributes)
  }

  remove() {
    let passengerCount = this.subformTarget.parentNode.parentNode.parentNode.children.length - 4;
    if (passengerCount <= 1) return;

    this.subformTarget.parentNode.parentNode.remove();

    this.updatePassengers();
  }

  getAttributes(index) {
    return {
    nameID: `booking_passengers_attributes_${index - 1}_name`,
    emailID: `booking_passengers_attributes_${index - 1}_email`,
    nameName: `booking[passengers_attributes][${index - 1}][name]`,
    emailName: `booking[passengers_attributes][${index - 1}][email]`,
    passengerHeading: `Passenger ${index}`
    }
  }

  getFields(subform) {
    return {
      nameLabel: subform.querySelectorAll('label')[0],
      nameInput: subform.querySelectorAll('input')[0],
      emailLabel: subform.querySelectorAll('label')[1],
      emailInput: subform.querySelectorAll('input')[1],
      passengerHeading: subform.querySelector('h3')

    }
  }

  setAttributes(fields, attributes) {
    fields.nameLabel.setAttribute('for', attributes.nameID);
    fields.nameInput.setAttribute('id', attributes.nameID);
    fields.nameInput.setAttribute('name', attributes.nameName);
    fields.emailLabel.setAttribute('for', attributes.emailID);
    fields.emailInput.setAttribute('id', attributes.emailID);
    fields.emailInput.setAttribute('name', attributes.emailName);
    fields.passengerHeading.innerHTML = attributes.passengerHeading
  }

  removeValues(subform, fields, attributes) {
    fields.nameInput.value = ''
    fields.emailInput.value = ''
  }

  updatePassengers() {
    let passengers = document.querySelectorAll('.subform')

    for (let i = 0; i < passengers.length; i++) {
      let attributes = this.getAttributes(i + 1)
      let fields = this.getFields(passengers[i])
      this.setAttributes(fields, attributes)

    }
  }
}
