import "@hotwired/turbo-rails"
import "controllers"
import "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "bootstrap"
import "./packs/custom/comments"
import "./channels/chat_channels"

window.Rails = Rails
Rails.start()
ActiveStorage.start()

// Đảm bảo jQuery được load toàn cục
window.jQuery = window.$ = jQuery

document.addEventListener("turbo:load", function() {
  // Initialize all dropdowns
  var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'))
  var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
    return new bootstrap.Dropdown(dropdownToggleEl)
  })
});
