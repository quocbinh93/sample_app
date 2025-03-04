import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "bootstrap"
import "@hotwired/turbo-rails"

window.Rails = Rails
Rails.start()
ActiveStorage.start()