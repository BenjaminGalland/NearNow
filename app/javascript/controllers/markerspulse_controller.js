import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="markerspulse"
export default class extends Controller {

  connect() {
    console.log("Heba");

    // this.element.classList.add('marker-animate');
    //     this.element.addEventListener('animationend', () => {
    //         this.element.classList.remove('marker-animate');
    //     });

  }
}
