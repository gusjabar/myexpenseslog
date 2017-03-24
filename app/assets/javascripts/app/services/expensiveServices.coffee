window.ExpensiveServices =(() ->
  console.log "Load Services"
  #private methods
  createNewExpensive = (doneCreateNewExpensiveModal, failCreateNewExpensiveModal) ->
    $.get("/expensives/new")
      .done(doneCreateNewExpensiveModal)
      .fail(failCreateNewExpensiveModal)
    return

  loadSubcategories = (categoryId, doneLoadSubcategories, failLoadSubcategories) ->
    console.log "load data"
    $.ajax(
      url: "/api/catalog/getSubcategories/" + categoryId
      dataType: "html")
      .done(doneLoadSubcategories)
      .fail(failLoadSubcategories)
    return

  failCreateNewExpensiveModal = () ->
    console.log "Fail to create a new expense"
    return

  doneCreateNewExpensiveModal= () ->
    console.log "Done"

  #public methods
  return {
    createNewExpensive: createNewExpensive,
    failCreateNewExpensiveModal: failCreateNewExpensiveModal,
    loadSubcategories: loadSubcategories,
    doneCreateNewExpensiveModal: doneCreateNewExpensiveModal
  })()