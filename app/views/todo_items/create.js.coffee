formContainer = $('#form-container')
addNewItemDiv = formContainer.prev()

formContainer.slideUp 'slow', ->
  addNewItemDiv.slideDown 'fast'
  formContainer.html ''

$('#main-list .list-group-item:last').after '<%= j render @todo_item %>'
