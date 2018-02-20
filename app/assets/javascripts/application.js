// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require sweetalert2
//= require sweet-alert2-rails
//= require_tree .

var ready;
ready = function() {
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        startDate: '1d',
        todayHighlight: true,
        todayBtn: 'linked',
        weekStart: 1,
        autoclose: true
      })
};
$(document).ready(ready);
$(document).on('page:load', ready);