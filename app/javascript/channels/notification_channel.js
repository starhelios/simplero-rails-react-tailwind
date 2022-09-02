import consumer from './consumer'

consumer.subscriptions.create('NotificationChannel', {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('connected')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var n_id = Math.floor(Math.random() * 1000)
    var notification_area = $('#notificationArea')
    notification_area.prepend(
      '<div id="alert-' +
        n_id +
        '" class="flex p-4 mb-4 bg-blue-100 rounded-lg dark:bg-blue-200" role="alert" data-controller="notification">' +
        '<div class="ml-3 text-sm font-medium text-blue-700 dark:text-blue-800">' +
        data.body +
        '</div>' +
        '<button type="button" class="ml-auto -mx-1.5 -my-1.5 bg-blue-100 text-blue-500 rounded-lg focus:ring-2 focus:ring-blue-400 p-1.5 hover:bg-blue-200 inline-flex h-8 w-8 dark:bg-blue-200 dark:text-blue-600 dark:hover:bg-blue-300" data-action="click->notification#close" aria-label="Close"> ' +
        '<span class="sr-only">Close</span>' +
        '<svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="eveno?dd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>' +
        '</button>' +
        '</div>'
    )
  },
})
