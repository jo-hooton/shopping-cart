import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["discountSlider", "discountValue", "cartTotal", "totalPrice"];

  connect() {
    this.discountSliderTarget.addEventListener("input", this.applyDiscount.bind(this));
  }

  applyDiscount() {
    const discount = this.discountSliderTarget.value;
    this.discountValueTarget.innerText = discount;

    let discountedTotal = this.cartTotalTarget.innerText - this.discountValueTarget.innerText;
    this.totalPriceTarget.innerText = discountedTotal.toFixed(2);
  }
}