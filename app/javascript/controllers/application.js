import {Application} from '@hotwired/stimulus'
import consumer from 'channels/consumer'

const application = Application.start()
application.consumer = consumer
// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export {application}
