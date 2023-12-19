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

    const eventPopupInfos = `<h5 class="event-dashb-title">${event_name}</h5>
    <p class="event-dashb-description">${event_description}</p>
    <i><p class="event-dashb-address"><i class="fa-solid fa-location-dot"></i>  ${event_address}</p></i>
    <a href="events/${eventId}"> Voir l'évènement </a>`

    this.eventpopupTarget.insertAdjacentHTML("afterbegin", eventPopupInfos)

  }



}
