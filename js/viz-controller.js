$(document).ready(function() {
	$('#view_selection .cbp-hssubmenu a, #view_selection a.top_level_menu_link').click(function() {
		var view_type = $(this).attr('id');
		if(view_type === 'reason_for_stop') {
			$('footer p').html('Each dot represents 1,000 stops. The categories are pulled directly from the NYPD’s own form, which officers complete after each stop. Officers can select multiple reasons per stop.');
		}
		else if(view_type === 'reason_for_frisk') {
			$("footer p").html("Each dot represents 1,000 stops. The categories are pulled directly from the NYPD’s own form, which officers complete after each stop. Officers can select multiple reasons per stop involving a frisk.");
		}
		else if(view_type === 'race') {
			$('footer p').html('Each dot represents 1,000 stops. The categories are pulled directly from the NYPD’s own form, which officers complete after each stop.');
		}            else if(view_type === 'related') {
			$('footer p').html('');
		}
		else {
			$("footer p").html('Each dot represents 1,000 stops.');
		}            
		$('#view_selection .cbp-hssubmenu a').removeClass('active');
		$(this).toggleClass('active');
		toggle_view(view_type);
		return false;
	});
	var menu = new cbpHorizontalSlideOutMenu(document.getElementById('cbp-hsmenu-wrapper'));
});
