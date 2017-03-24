/*
 * Created by gustavo on 1/5/17.
*/

jQuery(document).ready(function ($) {
    $('select').select2({
        theme: "bootstrap"
    });

    //open/close lateral filter
    $('.cd-filter-trigger').on('click', function (e) {
        e.preventDefault();
        triggerFilter(true);
    });
    $('.cd-filter .cd-close').on('click', function (e) {
        e.preventDefault();
        triggerFilter(false);
    });

    function triggerFilter($bool) {
        var elementsToTrigger = $([$('.cd-filter-trigger'), $('.cd-filter')]);
        elementsToTrigger.each(function () {
            $(this).toggleClass('filter-is-visible', $bool);
        });
    };

    //close filter dropdown inside lateral .cd-filter
    $('.cd-filter-block h4').on('click', function (e) {
        e.preventDefault();
        $(this).toggleClass('closed').siblings('.cd-filter-content').slideToggle(300);
    });
});

