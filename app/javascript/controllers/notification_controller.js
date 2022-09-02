import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['notification']
  static values = {id: String}

  close(id) {
    $('#alert-' + id).remove()
  }
}
