import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {

  static values = {
    date: String
  }

  connect() {
    if (this.dateValue) {
      flatpickr(this.element, {
        enableTime: true,
        time_24hr: true,
        dateFormat: "d-m-Y H:i",
        defaultDate: "today"
      })

    } else {

      flatpickr(this.element, {
        enableTime: true,
        time_24hr: true,
        dateFormat: "d-m-Y H:i",
        defaultDate: "today"
      })
    }
  }
}
