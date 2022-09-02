import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    document.addEventListener('trix-attachment-add', (event) => {
      var attachment = event.attachment
      if (attachment.file) {
        return this.uploadAttachment(attachment)
      }
    })
  }

  uploadAttachment = (attachment) => {
    var file = attachment.file
    var form = new FormData()
    var endpoint = '/images'
    form.append('Content-Type', file.type)
    form.append('image[image]', file)

    const xhr = new XMLHttpRequest()
    xhr.open('POST', endpoint, true)
    xhr.setRequestHeader('X-CSRF-Token', this.data.get('csrf'))

    xhr.upload.onprogress = (event) => {
      var progress = (event.loaded / event.total) * 100
      return attachment.setUploadProgress(progress)
    }

    xhr.onload = () => {
      if (xhr.status >= 200 && xhr.status < 300) {
        var data = JSON.parse(xhr.responseText)
        return attachment.setAttributes({
          url: data.url,
          href: data.url,
        })
      }
    }

    return xhr.send(form)
  }
}
