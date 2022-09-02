import data from '@emoji-mart/data'
import {Picker} from 'emoji-mart'
import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['textArea', 'emojiMart']
  static values = {locale: String}

  connect() {
    this.initEmojiMartComponent()
  }

  initEmojiMartComponent() {
    if (this.hasTextAreaTarget || this.hasEmojiMartTarget) {

      $(this.textAreaTarget).append(
        '<div class="emoji-container">' +
          '<div class="emoji-icon">&#128512;</div>' +
          '<div class="emoji-mart absolute"></div>' +
          '</div>'
      )
      const emojiContainer = $(this.textAreaTarget).children('.emoji-container')
      let picker = this.initPicker($(this.textAreaTarget))
      const emojiMart = $(emojiContainer).children('.emoji-mart')

      emojiMart.empty().append(picker)
      emojiMart.addClass('hidden')
      $(emojiContainer)
        .children('.emoji-icon')
        .on('click', function () {
          emojiMart.toggleClass('hidden')
        })
      this.closeOnClickOutside()
    }
  }

  initPicker($target) {
    const $this = this
    const props = {
      data,
      onEmojiSelect: (e) => {
        $this.addEmoji(e, $target.children('.trix-content'))
      },
    }
    let picker = new Picker({...props})
    return picker
  }

  addEmoji(e, input) {
    const codesArray = e.unified.split('-').map((el) => `0x${el}`)
    input.val(input.val() + ' ' + String.fromCodePoint(codesArray))
  }

  closeOnClickOutside() {
    $(document).on('mouseup', function (e) {
      var container = $('.emoji-container')
      if (!container.is(e.target) && container.has(e.target).length === 0) {
        container.children('.emoji-mart').addClass('hidden')
      }
    })
  }
}
