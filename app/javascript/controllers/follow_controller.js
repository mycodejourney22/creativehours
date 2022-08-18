import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="follow"
export default class extends Controller {
  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  changeStatus(event){
    this.formElement = this.element.firstElementChild
    event.preventDefault()

    fetch(this.formElement.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        this.formElement.outerHTML = data.form
      })


  }
}
