/**
 * Created by hp on 01.02.15.
 */

$(document).ready(function() {
    var line = $('.trap-list-table tbody tr')
    line.mouseover(function() {
        $(this).addClass('focused');
    });
    line.mouseout(function() {
       $(this).removeClass('focused');
    })
});