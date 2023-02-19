import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['card1', 'card2', 'card3',  'card4', 'card5'];

  next(event) {
    event.preventDefault();
    this.stimulate("HandReflex#next", this.handleCards());
  }

  previous(event) {
    event.preventDefault();
    this.stimulate("HandReflex#previous", this.handleCards());
  }

  handleCards() {
    return [
      this.card1Target.value,
      this.card2Target.value,
      this.card3Target.value,
      this.card4Target.value,
      this.card5Target.value,
    ]
  }
}