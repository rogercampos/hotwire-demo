import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.querySelector(".note-popover-content").setAttribute(
        "style",
        `transform:translate(-1%, -200%);`
    );

    this.element.addEventListener("mouseover", () => this.mouseOver())
    this.element.addEventListener("mouseout", () => this.mouseOut())
  }

  // Show the popover
  mouseOver() {
    this.element.querySelector(".note-popover-content").classList.remove("hidden");
  }

  // Hide the popover
  mouseOut() {
    this.element.querySelector(".note-popover-content").classList.add("hidden");
  }
}
