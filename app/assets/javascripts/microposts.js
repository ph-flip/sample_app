function charCountDown() {
	var remaining_char = 140 - jQuery('#micropost_content').val().length;
	jQuery('.countdown').text(remaining_char + ' characters remaining');
}

jQuery(document).ready(function($) {
	charCountDown();
	$('#micropost_content').change(charCountDown);
	$('#micropost_content').keyup(charCountDown);
})