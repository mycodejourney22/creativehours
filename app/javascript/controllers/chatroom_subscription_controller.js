import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = { chatroomId: Number, currentArtistId: Number }
  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data)}
    )
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    const currentArtistIsSender = this.currentArtistIdValue === data.sender_id
    const messageElement = this.#buildMessageElement(currentArtistIsSender, data.message)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #buildMessageElement(currentArtistIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentArtistIsSender)}">
        <div class="${this.#userStyleClass(currentArtistIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentArtistIsSender) {
    return currentArtistIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentArtistIsSender) {
    return currentArtistIsSender ? "sender-style" : "receiver-style"
  }
}
