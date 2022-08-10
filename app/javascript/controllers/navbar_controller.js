import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["listItem"]
  connect() {
    console.log("I am working well")
  }

  displayList() {
    console.log(this.listItemTarget)
    this.listItemTarget.classList.toggle("hidden")
  }
}
