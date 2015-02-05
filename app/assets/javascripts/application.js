// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require fancybox
//= require turbolinks
//= require_tree .

/* login */

$(document).ready(function() {
  $("a.fancybox").fancybox();
  tpl: {
      closeBtn: '<a title="Close" class="fancybox-item fancybox-close myClose glyphicon glyphicon-remove" href="javascript:;" style="background-image:none;"></a>'
    }
});

$(':button').click(function() {
    parent.$.fancybox.close();
})



$("#SelectionButton").click(function(event) {


      var htmlToInsert = ('<p> Poop </p>');

      //manually insert this html string after first row
      $(htmlToInsert).insertAfter( $(".test") );

});
