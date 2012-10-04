$(document).ready(function($) {
	charCountDown();
	$('#micropost_content').change(charCountDown);
	$('#micropost_content').keyup(charCountDown);
})

function charCountDown() {
	var remaining_char = 140 - $('#micropost_content').val().length;
	var char_count = $('.countdown').text(remaining_char + ' characters remaining');
	
	if (remaining_char < 0) {
		char_count.css('color', 'red');
	} else {
		char_count.css('color', 'gray');
	}
}
