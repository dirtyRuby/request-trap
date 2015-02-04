/**
 * Created by hp on 04.02.15.
 */
$(document).ready( function(){
    $('.user-name input').focusin(function(){
        $(this).toggleClass()
        $('.user-name label').toggleClass('focused-label');
    });
});