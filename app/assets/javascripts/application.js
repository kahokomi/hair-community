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
//= require jquery
//= require popper
//= require rails-ujs
//= require bootstrap-sprockets
//= require bxslider
//= require activestorage
//= require turbolinks
//= require_tree .

/*global $*/
// $(function(){
//   setTimeout("$('.time-limit').fadeOut('slow')", 1500)
// })

// メッセージログの動作づけ
$(function() {
  setTimeout(function(){
    $('.time-limit')
      .slideUp({
        duration: 500,
      })
      .fadeOut({
        duration: 500,
      });
    },2000);
});

// タブ機能
$(document).on('turbolinks:load', function(){
  $('#tab-contents .tab[id != "tab1"]').hide();

  $('#tab-menu a').on('click', function(event) {
  $("#tab-contents .tab").hide();
  $("#tab-menu .active").removeClass("active");
  $(this).addClass("active");
  $($(this).attr("href")).show();
  event.preventDefault();
  });
});

// 新着ユーザスライダー
$(document).on('turbolinks:load', function() {
  $('.bxslider').bxSlider({
    speed: 1000,
    moveSlides: 1,
    pause: 3000,
    maxSlides: 1,
    slideWidth: 200,
    autoHover: true,
    touchEnabled: false
  });
});
