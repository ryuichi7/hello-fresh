
$(window).bind('page:change', function() {
	$('div.panel-body form').hide();
	clickSearch();
})

function clickSearch() {
	$('div.panel-body p').click(toggleForm);
}

function toggleForm() {
	$('div.panel-body form').toggle(1000);
}