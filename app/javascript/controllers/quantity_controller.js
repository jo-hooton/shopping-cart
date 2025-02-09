import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];

  // increment and decrement item quantity and submit form
  increment() {
    let value = parseInt(this.inputTarget.value, 10);
    this.inputTarget.value = value + 1;
    this.inputTarget.form.requestSubmit();
  }

  decrement() {
    let value = parseInt(this.inputTarget.value, 10);
    if (value > 1) {
      this.inputTarget.value = value - 1;
      this.inputTarget.form.requestSubmit();
    }
  }
}
