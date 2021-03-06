// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require websocket_rails/main
//= require js-routes
//= require_tree .


function slider (owningClass, submissiveClass){
    $(owningClass).click(function(){
        // If block invisible then make visible with slide down.
        if ($(submissiveClass).css('display') == "none" ) {
            $(submissiveClass).slideDown(500);
        }
        // If block visible then make invisible with slide up.
        else {
            $(submissiveClass).slideUp(500);
        }
    });
}

function clicker (owningClass, jsRoutePath, method){
    $(owningClass).click(function(){
        $.method(jsRoutePath);
    });
}

function tiker (cssSelector, action) {
    $(cssSelector).load(action)
}

$(document).ready(function(){

    // Function for top menu buttons.
    clicker(".to-traps-btn", Routes.traps_path, get)
    slider('#about-btn', '.about');
    slider('#login-btn', '.login');
});
