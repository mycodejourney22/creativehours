import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["customLabelInput", "customPasswordField", "customLabelPassword","customInputField"]

  connect() {

  }

  checkInput(){
    if (this.customInputFieldTarget.value.length > 0){
      this.customLabelInputTarget.classList.remove("opacity-0")
    }
    else {
      this.customLabelInputTarget.classList.add("opacity-0")
    }
  }

  checkPassword(){
    if (this.customPasswordFieldTarget.value.length > 0){
      this.customLabelPasswordTarget.classList.remove("opacity-0")
    }
    else {
      this.customLabelPasswordTarget.classList.add("opacity-0")
    }
  }
}
