$ ->
  # attach click handler to '.mark-done' links
  $('#main-list').on 'click', '.mark-done', (e) ->
    e.preventDefault()
    markDone = $(@)
    done = !markDone.data 'done'
    listId = markDone.data 'list'
    itemId = markDone.data 'item'
    $.ajax
      url: "#{listId}/todo_items/#{itemId}"
      method: 'POST'
      data:
        _method: 'put'
        todo_item:
          done: done
      context: markDone
      success: ->
        markDone.data('done', done)
        badge = markDone.find('span')
        if done is true
          badge
            .removeClass 'glyphicon-exclamation-sign pending'
            .addClass 'glyphicon-ok-sign done'
        else
          badge
            .removeClass 'glyphicon-ok-sign done'
            .addClass 'glyphicon-exclamation-sign pending'
      error: (e, ts, et)->
        alert et
