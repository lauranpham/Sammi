import flatpickr from "flatpickr"
 // Note this is important!

flatpickr(".datepicker", {
  dateFormat: "d.m.Y H:i",
  minDate: "today",
  enableTime: true
})
