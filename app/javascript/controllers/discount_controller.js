import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["discountSlider", "discountValue", "cartTotal", "totalPrice"];

  connect() {
    // reset discount slider to 0
    this.resetSlider();
    this.updateSliderBackground();
    this.discountSliderTarget.addEventListener("input", this.applyDiscount.bind(this));
  }

  applyDiscount() {
    // udpate discount and total
    const discount = this.discountSliderTarget.value;
    this.discountValueTarget.innerText = discount;

    let discountedTotal = this.cartTotalTarget.innerText - this.discountValueTarget.innerText;
    this.totalPriceTarget.innerText = discountedTotal;

    // update slider background style
    this.updateSliderBackground();
  }

  updateSliderBackground() {
    const min = parseFloat(this.discountSliderTarget.min);
    const max = parseFloat(this.discountSliderTarget.max);
    const value = ((this.discountSliderTarget.value - min) / (max - min)) * 100;

    this.discountSliderTarget.style.setProperty("--value", `${value}%`);
  }

  resetSlider() {
    this.discountSliderTarget.value = 0;
    this.updateSliderBackground();
  }
}