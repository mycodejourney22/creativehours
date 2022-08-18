import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="follow"
export default class extends Controller {
  static targets = ["followNumber"]
  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  changeStatus(event){
    this.formElement = event.currentTarget.firstElementChild
    this.parentElement = event.currentTarget
    event.preventDefault()

    fetch(this.formElement.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
      body: new FormData(this.formElement)
    })
      .then(response => response.json())
      .then((data) => {
        this.parentElement.outerHTML = data.form
        this.followNumberTarget.outerHTML = data.follow_count
      })


  }
}
