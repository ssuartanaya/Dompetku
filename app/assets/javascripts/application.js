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
//= require Chart.bundle
//= require chartkick
//= require jquery.dataTables.min
//= require dataTables.bootstrap.min
//= require_tree .

var ready;
ready = function() {
    $('#index_table').DataTable();
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        startDate: '1d',
        todayHighlight: true,
        todayBtn: 'linked',
        weekStart: 1,
        autoclose: true
      })
    $('[data-toggle="tooltip"]').tooltip()
    Highcharts.chart('container', {
        chart: {
          type: 'pie'
        },
    
        title: {
          text: null
        },
    
        legend: {
          symbolWidth: 40,
        //       symbolHeight: 20,
          squareSymbol: false,
          symbolRadius: 0
        },
    
        plotOptions: {
          pie: {
            dataLabels: {
              enabled: false
            }
          }
        },
    
        series: [{
          showInLegend: true,
          data: [
            ['s1', 1],
            ['s2', 2],
            ['s3', 3],
            ['s4', 4],
            ['s5', 5],
            ['s5', 6],
            ['s5', 7],
            ['s5', 8],
          ]
        }],
      });
};
$(document).on('turbolinks:load', ready);