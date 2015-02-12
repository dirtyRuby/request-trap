/**
 * Created by hp on 01.02.15.
 */

$(document).ready(function() {
    var tableLine = $('.listing-table tbody tr')
    tableLine.mouseover(function() {
        $(this).addClass('focused');
    });
    tableLine.mouseout(function() {
       $(this).removeClass('focused');
    });

    slider('.edit-btn', '.edit-form');
});