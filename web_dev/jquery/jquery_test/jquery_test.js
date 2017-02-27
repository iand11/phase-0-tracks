$(function(){
	$("#click-me-button").click(function(){
		$("img").slideUp(3000).slideDown(3000, function(){
			alert("The picture just slid up and down!!")
		});
	});

	$("#yelling-woman").mouseenter(function(){
		$("#yelling-woman").animate({
			left: '250px',
       		height: '+=150px',
        	width: '+=150px',
        	
		});
	});




});