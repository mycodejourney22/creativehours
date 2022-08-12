import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["customLabelInput", "customPasswordField", "customLabelPassword","customInputField"]

  connect() {

  }

  checkInput(){
    if (this.customInputFieldTarget.value.length > 0){
      this.customLabelInputTarget.classList.remove("d-none")
    }
    else {
      this.customLabelInputTarget.classList.add("d-none")
    }
  }

  checkPassword(){
    if (this.customPasswordFieldTarget.value.length > 0){
      this.customLabelPasswordTarget.classList.remove("d-none")
    }
    else {
      this.customLabelPasswordTarget.classList.add("d-none")
    }
  }
}
