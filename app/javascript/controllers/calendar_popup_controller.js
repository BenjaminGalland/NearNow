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
    const dayEvents = JSON.parse(e.target.dataset.dayevents)

    document.querySelectorAll(".day").forEach((day) => {
      day.classList.remove("case-selected")
    })
    const calendar_box = e.target.closest(".day")
    calendar_box.classList.add("case-selected")


    dayEvents.forEach((dayevent) => {
      const eventPopupInfos = `<div class="events-popup-infos"><h5 class="event-dashb-title">${dayevent.name}</h5>
      <p class="event-dashb-description">${dayevent.name}</p>
      <i><p class="event-dashb-address"><i class="fa-solid fa-location-dot"></i>  ${dayevent.address}</p></i>
      <a href="events/${dayevent.id}"> Voir l'évènement </a></div>`

      this.eventpopupTarget.insertAdjacentHTML("afterbegin", eventPopupInfos)
    })
  }

}
