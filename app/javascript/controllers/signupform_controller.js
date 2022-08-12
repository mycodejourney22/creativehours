import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="signupform"
export default class extends Controller {
  connect() {

  }

  inputCheck(event){
     const inputField = event.currentTarget
     const labelField = inputField.previousSibling
    if (inputField.value.length > 0){
      labelField.classList.remove("opacity-0")
    }
    else {
      labelField.classList.add("opacity-0")
    }
  }
}
