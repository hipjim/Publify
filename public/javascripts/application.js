// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery.ajaxSetup({
 'beforeSend': function(xhr) {xhr.setRequestHeader("accept", "text/javascript")}
})

//expand or contract starting from root
jQuery(function($) {
  $('.expand')
	.live('click', function() {
		$(this).attr({src: "images/contract.gif", alt: "contracting ...", class: "contract", id: "contract_" + $(this).attr("id").split("_")[1]});
		$.post("/locexp", {id: $(this).attr("id")}, null, "script");
    	return false;
  	})

  $('.contract').live('click', function() {
	$(this).attr({src: "images/expand.gif", alt: "expanding ...", class: "expand", id: "expand_" + $(this).attr("id").split("_")[1]});
	$.post("/loccon", {id: $(this).attr("id")}, null, "script");
    return false;
  });
});

