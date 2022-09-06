import data from '@emoji-mart/data'
import {Picker} from 'emoji-mart'
import {Controller} from '@hotwired/stimulus'
import tinymce from 'tinymce';

export default class extends Controller {
  static targets = ['tinymce'];
  static tm = null

  connect() {
    if (this.hasTinymceTarget) {
        this.tm = tinymce.init({
            selector: '#' +this.tinymceTarget['id'],
            plugins: "emoticons",
            toolbar: "emoticons",
            toolbar_location: "bottom",
            menubar: false,
            height: "140px",
        });
    }  
  }
}
