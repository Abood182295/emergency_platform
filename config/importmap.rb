# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
<<<<<<< HEAD
=======
pin "bootstrap", to: "bootstrap.bundle.min.js"
>>>>>>> 05edbb2529e47c264ecfe3a980c118e24c0ae272
