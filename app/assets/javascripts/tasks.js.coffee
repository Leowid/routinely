$(document).ready( ->
$('.delete_task').live('ajax:success', ->
$(this).closest('tr').fadeOut();
);
);