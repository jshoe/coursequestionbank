// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets
//= require highcharts
//= require highcharts/highcharts-more
//= require highcharts/modules/solid-gauge
//= require zeroclipboard
//= require highcharts/adapters/standalone-framework
//= require clipboard

clipboard = undefined;
alert_check = false;

jQuery(document).ready(function() {
	$('.d_clip_button').show();
	clipboard = new Clipboard('.d_clip_button', {
	    text: function(trigger) {
	    	var button_id = trigger.getAttribute('id')
	    	var question_num = button_id.charAt(button_id.length - 1)
	        $.ajax({
				type: "GET",
				async: false,
				context: this,
				url: 'problems/'+ question_num + '/minorupdate',
				success: function (source) {
	                question_source = source;
				}
			});
			return question_source
    	}
	});
	clipboard.on('success', function(e) {
		alert("Source code copied to clipboard!");
		btn = document.getElementById(e.trigger.id);
		btn.innerHTML = "Source Code Clipped";
		btn.classList.remove('btn-default');
		btn.classList.add('btn-info');
	    console.log(e);
	});
	clipboard.on('error', function(e) {
	    console.log(e);
	});

	$('.check_all').show();
	$('.check_all').change(function () {
		var group = $(this).attr('id').substring('check_all_'.length);
    $('.check_box_' + group).prop('checked', $(this).prop('checked'));
	});

});

var LoginPanel = {
	setup: function() {

		var IdentityPanel = $('#choose-identity');
		var BackButton = $('#back');
		var LoginButton = $('#login');

		IdentityPanel.hide();
		BackButton.hide();

		LoginButton.click(function() {
			BackButton.show();
			LoginButton.hide();
			IdentityPanel.show();
			return false;
		});

		BackButton.click(function() {
			BackButton.hide();
			LoginButton.show();
			IdentityPanel.hide();
			return false;
		});
	}
}
$(LoginPanel.setup);

// Commented Legacy Code
	// var clip = new Clipboard('.d_clip_button');
	// clip.on('success', function(e){console.info('Text:', e.text)});
	// console.log(clip);
	// $(".d_clip_button").on("click", function(){
	// 	alert("Source code copied to clipboard!");
	// });
	// $('.maintable').find('.answers').hide(); //Hide/close all containers
	// $('.maintable').find('.additional').hide();
	// $('.text').addClass('toggler').removeClass('text');
	// $('.maintable').find('.toggler').addClass('text').removeClass('toggler');
	// $('.icon').click(function(){

	// 	$('#q' + $(this).attr('id')).find('.answers').toggle();
	// 	$('#q' + $(this).attr('id')).find('.additional').toggle();
	// 	$('#q' + $(this).attr('id')).find('.text, .toggler').toggleClass("text toggler");
	// 	$('#q' + $(this).attr('id')).find('.colname, .toggler2').toggleClass("colname toggler2");
	// 	$(this).toggleClass("glyphicon glyphicon-chevron-right icon glyphicon glyphicon-chevron-down icon")
	// 	$('#q' + $(this).attr('id')).find('.colname, .toggler2').toggleClass("colname toggler2");
	// });
