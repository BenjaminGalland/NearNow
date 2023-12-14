import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: true,
      time_24hr: true,
      dateFormat: "d-m-Y H:i"
    })
  }
}
