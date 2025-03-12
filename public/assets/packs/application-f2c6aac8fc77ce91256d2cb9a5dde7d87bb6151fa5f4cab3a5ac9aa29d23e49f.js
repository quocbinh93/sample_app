import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "bootstrap"
import "@hotwired/turbo-rails"
import "controllers"
import "./custom/comments"
import "./channels/chat_channels"

window.Rails = Rails
Rails.start()
ActiveStorage.start();
