import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorites"
export default class extends Controller {
  static targets = ["output"]
  connect() {

  }

  changecolor(event){
    event.currentTarget.classList.remove("opacity-50")
    event.currentTarget.classList.toggle("fill-red")
    event.preventDefault()
  }
}
