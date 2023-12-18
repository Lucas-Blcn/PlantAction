import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["startDate", "endDate"]

  connect() {
    flatpickr(this.element)
    this.initializeStartDatePicker();
    this.initializeEndDatePicker();
  }


  initializeStartDatePicker() {
    flatpickr(this.startDate, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    });
  }

  initializeEndDatePicker() {
    flatpickr(this.endDate, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    });
  }
}
