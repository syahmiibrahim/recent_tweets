$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  	$('#submit-tweet').click(function(event){
  		event.preventDefault();
  		$('#loading_img').show();
  		$.ajax({
  			url: "/tweet/search",
  			method: "POST",
  			data: $("#fetch-tweets").serialize(),
  			cache: false,
  			success: function(response){
  				$("#status").html(response);
  				$("#loading_img").hide();
  			},
  			error: function(){
  				$("#status").html("</br>Unable to search the Tweethandle")
  				$("#loading_img").hide();
  			}
  		// }).done(function(response){
  		// 	$('#status').html(response);
  		// 	$('#loading_img').hide();
  		});
  	});
});
