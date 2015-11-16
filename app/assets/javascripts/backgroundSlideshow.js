$(document).ready(function($){
	$(function() {
		$('.background-slideshow img:gt(0)').hide();

		setInterval(function () {
		    $('.background-slideshow :first-child').fadeOut()
		                             .next('img')
		                             .fadeIn()
		                             .end()
		                             .appendTo('.background-slideshow');
		}, 10000); // 4 seconds
	});
});