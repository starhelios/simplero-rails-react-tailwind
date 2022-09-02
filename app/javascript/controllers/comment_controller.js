import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['wrapper', 'editor']

  addComment() {
    this.hideOpenedForms()
    this.wrapperTarget.classList.toggle('hidden')
  }

  editComment() {
    this.hideOpenedForms()
    this.editorTarget.classList.toggle('hidden')
  }

  hideOpenedForms() {
    const otherCommentForms = document.querySelectorAll('.dynamic-comment')
    otherCommentForms.forEach((cform) => cform.classList.add('hidden'))
  }
}
