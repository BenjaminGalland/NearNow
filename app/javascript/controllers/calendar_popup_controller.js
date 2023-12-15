import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar-popup"
export default class extends Controller {
  static targets = ["event", "eventpopup" ]
  static values = {
    events: Array
  }
  connect() {
    console.log("salut c'est moi")
  }

  fire(e) {
    this.eventpopupTarget.innerHTML = ""

    const eventId = parseInt(e.target.dataset.eventid, 10)
    const event = this.eventsValue.find(event => event.id === eventId)
    const event_name = event.name
    const event_description = event.description
    const event_address = event.address

    const eventPopupInfos = `<h5>${event_name}</h5>
    <p>${event_description}</p>
    <p>${event_address}</p>
    <a href="events/${eventId}"> Voir l'évènement </a>`

    this.eventpopupTarget.insertAdjacentHTML("afterbegin", eventPopupInfos)

  }



}
