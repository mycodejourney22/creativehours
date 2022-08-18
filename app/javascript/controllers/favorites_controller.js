import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorites"
export default class extends Controller {
  static targets = ["output"]
  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")

  }

  changecolor(event){
    // event.currentTarget.classList.toggle("fill-red")
    event.preventDefault()
    const url = event.currentTarget.parentElement.action
    this.myform = event.currentTarget.parentElement
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      this.myform.outerHTML = data.form

    })
  }
}
