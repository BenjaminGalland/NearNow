import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-maxpeople"
export default class extends Controller {
  static targets = ["input"]

  connect() {
  }

  toggle(){
    this.inputTarget.classList.toggle("d-none");
  }
}
