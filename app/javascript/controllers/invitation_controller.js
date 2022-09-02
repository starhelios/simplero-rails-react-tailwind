import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['linkMsg', 'inviteLink']

  copyLink() {
    navigator.clipboard.writeText(this.inviteLinkTarget.value)
    this.linkMsgTarget.innerText = '(Copied)'
  }
}
