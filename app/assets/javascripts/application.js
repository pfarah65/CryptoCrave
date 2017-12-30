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
//= require jquery_ujs
//= require tether
//= require bootstrap-sprockets
//= reuiqre bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .
document.addEventListener("turbolinks:load", function() {
  tinymce.remove();
  tinymce.init({ 
  	  	height: '450',
  	selector:'textarea#post_body', 
  	plugins: 'codesample, wordcount, image, media, link, code,',
  	//space sensitive!
  	toolbar: "undo redo | fontsizeselect | fontselect | bold italic | codesample | image | media | link | code"
  	//font_formats: 'Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;AkrutiKndPadmini=Akpdmi-n'
  });

})