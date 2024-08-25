// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers";

import "toastr/build/toastr.min.css";
import toastr from "toastr";



window.toastr = toastr; // Torna o toastr disponível globalmente

