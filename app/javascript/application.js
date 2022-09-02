// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import * as jquery from 'jquery'

window.jQuery = jquery
window.$ = $

import '@hotwired/turbo-rails'
import 'controllers'
import '@rails/actioncable'
import './controllers'
import './channels/notification_channel'
