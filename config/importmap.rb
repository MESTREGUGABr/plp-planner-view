# Pin npm packages by running ./bin/importmap

pin "application"
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "toastify", to: "https://cdn.jsdelivr.net/npm/toastify-js@1.12.0/src/toastify.min.js"
pin "toastify-css", to: "https://cdn.jsdelivr.net/npm/toastify-js@1.12.0/src/toastify.min.css"
