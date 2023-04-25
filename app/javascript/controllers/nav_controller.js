// nav_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['menu']
  
  connect() {
    console.log("Nav controller connected");
  }

  toggleMenu() {
    console.log('toggleMenu')
    this.menuTarget.classList.toggle('hidden')
  }
}
