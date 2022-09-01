import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    console.log('controller connected')
  }

  log() {
    console.log('button pressed')
  }
}
