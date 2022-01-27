import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.contentTarget.setAttribute(
        "style",
        `transform:translate(${this.data.get("translateX")}, ${this.data.get("translateY")});`
    );
  }

  // Show the popover
  mouseOver() {
    this.contentTarget.classList.remove("hidden");
  }

  // Hide the popover
  mouseOut() {
    this.contentTarget.classList.add("hidden");
  }
}
