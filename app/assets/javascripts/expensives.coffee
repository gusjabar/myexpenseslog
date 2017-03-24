# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/




#$(document).ready ->
  #ExpensiveIndexController.init

  ###$(".js-new-subcategory").hide()

  $('#btnAddNewExpensive').on 'click', ->

    url = $('#newExpensiveModal').data('url')
    $.get url, (data) ->
      dialog = bootbox.dialog(
        title: "New Expensive"
        message: data
        closeButton: true)
      dialog.init ->
        $(".bootbox").removeAttr("tabindex")#fix not focus in input search
        $('select').select2 theme: 'bootstrap'
        $("span.select2.select2-container").removeAttr("style")#fix width
        $(".select2 .select2-container").css("width","100%")#fix width
        onInit_select_category()
      return
    return



onInit_select_category =() ->
  $("#expensive_category_id").on 'change', ->
    $('#expensive_subcategory_id').empty()
    $('#expensive_subcategory_id').select2 placeholder: "Select a Subcategory"
    categoryId = $("#expensive_category_id").val()
    console.log categoryId
    url = "/api/catalog/getSubcategories/" + categoryId
    loadSubcategories url

#Load Subcategories
loadSubcategories = (url) ->
  console.log "load data"
  $.ajax
    url: url
    dataType: "html"
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "AJAX Error: #{textStatus}"

    success: (data, textStatus, jqXHR) ->
      $('#expensive_subcategory_id').select2
        theme: "bootstrap"

      category = JSON.parse data
      subcategories = category["Subcategory"]

      if subcategories.length > 0
        $(".js-new-subcategory").hide()
        $('#expensive_subcategory_id').prop('disabled', false)

        $.each subcategories, (index)->
          $('#expensive_subcategory_id')
            .append("<option value=" + subcategories[index]["id"] + ">" + subcategories[index]["Name"] + "</option>");
      else
        $('#expensive_subcategory_id')
          .append("<option value='-1'> Subcategory is requierd</option>");
        $('#expensive_subcategory_id').prop('disabled', true)
        $(".js-new-subcategory").show()###







