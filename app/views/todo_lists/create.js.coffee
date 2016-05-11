formContainer = $('#form-container')
addNewListDiv = formContainer.prev()

formContainer.slideUp 'slow', ->
  addNewListDiv.slideDown 'fast'
  formContainer.html ''

$('#main-list .list-group-item:last').after '<%= j render @todo_list %>'
