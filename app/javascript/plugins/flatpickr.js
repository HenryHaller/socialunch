import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
  maxDate: "today",
  altInput: true,
  altFormat: "F j, Y"
})
