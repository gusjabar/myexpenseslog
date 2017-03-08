window.ExpensiveServices =(() ->
  console.log "Load Services"
  #private methods
  createNewExpensive = (doneLoadSubcategoriesModal, failCreateNewExpensive) ->
    $.get("/expensives/new")
      .done(doneLoadSubcategoriesModal)
      .fail(failCreateNewExpensive)
    return

  loadSubcategories = (categoryId, doneLoadSubcategories, failLoadSubcategories) ->
    console.log "load data"
    $.ajax(
      url: "/api/catalog/getSubcategories/" + categoryId
      dataType: "html")
      .done(doneLoadSubcategories)
      .fail(failLoadSubcategories)
    return

  #public methods
  return {
    createNewExpensive: createNewExpensive,
    loadSubcategories: loadSubcategories
  })()