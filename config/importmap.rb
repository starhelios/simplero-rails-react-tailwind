# Pin npm packages by running ./bin/importmap

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/actioncable", to: "actioncable.esm.js"   
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js"

pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.26/nodelibs/browser/process-production.js"
pin "scheduler", to: "https://ga.jspm.io/npm:scheduler@0.23.0/index.js"
pin "@emoji-mart/data", to: "https://ga.jspm.io/npm:@emoji-mart/data@1.0.5/sets/14/native.json.js"
pin "@emoji-mart/react", to: "https://ga.jspm.io/npm:@emoji-mart/react@1.0.1/dist/module.js"
pin "emoji-mart", to: "https://ga.jspm.io/npm:emoji-mart@5.2.1/dist/module.js"
pin "application", preload: true
