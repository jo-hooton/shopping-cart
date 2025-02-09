import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["discountSlider", "discountAmount", "cartTotal", "totalPrice"];

  connect() {
    this.updateSliderBackground();
    this.discountSliderTarget.addEventListener("input", this.applyDiscount.bind(this));
    this.discountSliderTarget.addEventListener("change", this.submitForm.bind(this)); // submit form when slider stops moving
  }

  applyDiscount() {
    const discount = this.discountSliderTarget.value;

    // update discount amount displayed
    this.discountAmountTarget.innerText = discount;

    // update total price displayed
    let discountedTotal = this.cartTotalTarget.innerText - discount;
    this.totalPriceTarget.innerText = discountedTotal;

    this.updateSliderBackground();
  }

  submitForm() {
    this.discountSliderTarget.form.requestSubmit();
  }

  updateSliderBackground() {
    // update slider background color
    const min = this.discountSliderTarget.min;
    const max = this.discountSliderTarget.max;
    const value = ((this.discountSliderTarget.value - min) / (max - min)) * 100;

    this.discountSliderTarget.style.setProperty("--value", `${value}%`);
  }
}
