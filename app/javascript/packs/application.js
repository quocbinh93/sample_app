import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "bootstrap"
import "@hotwired/turbo-rails"

window.Rails = Rails
Rails.start()
Turbolinks.start()
ActiveStorage.start()