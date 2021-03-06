// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui/widgets/datepicker
//= require jquery_ujs
//= require bootstrap-sprockets
//= require filterrific/filterrific-jquery
//= require turbolinks
//= require select2
//= require bootbox
//= require libs/utils-form
//= require_tree ./app/services
//= require_tree ./app/controllers
//= require expensives


$(document).ready(function () {
    window.ExpensiveIndexController.init();
    window.CategoriesIndexController.init();
    $('select').select2({
        theme: "bootstrap"
    });


    $.rails.allowAction = function (element) {
        var message = element.data('confirm'),
            answer = false, callback;
        if (!message) {
            return true;
        }

        if ($.rails.fire(element, 'confirm')) {
            myCustomConfirmBox(message, function () {
                callback = $.rails.fire(element,
                    'confirm:complete', [answer]);
                if (callback) {
                    var oldAllowAction = $.rails.allowAction;
                    $.rails.allowAction = function () {
                        return true;
                    };
                    element.trigger('click');
                    $.rails.allowAction = oldAllowAction;
                }
            });
        }
        return false;
    }

    function myCustomConfirmBox(message, callback) {
        bootbox.confirm(message, function (confirmed) {
            if (confirmed) {
                callback();
            }
        });
    }

});

