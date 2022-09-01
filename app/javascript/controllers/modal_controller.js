import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['wrapper']

  connect() {
    console.log('modal controller connected')
  }

  toggle() {
    this.wrapperTarget.classList.toggle('hidden')
  }
}
